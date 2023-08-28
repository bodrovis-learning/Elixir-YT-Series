defprotocol MyProtocol do
  def output(arg)
end

defmodule Product do
  defstruct title: "", price: 0

  defimpl MyProtocol do
    def output(%Product{title: title, price: price}) do
      IO.puts "Title: #{title}, price: #{price}"
    end
  end
end

defmodule Demo do
  def run do
    product = %Product{title: "demo", price: 42}
    MyProtocol.output(product)
  end
end

Demo.run
