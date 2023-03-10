defmodule Demo do
  def divide(_a, 0), do: 0

  def divide(a, b) when is_number(a) and is_number(b) do
    a / b
  end

  # fallback
  def divide(_, _), do: nil
end

Demo.divide(3, "test")

# Comparison operators == > < >= <=
# Arithmetic + - *
# Boolean: and, or, !
# in
# ++ <>
# Type-check functions is_number is_list is_atom
# Built-in functions abs/1 elem/2 length/1

# Task
## Demo.factorial/1
## n
## factorial(5) ==> 1 * 2 * 3 * 4 * 5
