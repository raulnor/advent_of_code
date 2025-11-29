defmodule Year2024Day2 do
  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn line -> line |> String.split() |> Enum.map(&String.to_integer/1) end)
  end

  defp safe_level?(report) do
    chunks = report |> Enum.chunk_every(2, 1, :discard)

    all_increasing = Enum.all?(chunks, fn [a, b] -> a < b end)
    all_decreasing = Enum.all?(chunks, fn [a, b] -> a > b end)
    safe_differences = Enum.all?(chunks, fn [a, b] -> abs(a - b) in 1..3 end)

    (all_increasing or all_decreasing) and safe_differences
  end

  def solve_part1(reports) do
    reports |> Enum.count(&safe_level?/1)
  end

  def solve_part2(reports) do
    reports
    |> Enum.count(fn report ->
      if safe_level?(report) do
        true
      else
        report
        |> Enum.with_index()
        |> Enum.map(fn {_value, index} -> List.delete_at(report, index) end)
        |> Enum.any?(&safe_level?/1)
      end
    end)
  end
end
