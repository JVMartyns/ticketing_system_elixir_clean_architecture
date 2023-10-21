{:ok, _} = Application.ensure_all_started(:ex_machina)

ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(TicketingSystem.Infra.Repositories.Sqlite.Repo, :manual)
