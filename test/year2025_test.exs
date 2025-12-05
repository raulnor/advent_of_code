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

  test "2025 Day 2" do
    sample = Year2025Day2.parse("11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
1698522-1698528,446443-446449,38593856-38593862,565653-565659,
824824821-824824827,2121212118-2121212124")

    assert Year2025Day2.solve_part1(sample) == 1_227_775_554
    assert Year2025Day2.solve_part2(sample) == 4_174_379_265
  end

  test "2025 Day 3" do
    sample =
      Year2025Day3.parse("987654321111111\n811111111111119\n234234234234278\n818181911112111")

    assert Year2025Day3.solve_part1(sample) == 357
    assert Year2025Day3.solve_part2(sample) == 3_121_910_778_619
  end

  test "2025 Day 4" do
    sample =
      Year2025Day4.parse(
        "..@@.@@@@.\n@@@.@.@.@@\n@@@@@.@.@@\n@.@@@@..@.\n@@.@@@@.@@\n.@@@@@@@.@\n.@.@.@.@@@\n@.@@@.@@@@\n.@@@@@@@@.\n@.@.@@@.@."
      )

    assert Year2025Day4.solve_part1(sample) == 13
    assert Year2025Day4.solve_part2(sample) == 43
  end

  test "2025 Day 5" do
    sample = Year2025Day5.parse("3-5\n10-14\n16-20\n12-18\n\n1\n5\n8\n11\n17\n32")

    assert Year2025Day5.solve_part1(sample) == 3
    assert Year2025Day5.solve_part2(sample) == 14
  end
end
