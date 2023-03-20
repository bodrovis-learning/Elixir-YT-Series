# head --> 1st element of the list
# tail --> all the rest
# hd
# tl
# [ head | tail ] = [1,2,3,4]
# tail-call optimization
defmodule Demo do
  # def recur(n) do
  #   recur(n) * 2 # no optimization!
  # end

  def iterate([]), do: IO.puts("end of the list!")
  def iterate([ head | tail ]) do
    head |> IO.puts()

    tail |> iterate() # => optimization!
  end
end

Demo.iterate([1,2,3,4])
