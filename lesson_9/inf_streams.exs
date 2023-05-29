defmodule Demo do
  def run do
    # Stream.repeatedly(fn -> :rand.uniform * 100 end) |>
    # Stream.filter(&(&1 < 50 && &1 > 20)) |>
    # Enum.take(5)

    Stream.unfold(10, fn(x) ->
      case rem(x,2) == 0 do
        true -> {x, x + 1}
        false -> {x, x + 2}
      end
    end) |>
    Enum.take(10)
  end
end

Demo.run |> IO.inspect
