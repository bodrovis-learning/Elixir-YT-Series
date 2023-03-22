creation_date = fn
  "elixir" -> 2011
  "ruby" -> 1995
  "cpp" -> 1985
  lang when is_bitstring(lang) -> "Not sure about #{lang}"
  _ -> nil
end

creation_date.("elixir")
creation_date.("erlang")
