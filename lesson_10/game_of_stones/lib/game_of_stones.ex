defmodule GameOfStones do
  def run(initial_stones_num \\ 30) do
    GameOfStones.Client.play(initial_stones_num)
  end
end
