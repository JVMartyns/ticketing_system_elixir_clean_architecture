defmodule TicketingSystem.Infra.Persistence.SqliteRepo.Migrations.CreateTicketTable do
  use Ecto.Migration

  def up do
    create table(:tickets) do
      add :code, :string
      add :called, :boolean, default: false
      add :priority, :boolean, default: false

      timestamps()
    end
  end

  def down do
    drop table(:tickets)
  end
end
