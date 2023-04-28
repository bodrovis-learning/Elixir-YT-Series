defmodule Demo do
  def do_that do
  	IO.puts "doing work..."

    receive do
      { sender, msg } ->
        IO.inspect sender
        IO.puts "I've received a message: #{msg}"
        send sender, {self(), "Hello to you too!"}

      after 1000 -> IO.puts "I haven't received any messages :("
    end
	end
end

pid = spawn Demo, :do_that, []
send pid, { self(), "Hello!" }

receive do
	{sender, msg} ->
  	IO.inspect sender
  	IO.puts "I've received a response: #{msg}"

	after 1000 -> IO.puts "I haven't received any response :("
end
