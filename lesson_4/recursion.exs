defmodule Demo do
  def ask_number do
    IO.gets("Please enter an integer: ") |>
    Integer.parse |>
    check_input
  end

  defp check_input(:error), do: ask_number()
  defp check_input({number, _}), do: number
end

Demo.ask_number() |> IO.puts
