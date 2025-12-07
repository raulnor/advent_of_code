defmodule Year2025Day6 do
  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.graphemes/1)
    |> Enum.zip_with(& &1)
    |> Enum.chunk_by(fn col -> Enum.all?(col, &(&1 == " ")) end)
    |> Enum.reject(fn chunk -> Enum.all?(hd(chunk), &(&1 == " ")) end)
    |> Enum.map(fn cols ->
      op =
        cols
        |> Enum.find_value(fn col ->
          case List.last(col) do
            " " -> nil
            c -> c
          end
        end)

      numbers = Enum.map(cols, fn col -> Enum.slice(col, 0..-2//1) end)
      {op, numbers}
    end)
  end

  def apply({"+", args}), do: Enum.sum(args)
  def apply({"*", args}), do: Enum.product(args)

  def solve_part1(data) do
    data
    |> Enum.map(fn {op, cols} ->
      numbers =
        cols
        |> Enum.zip_with(&Enum.join/1)
        |> Enum.map(&String.trim/1)
        |> Enum.map(&String.to_integer/1)

      {op, numbers}
    end)
    |> Enum.sum_by(&apply/1)
  end

  def solve_part2(data) do
    data
    |> Enum.map(fn {op, cols} ->
      numbers =
        cols |> Enum.map(fn col -> col |> Enum.join() |> String.trim() |> String.to_integer() end)

      {op, numbers}
    end)
    |> Enum.sum_by(&apply/1)
  end
end
