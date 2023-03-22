hi = fn({name, msg}) -> IO.puts("#{msg}, #{name}!") end

hi.({"Ann", "Welcome"})
