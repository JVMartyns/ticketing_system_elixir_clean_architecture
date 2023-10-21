defmodule TicketingSystem.Infra.Repositories.Sqlite.Repo do
  use Ecto.Repo, otp_app: :ticketing_system, adapter: Ecto.Adapters.SQLite3
end
