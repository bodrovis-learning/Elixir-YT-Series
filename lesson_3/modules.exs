defmodule TopLevel do
  # ...
  defmodule Nested do
    def my_func?(text) do
      text |> IO.inspect
      1 + 2
    end

    def calc(a, b), do: a * b

    defp private_func do

    end
  end

  defmodule Nested2 do

  end
end

result = "hi" |> TopLevel.Nested.my_func?()
result |> IO.inspect

3 |> TopLevel.Nested.calc(2) |> IO.inspect

# defmodule TopLevel.Nested do
#   # ...
# end

# defmodule TopLevel.Nested2 do
#   # ...
# end

# IO.inspect TopLevel.Nested == :"Elixir.TopLevel.Nested"
