["dog", "cat", "elephant", "mouse"] |> Enum.map(&String.length/1)

["dog", "cat", "elephant", "mouse"] |> Enum.filter(
  &(String.length(&1) > 3)
)

# closure
num = 3
handler = &(&1 * num)
