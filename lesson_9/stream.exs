defmodule Demo do
  def run do
    (1..1_000_000) |>
    Enum.map(&(&1 + 1)) |>
    Enum.filter(&(rem(&1, 2) == 0)) |>
    Enum.with_index |>
    Enum.take(10)
  end

  def run_lazy do
    # (1..100) |>
    # Stream.map(&(&1 + 1)) |>
    # #Enum.to_list()
    # Enum.take(10)

    (1..1_000_000) |>
    Stream.map(&(&1 + 1)) |>
    Stream.filter(&(rem(&1, 2) == 0)) |>
    Stream.with_index |>
    Enum.take(10)
  end

  def read_file do
    File.stream!("alice.txt") |>
    Enum.with_index(1) |>
    Enum.filter(fn({str, _n}) ->
      String.contains?(str, "Queen")
    end) |>
    Enum.take(3)
  end
end

Demo.read_file() |> IO.inspect()

# { time, _ } = :timer.tc(
#   Demo, :run, [ ]
# )

# IO.puts(time / 1000000.0)

# { time, _ } = :timer.tc(
#   Demo, :run_lazy, [ ]
# )

# IO.puts(time / 1000000.0)
