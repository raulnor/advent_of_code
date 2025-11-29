defmodule Year2024Test do
  use ExUnit.Case
  doctest AdventOfCode

  test "2024 Day 1" do
    data = Year2024Day1.parse("3   4\n4   3\n2   5\n1   3\n3   9\n3   3")

    assert Year2024Day1.solve_part1(data) == 11
    assert Year2024Day1.solve_part2(data) == 31
  end

  test "2024 Day 2" do
    data = Year2024Day2.parse("7 6 4 2 1\n1 2 7 8 9\n9 7 6 2 1\n1 3 2 4 5\n8 6 4 4 1\n1 3 6 7 9")

    assert Year2024Day2.solve_part1(data) == 2
    assert Year2024Day2.solve_part2(data) == 4
  end

  test "2024 Day 3" do
    data = Year2024Day3.parse("xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))")

    assert Year2024Day3.solve_part1(data) == 161
    assert Year2024Day3.solve_part2(data) == 48
  end

  test "2024 Day 4" do
    data1 = Year2024Day4.parse("..X...\n.SAMX.\n.A..A.\nXMAS.S\n.X....")
    data2 = Year2024Day4.parse("MMMSXXMASM\nMSAMXMSMSA\nAMXSXMAAMM\nMSAMASMSMX\nXMASAMXAMM\nXXAMMXXAMA\nSMSMSASXSS\nSAXAMASAAA\nMAMMMXMMMM\nMXMXAXMASX")
    data3 = Year2024Day4.parse("M.S\n.A.\nM.S")
    data4 = Year2024Day4.parse(".M.S......\n..A..MSMS.\n.M.S.MAA..\n..A.ASMSM.\n.M.S.M....\n..........\nS.S.S.S.S.\n.A.A.A.A..\nM.M.M.M.M.\n..........")

    assert Year2024Day4.solve_part1(data1) == 4
    assert Year2024Day4.solve_part1(data2) == 18
    assert Year2024Day4.solve_part2(data3) == 1
    assert Year2024Day4.solve_part2(data4) == 9
  end

  test "2024 Day 5" do
    data =
      Year2024Day5.parse(
        "47|53\n97|13\n97|61\n97|47\n75|29\n61|13\n75|53\n29|13\n97|29\n53|29\n61|53\n97|53\n61|29\n47|13\n75|47\n97|75\n47|61\n75|61\n47|29\n75|13\n53|13\n\n75,47,61,53,29\n97,61,53,29,13\n75,29,13\n75,97,47,61,53\n61,13,29\n97,13,75,29,47"
      )

    assert Year2024Day5.solve_part1(data) == 143
    assert Year2024Day5.solve_part2(data) == 123
  end
end
