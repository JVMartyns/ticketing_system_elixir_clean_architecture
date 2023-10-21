defmodule TicketingSystem.Domain.UseCases.GetLastCalledTickets do
  alias TicketingSystem.Domain.Repositories.TicketRepo
  def call(limit), do: TicketRepo.get_last_called_tickets(limit)
end
