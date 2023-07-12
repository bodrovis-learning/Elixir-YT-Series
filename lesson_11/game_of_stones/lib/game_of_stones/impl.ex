defmodule GameOfStones.Impl do
  def do_set({player, num_stones}) when not is_integer(num_stones) or num_stones < 4 do
    {
      :stop,
      :normal,
      {
        :error,
        "You have to set at least 4 stones!"
      },
      {player, nil, :game_ended}
    }
  end

  def do_set({player, num_stones}) do
    {:reply, {:stones_set, player, num_stones}, {player, num_stones, :game_in_progress}}
  end

  def do_take({player, num_stones, current_stones})
      when not is_integer(num_stones) or
             num_stones < 1 or
             num_stones > 3 or
             num_stones > current_stones do
    {
      :reply,
      {
        :error,
        "You can take from 1 to 3 stones, and it should exceed the total count of stones!"
      },
      {player, current_stones, :game_in_progress}
    }
  end

  def do_take({player, num_stones, current_stones})
      when num_stones == current_stones do
    {
      :stop,
      :normal,
      {:winner, next_player(player)},
      {nil, 0, :game_ended}
    }
  end

  def do_take({player, num_stones, current_stones}) do
    next_p = next_player(player)

    new_stones = current_stones - num_stones

    {
      :reply,
      # response to the client
      {:next_turn, next_p, new_stones},
      # new state
      {next_p, new_stones, :game_in_progress}
    }
  end

  defp next_player(1), do: 2
  defp next_player(2), do: 1
end
