defmodule TicketingSystem.Domain.UseCases.CreateCommonTicketTest do
  use ExUnit.Case, async: true

  alias TicketingSystem.Domain.Entities.Ticket
  alias TicketingSystem.Domain.UseCases.CreateCommonTicket
  alias TicketingSystem.Infra.Repositories.Sqlite.Repo, as: SQLiteRepo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(SQLiteRepo)
  end

  test "creates a ticket" do
    assert {:ok, ticket} = CreateCommonTicket.call()

    assert %Ticket{code: "C001", called: false, priority: false} = ticket
  end
end
