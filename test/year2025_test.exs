defmodule Year2025Test do
  use ExUnit.Case
  doctest AdventOfCode

  test "2025 Day 1" do
    sample = Year2025Day1.parse("L68\nL30\nR48\nL5\nR60\nL55\nL1\nL99\nR14\nL82")
    spinner = Year2025Day1.parse("R1000")

    assert Year2025Day1.solve_part1(sample) == 3
    assert Year2025Day1.solve_part2(sample) == 6
    assert Year2025Day1.solve_part2(spinner) == 10
  end
end
