defmodule TicketingSystem.Domain.Entities.TicketTest do
  use ExUnit.Case, async: true

  alias TicketingSystem.Domain.Entities.Ticket

  test "creates a ticket" do
    ticket = Ticket.new("C001")

    assert ticket.code == "C001"
    assert ticket.called == false
    assert ticket.priority == false
  end

  test "creates a ticket with priority" do
    ticket = Ticket.new("P001", priority: true)

    assert ticket.code == "P001"
    assert ticket.called == false
    assert ticket.priority == true
  end

  test "create next ticket code" do
    ticket = Ticket.new("C001")
    code = Ticket.next_code(ticket.code)

    assert code == "C002"
  end
end
