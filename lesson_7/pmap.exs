defmodule Demo do
  def pmap(n) do
    (1..n) |> Enum.map(&Demo.do_spawn/1) |> Enum.map(&Demo.do_receive/1)
  end

  def do_spawn(elem) do
    f = &(&1 * &1)

    spawn_link Demo, :calc, [ self(), f, elem ]
  end

  def calc(that_process, f, elem) do
    send that_process, { self(), f.(elem) }
  end

  def do_receive(pid) do
    receive do
      { ^pid, result } -> result
    end
  end

  def run(n) do
    { ms, res } = :timer.tc(Demo, :pmap, [n])
    { ms / 1000, res }
  end
end
