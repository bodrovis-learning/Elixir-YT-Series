a = 10 # assertion
# match operator

a = 10 = c
{a, b} = {1, 2, 3}
{a, b, _} = {1, 2, 3}
{a, _, _} = {1, 2, 3}
{a, b, a} = {1, 2, 3}
[1, [a, _], a] = [1, [2, 3], 2]
{age, name} = %{animal: "cat", age: 5, name: "Mr. Buttons"}
