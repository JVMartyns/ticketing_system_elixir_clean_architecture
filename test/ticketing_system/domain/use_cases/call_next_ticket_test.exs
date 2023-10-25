# defmodule TicketingSystem.Domain.UseCases.CallNextTicketTest do
#   use ExUnit.Case, async: true

#   alias TicketingSystem.Domain.Entities.Ticket
#   alias TicketingSystem.Domain.UseCases.CallNextTicket
#   alias TicketingSystem.Infra.Services.TicketPriorityDispatcher
#   alias TicketingSystem.Factory
#   alias TicketingSystem.Infra.Repositories.Sqlite.Repo, as: SQLiteRepo

#   setup do
#     :ok = Ecto.Adapters.SQL.Sandbox.checkout(SQLiteRepo)
#   end

#   test "calls next ticket" do
#     Factory.insert(:common_ticket, code: "C001")
#     Factory.insert(:common_ticket, code: "C002")
#     Factory.insert(:priority_ticket, code: "P001")
#     Factory.insert(:common_ticket, code: "C003")
#     Factory.insert(:common_ticket, code: "C004")
#     Factory.insert(:priority_ticket, code: "P001")

#     Enum.map(1..6, fn _ ->
#       priority = TicketPriorityDispatcher.current_ticket_priority() == :priority

#       IO.inspect(priority)

#       assert {:ok, %Ticket{priority: ^priority, called: true}} = CallNextTicket.call()
#     end)
#   end
# end
