# Advent of Code

[Advent of Code](https://adventofcode.com/) solutions in [Elixir](https://elixir-lang.org).

## Fetch puzzle input

Download puzzle input from adventofcode.com (see cookie note below):

```bash
mix aoc.fetch <year> <day>
```

Inputs are saved to `input/<year>day<day>.txt`

### Cookie for Puzzle Inputs

Advent of Code requests users do not save or re-post puzzle inputs. You'll need a cookie to fetch yours:

```bash
export AOC_SESSION=your_session_cookie_here
```

To find your session cookie:

1. Log in to [adventofcode.com](https://adventofcode.com/)
2. Open browser developer tools (F12)
3. Go to Application/Storage → Cookies
4. Copy the value of the `session` cookie

## Run solutions

```bash
mix aoc.run <year> <day>
```

Year and day are both optional. Omitting day runs an entire year. Omitting both runs everything.

Sample output:
```
*** 2025 Day 1 ***
Read: 418 µs (16591 bytes)
Parse: 977 µs (16 bytes / µs)
Part 1: 984 (94 µs)
Part 2: 5657 (67 µs)
```

## Create a file for a new day

This creates an Elixir file with stubs for solving puzzles:

```bash
mix aoc.new <year> <day>
```

