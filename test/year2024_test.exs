defmodule Year2024Test do
  use ExUnit.Case
  doctest AdventOfCode

  test "handles the sample" do
    input = "3   4\n4   3\n2   5\n1   3\n3   9\n3   3"
    assert Year2024Day1.parse(input) == {[3, 4, 2, 1, 3, 3], [4, 3, 5, 3, 9, 3]}
    assert Year2024Day1.part1(input) == 11
    assert Year2024Day1.part2(input) == 31
  end
end
