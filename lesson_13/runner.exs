defmodule MyLib do
  defmacro test(arg) do
    q = quote do#bind_quoted: [arg: arg] do
      var!(a) = 100
      if true do
        IO.inspect("yes")
      end
      # unquote(arg) |> IO.inspect
      # Process.sleep 2000
      # unquote(arg) |> IO.inspect
    end

    q
  end
end

defmodule Runner do
  require MyLib

  def run do
    a = 42
    :os.system_time |> MyLib.test
    IO.inspect(a)
  end
end

Runner.run
