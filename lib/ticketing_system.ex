defmodule TicketingSystem do
  alias TicketingSystem.Adapters.Controllers.TicketController

  def new_common_ticket(), do: TicketController.new_common_ticket()
  def new_priority_ticket(), do: TicketController.new_priority_ticket()
  def call_next_ticket(), do: TicketController.call_next_ticket()
  def call_ticket_by_code(code), do: TicketController.call_ticket_by_code(code)
  def get_last_called_tickets(limit \\ 5), do: TicketController.get_last_called_tickets(limit)
end
