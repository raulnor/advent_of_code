defmodule Year2024Day5 do
  def parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.reduce({MapSet.new(), []}, fn line, {rules, updates} ->
      case :binary.split(line, "|") do
        [left, right] ->
          {MapSet.put(rules, {String.to_integer(left), String.to_integer(right)}), updates}

        [_] ->
          case :binary.split(line, ",", [:global]) do
            [_] -> {rules, updates}
            nums -> {rules, [Enum.map(nums, &String.to_integer/1) | updates]}
          end
      end
    end)
    |> then(fn {rules, updates} -> {rules, Enum.reverse(updates)} end)
  end

  defp correctly_ordered?(update, rules) do
    Enum.all?(Enum.with_index(update), fn {current, i} ->
      upcoming = Enum.drop(update, i + 1)

      Enum.all?(upcoming, fn upcoming ->
        MapSet.member?(rules, {current, upcoming})
      end)
    end)
  end

  defp middle(list), do: Enum.at(list, div(length(list), 2))

  def solve_part1({rules, updates}) do
    updates
    |> Enum.filter(fn update -> correctly_ordered?(update, rules) end)
    |> Enum.map(&middle/1)
    |> Enum.sum()
  end

  def solve_part2({rules, updates}) do
    updates
    |> Enum.reject(fn update -> correctly_ordered?(update, rules) end)
    |> Enum.map(fn invalid_update ->
      Enum.sort(invalid_update, &MapSet.member?(rules, {&1, &2}))
    end)
    |> Enum.map(&middle/1)
    |> Enum.sum()
  end
end
