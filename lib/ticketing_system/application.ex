defmodule TicketingSystem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias TicketingSystem.Infra.Repositories.Sqlite.Repo, as: SQLiteRepo
  alias TicketingSystem.Infra.Services.TicketPriorityDispatcher

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: TicketingSystem.Worker.start_link(arg)
      # {TicketingSystem.Worker, arg}
      SQLiteRepo,
      {TicketPriorityDispatcher, [:priority, :priority, :common]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TicketingSystem.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
