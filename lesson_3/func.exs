defmodule Demo do
  # Arity 1
  def mult(a), do: mult(a, a)#a * a

  # Arity 2
  def mult(a, b), do: a * b

  # def div(a, b \\ 1) do
  #   a / b
  # end

  def divide(a), do: divide(a, 1)

  def divide(a, 0), do: 0

  def divide(a, b), do: a / b
end

# Demo.mult/1
# Demo.mult/2

# Demo.mult 2

# Demo.mult 2, 3

Demo.divide(3, 0) |> IO.inspect()

Demo.divide(3) |> IO.inspect()

Demo.divide(4, 2) |> IO.inspect()
