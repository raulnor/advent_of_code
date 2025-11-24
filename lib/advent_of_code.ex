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

  def run do
    input = File.read!("input/2024day1.txt")
    IO.puts("====== 2024 Day 1 ======")
    IO.puts("Part 1: #{Year2024Day1.part1(input)}")
    IO.puts("Part 2: #{Year2024Day1.part2(input)}")
  end
end
