defmodule Year2024Test do
  use ExUnit.Case
  doctest AdventOfCode

  test "2024 Day 1" do
    input = "3   4\n4   3\n2   5\n1   3\n3   9\n3   3"
    assert Year2024Day1.parse(input) == {[3, 4, 2, 1, 3, 3], [4, 3, 5, 3, 9, 3]}
    assert Year2024Day1.part1(input) == 11
    assert Year2024Day1.part2(input) == 31
  end

  test "2024 Day 2" do
    input = "7 6 4 2 1\n1 2 7 8 9\n9 7 6 2 1\n1 3 2 4 5\n8 6 4 4 1\n1 3 6 7 9"
    assert Year2024Day2.parse(input) == [[7, 6, 4, 2, 1],[1, 2, 7, 8, 9],[9, 7, 6, 2, 1],[1, 3, 2, 4, 5],[8, 6, 4, 4, 1],[1, 3, 6, 7, 9]]
    assert Year2024Day2.part1(input) == 2
    assert Year2024Day2.part2(input) == 4
  end

  test "2024 Day 3" do
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    assert Year2024Day3.parse(input) == [{:mul, 2, 4}, :dont, {:mul, 5, 5}, {:mul, 11, 8}, :do, {:mul, 8, 5}]
    assert Year2024Day3.part1(input) == 161
    assert Year2024Day3.part2(input) == 48
  end
end
