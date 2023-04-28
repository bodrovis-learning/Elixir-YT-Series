defmodule Demo do
  def do_work do
  	IO.puts "doing work..."
  	# exit(:error) # :normal
    1 / 0
	end
end

Process.flag(:trap_exit, true)

spawn_link Demo, :do_work, []

receive do
  msg -> IO.puts "The linked process says: #{inspect(msg)}"
end
