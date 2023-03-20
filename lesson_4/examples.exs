defmodule Demo do
  # def len([]), do: 0
  # def len([_h | tail]), do: len(tail) + 1
  def len(initial_list), do: do_len(0, initial_list)

  defp do_len(total_length, [ _h | tail ]) do
    do_len(total_length + 1, tail)
  end

  defp do_len(total_length, []), do: total_length

  # span/2
  def span(from, to), do: do_span([], from, to)

  defp do_span(l, from, to) when from > to, do: l

  defp do_span(l, from, to) do
    do_span([to | l], from, to - 1)
  end

  # max/1
  def max([ value | [ head | tail ] ]) when value < head do
    max([ head | tail])
  end

  def max([ value | [ head | tail ] ]) when value >= head do
    max([ value | tail ])
  end

  def max([ value ]), do: value
end

#[1,2,3,4] |> Demo.len() |> IO.puts()
# 2 |> Demo.span(10) |> Demo.len() |> IO.puts()#IO.inspect()
[1, 2, 10, 4] |> Demo.max() |> IO.inspect()

# keep_odd/1
# Demo.keep_odd([1, 2, 4, 10, 3, 101])
