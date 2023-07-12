defmodule GameOfStones.Application do
  use Application

  def start(_type, _opts) do
    children = [
      GameOfStones.Server
    ]

    opts = [
      strategy: :one_for_one,
      name: GameOfStones.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end
end
