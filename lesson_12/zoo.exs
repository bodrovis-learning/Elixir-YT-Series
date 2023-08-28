defmodule Zoo do
  defstruct title: "", animals: []

  defimpl Enumerable do
    def count(%Zoo{animals: animals}) do
      {:ok, Enum.count(animals)}
    end

    def member?(%Zoo{title: _, animals: animals}, animal) do
      {:ok, Enum.member?(animals, animal)}
    end

    # enumerable
    # accumulator --> {verb, value}
    ## :cont
    ## :halt
    ## :suspend
    # func

    # OUTPUT
    # {state, result}
    ## :done
    ## :halted
    ## :suspended

    def reduce(_, {:halt, acc}, _fun), do: {:halted, acc}

    def reduce(%Zoo{animals: animals}, {:suspend, acc}, fun) do
      {:suspended, acc, &reduce(%Zoo{animals: animals}, &1, fun)}
    end

    def reduce(%Zoo{animals: []}, {:cont, acc}, _fun), do: {:done, acc}

    def reduce(%Zoo{animals: [head | tail]}, {:cont, acc}, fun) do
      reduce(%Zoo{animals: tail}, fun.(head, acc), fun)
    end

    def slice(_) do
      { :error, __MODULE__ }
    end
  end
end

defmodule Animal do
  defstruct species: "", name: "", age: 0

  defimpl String.Chars do
    def to_string(%Animal{species: species, name: name, age: age}) do
      "#{name} (#{species}), aged #{age}"
    end
  end

end

defmodule Main do
  def run do
    tiger = %Animal{species: "tiger", name: "Mr. Tiger", age: 5}

    my_zoo = %Zoo{
      title: "KrukZoo",
      animals: [
        tiger,
        %Animal{species: "horse", name: "Amazing", age: 3},
        %Animal{species: "deer", name: "Bambi", age: 2}
      ]
    }

    my_zoo |> Enum.count() |> IO.inspect()
    my_zoo |> Enum.member?(tiger) |> IO.inspect()
    my_zoo |> Enum.reduce(
      0, fn(animal, total_age) -> animal.age + total_age end
    ) |> IO.puts

    my_zoo |> Enum.join(" | ") |> IO.inspect
  end
end

Main.run
