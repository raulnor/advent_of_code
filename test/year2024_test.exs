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

    assert Year2024Day2.parse(input) == [
             [7, 6, 4, 2, 1],
             [1, 2, 7, 8, 9],
             [9, 7, 6, 2, 1],
             [1, 3, 2, 4, 5],
             [8, 6, 4, 4, 1],
             [1, 3, 6, 7, 9]
           ]

    assert Year2024Day2.part1(input) == 2
    assert Year2024Day2.part2(input) == 4
  end

  test "2024 Day 3" do
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

    assert Year2024Day3.parse(input) == [
             {:mul, 2, 4},
             :dont,
             {:mul, 5, 5},
             {:mul, 11, 8},
             :do,
             {:mul, 8, 5}
           ]

    assert Year2024Day3.part1(input) == 161
    assert Year2024Day3.part2(input) == 48
  end

  test "2024 Day 4" do
    input1 = "..X...\n.SAMX.\n.A..A.\nXMAS.S\n.X...."

    assert Year2024Day4.parse(input1) ==
             {{46, 46, 88, 46, 46, 46}, {46, 83, 65, 77, 88, 46}, {46, 65, 46, 46, 65, 46},
              {88, 77, 65, 83, 46, 83}, {46, 88, 46, 46, 46, 46}}

    assert Year2024Day4.part1(input1) == 4

    input2 =
      "MMMSXXMASM\nMSAMXMSMSA\nAMXSXMAAMM\nMSAMASMSMX\nXMASAMXAMM\nXXAMMXXAMA\nSMSMSASXSS\nSAXAMASAAA\nMAMMMXMMMM\nMXMXAXMASX"

    assert Year2024Day4.part1(input2) == 18
    input3 = "M.S\n.A.\nM.S"
    assert Year2024Day4.part2(input3) == 1

    input4 =
      ".M.S......\n..A..MSMS.\n.M.S.MAA..\n..A.ASMSM.\n.M.S.M....\n..........\nS.S.S.S.S.\n.A.A.A.A..\nM.M.M.M.M.\n.........."

    assert Year2024Day4.part2(input4) == 9
  end

  test "2024 Day 5" do
    data = Year2024Day5.parse("47|53\n97|13\n97|61\n97|47\n75|29\n61|13\n75|53\n29|13\n97|29\n53|29\n61|53\n97|53\n61|29\n47|13\n75|47\n97|75\n47|61\n75|61\n47|29\n75|13\n53|13\n\n75,47,61,53,29\n97,61,53,29,13\n75,29,13\n75,97,47,61,53\n61,13,29\n97,13,75,29,47")

    assert Year2024Day5.solve_part1(data) == 143
    assert Year2024Day5.solve_part2(data) == 123
  end
end
