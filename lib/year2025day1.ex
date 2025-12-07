defmodule Year2025Day1 do
  defp parse_line("L" <> offset), do: -String.to_integer(offset)
  defp parse_line("R" <> offset), do: +String.to_integer(offset)

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  def solve_part1(data) do
    {_dial, count} =
      data
      |> Enum.reduce({50, 0}, fn offset, {curr, count} ->
        next = Integer.mod(curr + offset, 100)
        {next, count + if(next == 0, do: 1, else: 0)}
      end)

    count
  end

  def solve_part2(data) do
    {_dial, count} =
      data
      |> Enum.reduce({50, 0}, fn offset, {curr, count} ->
        next = offset + curr
        incr = abs(div(next, 100)) + if curr != 0 && next <= 0, do: 1, else: 0
        {Integer.mod(next, 100), count + incr}
      end)

    count
  end
end
