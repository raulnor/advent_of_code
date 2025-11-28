defmodule AdventOfCode do
  def run(year, day) do
    module = Module.concat([String.to_atom("Year#{year}Day#{day}")])

    with true <- Code.ensure_loaded?(module),
         true <- function_exported?(module, :parse, 1),
         true <- function_exported?(module, :solve_part1, 1),
         true <- function_exported?(module, :solve_part2, 1) do
      input = File.read!("input/#{year}day#{day}.txt")

      {t0, data} = :timer.tc(fn -> module.parse(input) end)
      {t1, r1} = :timer.tc(fn -> module.solve_part1(data) end)
      {t2, r2} = :timer.tc(fn -> module.solve_part2(data) end)

      IO.puts("====== #{year} Day #{day} ======")
      IO.puts("Parse: #{t0} µs")
      IO.puts("Part 1: #{r1} (#{t1} µs)")
      IO.puts("Part 2: #{r2} (#{t2} µs)")
      {:ok, t0 + t1 + t2}
    else
      false -> {:not_found, 0}
    end
  end

  def run(year) do
    time = 1..25 |> Enum.map(fn day ->
      {_, time} = run(year, day)
      time
    end)
    |> Enum.sum()
    IO.puts("*** #{year} total time: #{time} µs")
  end

  def run() do
    2024..2025 |> Enum.map(fn year -> run(year) end)
  end
end
