import Config

alias TicketingSystem.Infra.Repositories.Sqlite.Repo, as: SQLiteRepo

config :ticketing_system, SQLiteRepo,
  database: "sqlite.db",
  migrations_path: "priv/repo/migrations/sqlite/",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10,
  log: false
