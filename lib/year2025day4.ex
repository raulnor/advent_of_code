defmodule Year2025Day4 do
  @directions [{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}]

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

  defp put(grid, row, col, value) do
    old_row = elem(grid, row)
    new_row = put_elem(old_row, col, value)
    put_elem(grid, row, new_row)
  end

  defp accessible?(grid, row, col) do
    Enum.count(@directions, fn {dr, dc} -> get(grid, row + dr, col + dc) == ?@ end) < 4
  end

  def solve_part1(data) do
    rows = tuple_size(data)
    cols = tuple_size(elem(data, 0))

    for row <- 0..(rows - 1),
        col <- 0..(cols - 1),
        get(data, row, col) == ?@,
        accessible?(data, row, col),
        reduce: 0 do
      acc -> acc + 1
    end
  end

  def solve_part2(data, acc \\ 0, candidates \\ nil) do
    rows = tuple_size(data)
    cols = tuple_size(elem(data, 0))

    rolls =
      case candidates do
        nil ->
          for row <- 0..(rows - 1),
              col <- 0..(cols - 1),
              get(data, row, col) == ?@,
              accessible?(data, row, col),
              into: [],
              do: {row, col}

        _ ->
          for {row, col} <- candidates,
              get(data, row, col) == ?@,
              accessible?(data, row, col),
              into: [],
              do: {row, col}
      end

    case rolls do
      [] ->
        acc

      _ ->
        new_data = Enum.reduce(rolls, data, fn {row, col}, acc -> put(acc, row, col, ?x) end)

        neighbors =
          for {r, c} <- rolls,
              {dr, dc} <- @directions,
              do: {r + dr, c + dc},
              uniq: true

        solve_part2(new_data, acc + length(rolls), neighbors)
    end
  end
end
