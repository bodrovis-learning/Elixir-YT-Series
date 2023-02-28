# defmodule DemoModuleLesson1 do
#   def run(str, str2) do
#     str2 |> IO.inspect
#     # str = String.reverse(str)
#     # str = String.upcase(str)
#     # IO.inspect(str)
#     str |>
#     String.reverse() |>
#     String.upcase() |>
#     IO.inspect()
#   end
# end

# "Hello world!" |> DemoModuleLesson1.run("second string")

# Numbers:
a = 5
b = 1000
c = 3.14
d = 0.345e3
f = 1_000_000
hex = 0xfa
oct = 0o37
bin = 0b010101

a + b
a * b
a / b
rem(10, 3)
div(10, 3)

# Atoms
at = :one
a2 = :one
name = :my_name
valid = :valid?

# Boolean
:true
:false
a = true
b = false

# Nil value
:nil
nil

# Tuples
t1 = {1, "three", :four, false}
t2 = {2, {3, 4}, :dog, t1}
elem {:ok, 42}, 0
{:error, "Cannot load data..."}

my_tuple = {"cat", "dog", 3}
new_tuple = my_tuple |> put_elem(1, "snake")
new_tuple |> IO.inspect

# List
[1, 2, {3, 4}, "dog", ["cat", "snake"], :nil]

# Keyword list

my_list = [ title: "Elixir", emerged: 2011 ]
my_list |> Keyword.get(:title) # => "Elixir"
[ {:title, "Elixir"}, {:emerged, 2011} ]

# Maps
data = %{ "title" => "Elixir", :paradigm => "Functional", 2011 => "emerged" }
data[:paradigm] # => "Functional"
data.paradigm # => "Functional"
data[:unknown] # => nil
data.unknown # => error!
%{paradigm: "functional"}

# String

## Binary strings
"test"
"result: #{1 + 2}"
String.reverse("test")

## Character lists
'my string'
'result: #{1 + 2}'

# IO.gets
# String.trim
