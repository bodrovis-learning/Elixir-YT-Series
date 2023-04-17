# defmodule Demo do
#   @default_opts [ mode: "r", filename: "demo.txt" ]

#   def run(_arg, opts \\ []) do
#     opts = Keyword.merge(@default_opts, opts)
#     opts |> IO.inspect()
#   end
# end

# Demo.run(42, mode: "a+")

defmodule User do
  defstruct name: "",
            surname: "",
            age: 0,
            role: :member

  def show(%User{name: name, surname: surname}) when name != "" do
    #user |> IO.inspect()
    IO.puts "Name: #{name}, surname: #{surname}"
    #IO.puts "Name: #{user.name}, surname: #{user.surname}"
  end

  def update(user = %User{}, new_name) do
    %User{ user | name: new_name }
  end
end

defmodule Department do
  defstruct title: "",
            employees: [],
            head: %User{}
end

defmodule Demo do
  def run do
    user = %User{ name: "John", surname: "Doe", age: 40, role: :admin }

    user |> User.show()

    updated_user = user |> User.update("Jim")

    updated_user |> User.show()

    department = %Department{
      title: "Demo",
      employees: [updated_user],
      head: updated_user
    }

    user = %User{ name: "Ann", surname: "Smith", age: 20, role: :member }

    department = %Department {
      department | employees: [ user | department.employees ]
    }

    department |> IO.inspect()

    department = update_in(department.head.age, &(&1 + 1))
    department = put_in(department.head.name, "John")

    department |> IO.inspect()
  end
end

Demo.run()
