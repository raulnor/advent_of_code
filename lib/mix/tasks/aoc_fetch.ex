defmodule Mix.Tasks.Aoc.Fetch do
  @shortdoc "Download puzzle inputs"
  use Mix.Task

  @impl Mix.Task
  def run([year, day]) do
    year = String.to_integer(year)
    day = String.to_integer(day)
    fetch(year, day)
  end

  def run(_) do
    Mix.shell().error("Usage: mix aoc.fetch <year> <day>")
  end

  def fetch(year, day) do
    {:ok, _} = Application.ensure_all_started(:httpoison)

    session =
      System.get_env("AOC_SESSION") ||
        raise "Set AOC_SESSION environment variable"

    url = "https://adventofcode.com/#{year}/day/#{day}/input"

    headers = [
      {"User-Agent", "Elixir AoC Fetcher"},
      {"Cookie", "session=#{session}"}
    ]

    case HTTPoison.get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        File.mkdir_p!("input")
        File.write!("input/#{year}day#{day}.txt", body)
        Mix.shell().info("✓ Fetched year #{year}, day #{day}")

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        Mix.shell().error("✗ Day #{day} not found for year #{year}")

      {:ok, %HTTPoison.Response{status_code: status}} ->
        Mix.shell().error("✗ HTTP #{status}")

      {:error, reason} ->
        Mix.shell().error("✗ Request failed: #{inspect(reason)}")
    end
  end
end
