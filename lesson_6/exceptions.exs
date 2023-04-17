defmodule Demo do
  def run do
    try do
      #1 / 0
      #{ :ok, io_dev } = File.open("demo.txt")
      raise ArithmeticError, "ERROR"
    rescue
      error in ArithmeticError -> IO.inspect(error)
      MatchError -> IO.puts("cannot open file")
      error -> IO.inspect(error)
    end
  end
end

Demo.run()
