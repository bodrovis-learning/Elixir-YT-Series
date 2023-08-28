defimpl Enumerable, for: Integer do
  def count(arg) do
    {:ok, Integer.digits(arg) |> Enum.count()}
  end
end

Enum.count(42) |> IO.inspect
