defmodule AdventOfCode do
  @moduledoc """
  Documentation for `AdventOfCode`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AdventOfCode.hello()
      :world

  """
  def hello do
    :world
  end

  def run(year, day) do
    input = File.read!("input/#{year}day#{day}.txt")
    module = Module.concat([String.to_atom("Year#{year}Day#{day}")])
    f0 = String.to_atom("parse")
    f1 = String.to_atom("part1")
    f2 = String.to_atom("part2")
    {t0, _} = :timer.tc(fn -> apply(module, f0, [input]) end)
    {t1, r1} = :timer.tc(fn -> apply(module, f1, [input]) end)
    {t2, r2} = :timer.tc(fn -> apply(module, f2, [input]) end)
    IO.puts("====== #{year} Day #{day} ======")
    IO.puts("Parse: #{t0} µs")
    IO.puts("Part 1: #{r1} (#{t1} µs)")
    IO.puts("Part 2: #{r2} (#{t2} µs)")
  end

  def run_all do
    run(2024, 1)
    run(2024, 2)
    run(2024, 3)
    run(2024, 4)
  end
end
