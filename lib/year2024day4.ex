defmodule Year2024Day4 do
  def parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      line |> String.to_charlist() |> List.to_tuple()
    end)
    |> List.to_tuple()
  end

  defp get(grid, row, col) do
    if row >= 0 && row < tuple_size(grid) && col >= 0 && col < tuple_size(elem(grid, 0)) do
      grid |> elem(row) |> elem(col)
    else
      nil
    end
  end

  def solve_part1(data) do
    rows = tuple_size(data)
    cols = tuple_size(elem(data, 0))
    {n, e, w, s} = {-1, 1, -1, 1}
    directions = [{n, w}, {n, 0}, {n, e}, {0, w}, {0, e}, {s, w}, {s, 0}, {s, e}]

    for row <- 0..(rows - 1),
        col <- 0..(cols - 1),
        get(data, row, col) == ?X,
        {dr, dc} <- directions,
        get(data, row + dr, col + dc) == ?M,
        get(data, row + 2 * dr, col + 2 * dc) == ?A,
        get(data, row + 3 * dr, col + 3 * dc) == ?S,
        reduce: 0 do
      acc -> acc + 1
    end
  end

  def cross_mas?(data, row, col) do
    if get(data, row, col) == ?A do
      sw = get(data, row - 1, col - 1)
      se = get(data, row - 1, col + 1)
      nw = get(data, row + 1, col - 1)
      ne = get(data, row + 1, col + 1)

      (nw == ?M and ne == ?S and sw == ?M and se == ?S) or
        (nw == ?M and ne == ?M and sw == ?S and se == ?S) or
        (nw == ?S and ne == ?M and sw == ?S and se == ?M) or
        (nw == ?S and ne == ?S and sw == ?M and se == ?M)
    else
      false
    end
  end

  def solve_part2(data) do
    rows = tuple_size(data)
    cols = tuple_size(elem(data, 0))

    for row <- 0..(rows - 1),
        col <- 0..(cols - 1),
        cross_mas?(data, row, col),
        reduce: 0 do
      acc -> acc + 1
    end
  end
end
