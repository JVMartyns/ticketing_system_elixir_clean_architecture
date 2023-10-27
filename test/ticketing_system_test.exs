defmodule TicketingSystemTest do
  use ExUnit.Case

  alias TicketingSystem.Infra.Persistence.SqliteRepo, as: SQLiteRepo
  alias TicketingSystem.Factory

  doctest TicketingSystem

  @common_code_pattern ~r/^(C\d{3})$/
  @priority_code_pattern ~r/^(P\d{3})$/

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(SQLiteRepo)
  end

  test "generate new common ticket" do
    assert %{data: ticket} = TicketingSystem.new_common_ticket()
    assert %{code: code, priority: false, called: false} = ticket
    assert Regex.match?(@common_code_pattern, code)
  end

  test "generate new priority ticket" do
    assert %{data: ticket} = TicketingSystem.new_priority_ticket()
    assert %{code: code, priority: true, called: false} = ticket
    assert Regex.match?(@priority_code_pattern, code)
  end

  test "call next ticket" do
    Factory.insert_list(3, :common_ticket)
    Factory.insert_list(3, :priority_ticket)

    called_tickets =
      Enum.map(1..6, fn _ ->
        TicketingSystem.call_next_ticket().data.priority
      end)

    assert called_tickets == [true, true, false, true, false, false]
  end

  test "call ticket by code" do
    code = Factory.insert(:common_ticket).code

    assert TicketingSystem.call_ticket_by_code(code).data.code == code
  end

  test "get last called tickets" do
    tickets = Factory.insert_list(3, :common_ticket, called: true)

    result = TicketingSystem.get_last_called_tickets(3).data

    Enum.all?(0..2, fn i -> Enum.at(tickets, i).code == Enum.at(result, i - 1).code end)
  end
end
