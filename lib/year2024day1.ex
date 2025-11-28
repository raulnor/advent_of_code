defmodule Year2024Day1 do
  def part1(input) do
    input |> parse() |> solve_part1()
  end

  def part2(input) do
    input |> parse() |> solve_part2()
  end

  def parse(input) do
    ~r/(\d+)\s+(\d+)/
    |> Regex.scan(input)
    |> Enum.reduce({[], []}, fn [_, l, r], {lefts, rights} ->
      {[String.to_integer(l) | lefts], [String.to_integer(r) | rights]}
    end)
  end

  defp solve_part1({left, right}) do
    Enum.zip(left |> Enum.sort(), right |> Enum.sort())
    |> Enum.map(fn {left, right} -> if left > right, do: left - right, else: right - left end)
    |> Enum.sum()
  end

  defp solve_part2({left, right}) do
    frequencies = Enum.frequencies(right)

    left
    |> Enum.map(fn lhs -> lhs * Map.get(frequencies, lhs, 0) end)
    |> Enum.sum()
  end
end
