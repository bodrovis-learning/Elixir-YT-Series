defprotocol MyProtocol do
  @fallback_to_any true
  def demo(arg)
end

defimpl MyProtocol, for: Integer do
  def demo(arg) do
    IO.puts(arg)
  end
end

defimpl MyProtocol, for: Any do
  def demo(_) do
    IO.puts "Not implemented!"
  end
end

MyProtocol.demo(false)
# MyProtocol.demo(42)
