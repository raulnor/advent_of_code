defmodule Year2025Day5 do
  def parse(input) do
    {
      Regex.scan(~r/^(\d+)-(\d+)$/m, input)
      |> Enum.map(fn [_match, x, y] ->
        String.to_integer(x)..String.to_integer(y)
      end),
      Regex.scan(~r/^(\d+)$/m, input)
      |> Enum.map(fn [_match, x] ->
        String.to_integer(x)
      end)
    }
  end

  defp count_in_ranges([], _, acc), do: acc
  defp count_in_ranges(_, [], acc), do: acc

  defp count_in_ranges([i | rest], [lo.._hi//1 | _] = ranges, acc) when i < lo do
    count_in_ranges(rest, ranges, acc)
  end

  defp count_in_ranges([i | rest], [lo..hi//1 | _] = ranges, acc) when i >= lo and i <= hi do
    count_in_ranges(rest, ranges, acc + 1)
  end

  defp count_in_ranges(ingredients, [_ | rest], acc) do
    count_in_ranges(ingredients, rest, acc)
  end

  def solve_part1({ranges, ingredients}) do
    count_in_ranges(ingredients |> Enum.sort(), ranges |> Enum.sort() |> connect_ranges(), 0)
  end

  def connect_ranges([]), do: []
  def connect_ranges([range]), do: [range]

  def connect_ranges([lo_1..hi_1//1, lo_2..hi_2//1 | rest]) do
    if lo_2 <= hi_1 + 1 do
      connect_ranges([lo_1..max(hi_1, hi_2)//1 | rest])
    else
      [lo_1..hi_1//1 | connect_ranges([lo_2..hi_2//1 | rest])]
    end
  end

  def solve_part2({ranges, _ingredients}) do
    ranges
    |> Enum.sort()
    |> connect_ranges()
    |> Enum.map(&Range.size/1)
    |> Enum.sum()
  end
end
