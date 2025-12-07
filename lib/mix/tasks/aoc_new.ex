defmodule Mix.Tasks.Aoc.New do
  @shortdoc "Create empty solution"
  use Mix.Task

  def run([year, day]) do
    year = String.to_integer(year)
    day = String.to_integer(day)

    module_name = "Year#{year}Day#{day}"
    file_path = "lib/year#{year}day#{day}.ex"

    dir = Path.dirname(file_path)
    File.mkdir_p!(dir)

    content = """
    defmodule #{module_name} do
      def parse(input) do
        input
        |> String.split("\\n", trim: true)
      end

      def solve_part1(data) do
        0
      end

      def solve_part2(data) do
        0
      end
    end
    """

    if File.exists?(file_path) do
      Mix.shell().error("✗ File already exists: #{file_path}")
    else
      File.write!(file_path, content)
      Mix.shell().info("✓ Created #{file_path}")
    end
  end

  def run(_) do
    Mix.shell().error("Usage: mix aoc.new <year> <day>")
  end
end
