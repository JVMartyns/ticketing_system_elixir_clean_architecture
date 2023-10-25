defmodule TicketingSystem.Domain.UseCases.CreatePriorityTicket do
  alias TicketingSystem.Domain.Entities.Ticket
  alias TicketingSystem.Domain.Repositories.TicketRepo

  @default_ticket_code "P000"

  def call do
    get_last_priority_ticket_code()
    |> Ticket.next_code()
    |> Ticket.new(priority: true)
    |> TicketRepo.insert()
  end

  defp get_last_priority_ticket_code do
    case TicketRepo.get_last_priority_ticket() do
      {:error, :not_found} -> @default_ticket_code
      {:ok, %{code: code}} -> code
    end
  end
end
