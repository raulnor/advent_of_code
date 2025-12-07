defmodule Year2025Day7 do
  def parse(input) do
    lines = input |> String.split("\n", trim: true)
    manifold_length = length(lines)

    start_col =
      hd(lines)
      |> String.to_charlist()
      |> Enum.find_index(fn char -> char == ?S end)

    splitters =
      for {line, row} <- Enum.with_index(lines),
          {char, col} <- Enum.with_index(String.to_charlist(line)),
          char == ?\^,
          into: MapSet.new() do
        {col, row}
      end

    {{start_col, 0}, manifold_length, splitters}
  end

  defp beam_generation(row, manifold_length, splitters, beams, hits) do
    if row == manifold_length do
      hits
    else
      {new_beams, new_hits} =
        Enum.reduce(beams, {beams, hits}, fn beam, {beams, hits} ->
          if MapSet.member?(splitters, {beam, row}) do
            {beams |> MapSet.delete(beam) |> MapSet.put(beam - 1) |> MapSet.put(beam + 1),
             hits + 1}
          else
            {beams, hits}
          end
        end)

      beam_generation(row + 1, manifold_length, splitters, new_beams, new_hits)
    end
  end

  def solve_part1({{col, _row}, manifold_length, splitters}) do
    beam_generation(0, manifold_length, splitters, MapSet.new([col]), 0)
  end

  defp beam_split_memo({col, row}, manifold_length, splitters, cache) do
    new_row = row + 1

    if new_row == manifold_length do
      1
    else
      case :ets.lookup(cache, {col, new_row}) do
        [{_, cached_result}] ->
          cached_result

        [] ->
          result =
            if MapSet.member?(splitters, {col, new_row}) do
              beam_split_memo({col - 1, new_row}, manifold_length, splitters, cache) +
                beam_split_memo({col + 1, new_row}, manifold_length, splitters, cache)
            else
              beam_split_memo({col, new_row}, manifold_length, splitters, cache)
            end

          :ets.insert(cache, {{col, new_row}, result})
          result
      end
    end
  end

  def solve_part2({{col, _row}, manifold_length, splitters}) do
    cache = :ets.new(:beam_cache, [:set, :private])
    result = beam_split_memo({col, 0}, manifold_length, splitters, cache)
    :ets.delete(cache)
    result
  end
end
