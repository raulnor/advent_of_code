defmodule Year2024Day3 do
  def part1(input) do
    input |> parse() |> solve_part1()
  end

  def part2(input) do
    input |> parse() |> solve_part2()
  end

  def parse(input) do
    pattern = ~r/(mul\((\d+),(\d+)\))|(do\(\))|(don't\(\))/

    Regex.scan(pattern, input)
    |> Enum.map(fn match ->
      case match do
        [_match, _match2, x, y] -> {:mul, String.to_integer(x), String.to_integer(y)}
        ["do()", "", "", "", "do()"] -> :do
        ["don't()", "", "", "", "", "don't()"] -> :dont
      end
    end)
  end

  defp solve_part1(data) do
    data
    |> Enum.map(fn instruction ->
      case instruction do
        {:mul, x, y} -> x * y
        _ -> 0
      end
    end)
    |> Enum.sum()
  end

  defp solve_part2(data) do
    {_toggle, result} =
      data
      |> Enum.reduce({true, 0}, fn instruction, {enabled, sum} ->
        case instruction do
          {:mul, x, y} -> if enabled, do: {true, sum + x * y}, else: {false, sum}
          :do -> {true, sum}
          :dont -> {false, sum}
        end
      end)

    result
  end
end
