# handler = fn(x) -> x * 2 end

handler = &((&1 * &1) / &2)

# handler = fn(x) -> IO.puts(x) end
# handler = &(IO.puts(&1))
handler = &IO.puts/1;
handler.("hello")
