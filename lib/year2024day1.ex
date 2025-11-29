defmodule Year2024Day1 do
  def parse(input) do
    {left, right} =
      Regex.scan(~r/(\d+)\s+(\d+)/, input)
      |> Enum.reduce({[], []}, fn [_, l, r], {lefts, rights} ->
        {[String.to_integer(l) | lefts], [String.to_integer(r) | rights]}
      end)

    {Enum.reverse(left), Enum.reverse(right)}
  end

  def solve_part1({left, right}) do
    Enum.zip(left |> Enum.sort(), right |> Enum.sort())
    |> Enum.map(fn {left, right} -> if left > right, do: left - right, else: right - left end)
    |> Enum.sum()
  end

  def solve_part2({left, right}) do
    frequencies = Enum.frequencies(right)

    left
    |> Enum.map(fn lhs -> lhs * Map.get(frequencies, lhs, 0) end)
    |> Enum.sum()
  end
end
