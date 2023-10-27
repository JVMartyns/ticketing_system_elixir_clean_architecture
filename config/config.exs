import Config

alias TicketingSystem.Infra.Persistence.SqliteRepo

config :ticketing_system,
  ecto_repos: [SqliteRepo]

config :ticketing_system, SqliteRepo,
  database: "sqlite.db",
  migrations_path: "priv/sqlite_repo/migrations"

config :ticketing_system,
  ticket_repo_impl: TicketingSystem.Infra.Repositories.Sqlite.TicketRepoImpl,
  ticket_priority_dispatcher_impl: TicketingSystem.Infra.Services.TicketPriorityDispatcherImpl

import_config "#{Mix.env()}.exs"
