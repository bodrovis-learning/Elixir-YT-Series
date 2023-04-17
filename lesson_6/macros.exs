defmodule Demo do
  def run(n) do
    # if n > 20 do
    #   "truthy"
    # else
    #   "falsey" # => false / nil
    # end

    # unless n > 20, do: "", else: ""

    # result = cond do
    #   n > 100 -> "large"
    #   n <= 100 and n >= 50 -> "avg"
    #   n > 20 and n < 50 -> "small"
    #   true -> "very small" # fallback
    # end

    # result = case n > 100 do
    #   true -> "large"
    #   false -> "small"
    # end

    case File.open("demo.txt") do
      { :ok, io_dev } -> IO.read(io_dev, :line)
      { :error, reason } -> IO.puts(reason)
      _ -> IO.puts("unexpected error")
    end

    # result |> IO.inspect()
  end
end

Demo.run(42)
