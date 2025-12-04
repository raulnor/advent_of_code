defmodule AdventOfCode do
  # ANSI escape codes
  @green IO.ANSI.green()
  @red IO.ANSI.red()
  @reset IO.ANSI.reset()

  def run(year, day) do
    module = Module.concat([String.to_atom("Year#{year}Day#{day}")])

    with true <- Code.ensure_loaded?(module),
         true <- function_exported?(module, :parse, 1),
         true <- function_exported?(module, :solve_part1, 1),
         true <- function_exported?(module, :solve_part2, 1) do
      {tr, input} = :timer.tc(fn -> File.read!("input/#{year}day#{day}.txt") end)
      {t0, data} = :timer.tc(fn -> module.parse(input) end)
      {t1, r1} = :timer.tc(fn -> module.solve_part1(data) end)
      {t2, r2} = :timer.tc(fn -> module.solve_part2(data) end)
      bytes = String.length(input)

      IO.puts("#{@red}***#{@green} #{year} Day #{day} #{@red}***#{@reset}")
      IO.puts("Read: #{tr} µs (#{bytes} bytes)")
      IO.puts("Parse: #{t0} µs (#{trunc(bytes / t0)} bytes / µs)")
      IO.puts("Part 1: #{r1} (#{t1} µs)")
      IO.puts("Part 2: #{r2} (#{t2} µs)")
      {:ok, tr + t0 + t1 + t2}
    else
      false -> {:not_found, 0}
    end
  end

  def run(year) do
    IO.puts("#{@red}===#{@green} #{year} #{@red}===#{@reset}")

    time =
      1..25
      |> Enum.map(fn day ->
        {_, time} = run(year, day)
        time
      end)
      |> Enum.sum()

    IO.puts("#{@red}===#{@green} #{year} total time: #{time} µs #{@red}===#{@reset}")
  end

  def run() do
    2024..2025 |> Enum.map(fn year -> run(year) end)
  end
end
