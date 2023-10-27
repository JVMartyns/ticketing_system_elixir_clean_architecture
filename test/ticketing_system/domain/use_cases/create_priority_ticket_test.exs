defmodule TicketingSystem.Domain.UseCases.CreatePriorityTicketTest do
  use ExUnit.Case

  alias TicketingSystem.Domain.Entities.Ticket
  alias TicketingSystem.Domain.UseCases.CreatePriorityTicket
  alias TicketingSystem.Infra.Persistence.SqliteRepo, as: SQLiteRepo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(SQLiteRepo)
  end

  test "creates a ticket" do
    assert {:ok, ticket} = CreatePriorityTicket.call()

    assert %Ticket{code: "P001", called: false, priority: true} = ticket
  end
end
