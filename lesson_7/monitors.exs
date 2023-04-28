defmodule Demo do
  def do_work do
  	IO.puts "doing work..."
  	exit(:error)
	end
end

spawn_monitor Demo, :do_work, []

receive do
	msg -> IO.puts "The monitored process says: #{inspect(msg)}"
	after 5000 -> IO.puts "The monitored process says nothing."
end
