defmodule TicketingSystem.Infra.Persistence.SqliteRepo do
  use Ecto.Repo, otp_app: :ticketing_system, adapter: Ecto.Adapters.SQLite3
end
