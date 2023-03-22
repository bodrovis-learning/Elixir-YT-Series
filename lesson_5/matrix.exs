defmodule Matrix do
  def typewrite(filename) do
    File.open(filename, [:read]) |>
    handle_open()
    # {:ok, io_device}
    # {:error, reason}
  end

  defp handle_open({:ok, io_device}) do
    io_device |>
    read_by_line() |> # must return io_device
    File.close()
  end
  defp handle_open({:error, reason}), do: reason |> IO.inspect()

  defp read_by_line(io_device) do
    IO.read(io_device, :line) |> # :eof
    print_line(io_device)
  end

  defp print_line(:eof, io_device), do: io_device
  defp print_line(string, io_device) do
    do_sleep(500)

    string |>
    String.split("") |>
    Enum.each(&print_char/1)

    io_device |> read_by_line()
  end

  defp print_char(char) do
    char |> IO.write()
    do_sleep(100)
  end

  defp do_sleep(n), do: :timer.sleep(n)
end

"matrix.txt" |> Matrix.typewrite()
