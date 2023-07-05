defmodule GameOfStones.Server do
  use GenServer

  alias GameOfStones.Impl

  def init({:started, stones_num}) do
    # :started

    # :game_in_progress

    # :game_ended
    {:ok, {1, stones_num, :started}}
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
  # def handle_cast(:some_code, current_state) do
  #   {:noreply, new_state}
  # end
end
