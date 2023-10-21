import Config

alias TicketingSystem.Infra.Repositories.Sqlite.Repo, as: SQLiteRepo

config :ticketing_system,
  ecto_repos: [SQLiteRepo]

config :ticketing_system, SQLiteRepo,
  database: "sqlite.db",
  migrations_path: "priv/repo/migrations/sqlite/"

config :ticketing_system,
  ticket_repo_impl: TicketingSystem.Infra.Repositories.Sqlite.TicketRepoImpl

import_config "#{Mix.env()}.exs"
