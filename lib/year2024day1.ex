defmodule Year2024Day1 do
  def part1(input) do
    input |> parse() |> solve_part1()
  end

  def part2(input) do
    input |> parse() |> solve_part2()
  end

  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.map(fn line -> line |> String.split() |> Enum.map(&String.to_integer/1) end)
    |> Enum.map(fn [left, right] -> {left, right} end)
    |> Enum.unzip()
  end

  defp solve_part1({left, right}) do
    Enum.zip(left |> Enum.sort(), right |> Enum.sort())
    |> Enum.map(fn {left, right} -> if left > right, do: left - right, else: right - left end)
    |> Enum.sum()
  end

  defp solve_part2({left, right}) do
    left
    |> Enum.map(fn lhs -> lhs * Enum.count(right, fn rhs -> lhs == rhs end) end)
    |> Enum.sum()
  end
end
