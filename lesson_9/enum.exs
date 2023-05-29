defmodule Demo do
  def run do
    # [1,2] ++ [3,4]

    # [1,2] |> Enum.concat([3,4])

    # [1,2,3,4] |> Enum.join(",")

    # (1..10) |> Enum.at(5, :unknown)

    # Enum.each([1,2,3], fn(x) ->
    #   x |> IO.inspect()
    # end)

    # Enum.map([1,2,3], &(&1 ** 2))

    # [1, 3, 10, 5, -1] |> Enum.sort(&(&1 >= &2))

    # [1, 3, 10, 5, -1] |> Enum.filter(&(&1 > 0 && &1 < 8))

    # [1, 3, 10, 5, -1] |> Enum.all?(&(&1 > 0))

    (1..10) |> Enum.reduce(fn(el, acc) ->
      acc + el
    end)

    Enum.reduce(1..10, &(&1 + &2))
  end
end

Demo.run |> IO.inspect()
