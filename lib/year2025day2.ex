defmodule Year2025Day2 do
  def parse(input) do
    Regex.scan(~r/(\d+)-(\d+)/, input)
    |> Enum.map(fn [_match, x, y] ->
      String.to_integer(x)..String.to_integer(y)
    end)
  end

  def get_matching(lo..hi//1, model) do
    lo_digits = trunc(:math.log10(lo)) + 1
    hi_digits = trunc(:math.log10(hi)) + 1

    if lo_digits != hi_digits do
      pivot = trunc(:math.pow(10, hi_digits - 1))
      Enum.concat(get_matching(lo..(pivot - 1), model), get_matching(pivot..hi, model))
    else
      patterns = Enum.at(model, lo_digits)

      for {range, mask} <- patterns,
          index <- range,
          value = index * mask,
          value >= lo,
          value <= hi,
          into: MapSet.new() do
        value
      end
    end
  end

  def solve_part1(data) do
    model = [
      [],
      [],
      [{1..9, 11}],
      [],
      [{1..99, 101}],
      [],
      [{1..999, 1001}],
      [],
      [{1..9999, 10001}],
      [],
      [{1..99999, 100_001}]
    ]

    for range <- data,
        number <- get_matching(range, model),
        reduce: 0 do
      acc -> acc + number
    end
  end

  def solve_part2(data) do
    model = [
      [],
      [],
      [{1..9, 11}],
      [{1..9, 111}],
      [{1..9, 1111}, {1..99, 101}],
      [{1..9, 11111}],
      [{1..9, 111_111}, {1..99, 10101}, {1..999, 1001}],
      [{1..9, 1_111_111}],
      [{1..9, 11_111_111}, {1..99, 1_010_101}, {1..9999, 10001}],
      [{1..9, 111_111_111}, {1..999, 1_001_001}],
      [{1..9, 1_111_111_111}, {1..99, 101_010_101}, {1..99999, 100_001}]
    ]

    for range <- data,
        number <- get_matching(range, model),
        reduce: 0 do
      acc -> acc + number
    end
  end
end
