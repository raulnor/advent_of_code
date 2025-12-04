defmodule Mix.Tasks.Aoc.Run do
  @shortdoc "Run puzzle solver"
  use Mix.Task

  def run([year, day]) do
    year = String.to_integer(year)
    day = String.to_integer(day)

    AdventOfCode.run(year, day)
  end

  def run([year]) do
    year = String.to_integer(year)

    AdventOfCode.run(year)
  end

  def run(_) do
    AdventOfCode.run()
  end
end
