defmodule Year2025Day3 do
  def parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
  end

  defp select(_chars, 0, acc), do: Enum.reverse(acc)
  defp select(chars, n, acc) do
    max_index = length(chars) - n

    {char, idx} =
      chars
      |> Enum.with_index()
      |> Enum.take(max_index + 1)
      |> Enum.max_by(fn {c, _i} -> c end)

    remaining = Enum.drop(chars, idx + 1)
    select(remaining, n - 1, [char | acc])
  end

  def solve_part1(data) do
    for bank <- data,
        value = bank |> String.to_charlist |> select(2, []) |> List.to_integer,
        reduce: 0 do acc -> acc + value end
  end

  def solve_part2(data) do
    for bank <- data,
        value = bank |> String.to_charlist |> select(12, []) |> List.to_integer,
        reduce: 0 do acc -> acc + value end
  end
end
