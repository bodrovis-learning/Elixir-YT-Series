defmodule Product do
  defstruct title: "", price: 0

  defimpl String.Chars do
    def to_string(%Product{title: title, price: price}) do
      "#{title} --> #{price}"
    end
  end
end

defmodule Demo do
  def run do
    product = %Product{title: "demo", price: 42}
    IO.puts product
  end
end

Demo.run

# IO.puts

# IO.puts "test"
# IO.puts false
