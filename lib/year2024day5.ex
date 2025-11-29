defmodule Year2024Day5 do
  def part1(input) do
    input |> parse() |> solve_part1()
  end

  def part2(input) do
    input |> parse() |> solve_part2()
  end

  def parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.reduce({MapSet.new([]), []}, fn line, {rules, updates} ->
      cond do
        Regex.match?(~r/\d+\|\d+/, line) ->
          [left, right] = String.split(line, "|") |> Enum.map(&String.to_integer/1)
          {MapSet.put(rules, {left, right}), updates}

        Regex.match?(~r/\d+(,\d+)/, line) ->
          numbers = String.split(line, ",") |> Enum.map(&String.to_integer/1)
          {rules, updates ++ [numbers]}

        true ->
          {rules, updates}
      end
    end)
  end

  def correctly_ordered?(update, rules) do
    Enum.all?(Enum.with_index(update), fn {current, i} ->
        upcoming = Enum.drop(update, i + 1)
        Enum.all?(upcoming, fn upcoming ->
          MapSet.member?(rules, {current, upcoming})
        end)
      end)
  end

  def solve_part1({rules, updates}) do
    updates
    |> Enum.filter(fn update -> correctly_ordered?(update, rules) end)
    |> Enum.map(fn valid_update ->
      Enum.at(valid_update, div(length(valid_update), 2))
    end)
    |> Enum.sum()
  end

  def solve_part2({rules, updates}) do
    updates
    |> Enum.filter(fn update -> !correctly_ordered?(update, rules) end)
    |> Enum.map(fn invalid_update ->
      Enum.sort(invalid_update, &(MapSet.member?(rules, {&1, &2})))
    end)
    |> Enum.map(fn fixed_update ->
      Enum.at(fixed_update, div(length(fixed_update), 2))
    end)
    |> Enum.sum()
  end
end
