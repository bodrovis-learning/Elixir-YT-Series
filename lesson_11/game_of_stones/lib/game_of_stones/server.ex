defmodule GameOfStones.Server do
  use GenServer, restart: :transient

  alias GameOfStones.Impl

  def start_link(_) do
    GenServer.start_link(__MODULE__, :started, name: __MODULE__)
  end

  def init(:started) do
    # :started

    # :game_in_progress

    # :game_ended

    IO.puts("Booting GameOfStones server!")

    {:ok, {1, nil, :started}}
  end

  def handle_call({:set, num_stones}, _, {player, nil, :started}) do
    Impl.do_set({player, num_stones})
  end

  def handle_call(:current_state, _, {player, current_stones, _}) do
    {:reply, {player, current_stones}, {player, current_stones, :game_in_progress}}
  end

  def handle_call({:take, num_stones}, _, {player, current_stones, :game_in_progress}) do
    Impl.do_take({player, num_stones, current_stones})
  end

  def terminate(reason, state) do
    IO.inspect(reason)
    IO.inspect(state)
    "See you soon!" |> IO.puts
  end
end
