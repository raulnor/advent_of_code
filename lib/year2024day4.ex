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
    target = Enum.with_index([?X, ?M, ?A, ?S])

    Stream.flat_map(0..(rows - 1), fn row ->
      Stream.map(0..(cols - 1), fn col ->
        {row, col}
      end)
    end)
    |> Enum.filter(fn {x, y} -> get(data, x, y) == ?X end)
    |> Enum.flat_map(fn {x, y} ->
      Enum.filter(directions, fn {dx, dy} ->
        Enum.all?(target, fn {letter, index} ->
          case index do
            # checked above
            0 -> true
            i -> get(data, x + i * dx, y + i * dy) == letter
          end
        end)
      end)
    end)
    |> Enum.count()
  end

  defp match(grid, x, y, pattern) do
    rows = tuple_size(pattern)
    cols = tuple_size(elem(pattern, 0))

    Enum.all?(0..(rows - 1), fn row ->
      Enum.all?(0..(cols - 1), fn col ->
        case get(pattern, col, row) do
          ?. -> true
          ch -> ch == get(grid, x + col, y + row)
        end
      end)
    end)
  end

  def solve_part2(data) do
    rows = tuple_size(data)
    cols = tuple_size(elem(data, 0))

    patterns = [
      {
        {?M, ?., ?S},
        {?., ?A, ?.},
        {?M, ?., ?S}
      },
      {
        {?M, ?., ?M},
        {?., ?A, ?.},
        {?S, ?., ?S}
      },
      {
        {?S, ?., ?M},
        {?., ?A, ?.},
        {?S, ?., ?M}
      },
      {
        {?S, ?., ?S},
        {?., ?A, ?.},
        {?M, ?., ?M}
      }
    ]

    Stream.flat_map(0..(rows - 1), fn row ->
      Stream.map(0..(cols - 1), fn col ->
        {row, col}
      end)
    end)
    |> Enum.count(fn {x, y} ->
      Enum.any?(patterns, fn pattern ->
        match(data, x, y, pattern)
      end)
    end)
  end
end
