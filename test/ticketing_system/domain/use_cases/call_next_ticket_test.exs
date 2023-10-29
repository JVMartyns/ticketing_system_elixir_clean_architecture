defmodule TicketingSystem.Domain.UseCases.CallNextTicketTest do
  use ExUnit.Case

  alias TicketingSystem.Domain.Entities.Ticket
  alias TicketingSystem.Domain.UseCases.CallNextTicket
  alias TicketingSystem.Domain.Services.TicketPriorityDispatcher
  alias TicketingSystem.Factory
  alias TicketingSystem.Infra.Persistence.SqliteRepo, as: SQLiteRepo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(SQLiteRepo)
  end

  test "calls next ticket" do
    Factory.insert(:common_ticket, code: "C001")
    Factory.insert(:common_ticket, code: "C002")
    Factory.insert(:priority_ticket, code: "P001")
    Factory.insert(:common_ticket, code: "C003")
    Factory.insert(:common_ticket, code: "C004")
    Factory.insert(:priority_ticket, code: "P002")

    Enum.reduce_while(1..3, nil, fn _, _ ->
      if TicketPriorityDispatcher.next_ticket_priority() == :common,
        do: {:halt, nil},
        else: {:cont, nil}
    end)

    tickets =
      Enum.map(1..6, fn _ ->
        {:ok, %Ticket{code: code, called: true}} = CallNextTicket.call()
        code
      end)

    expected_tickets = ["P001", "P002", "C001", "C002", "C003", "C004"]
    assert expected_tickets == tickets
  end
end
