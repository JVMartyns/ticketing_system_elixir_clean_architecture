defmodule TicketingSystem.Domain.UseCases.CallNextTicket do
  alias TicketingSystem.Domain.Repositories.TicketRepo
  alias TicketingSystem.Infra.Services.TicketPriorityDispatcher

  def call do
    case TicketRepo.has_tickets_to_call() do
      true -> call_ticket(TicketPriorityDispatcher.next_ticket_priority())
      false -> {:error, :not_found}
    end
  end

  defp call_ticket(:priority) do
    case TicketRepo.has_priority_tickets_to_call() do
      true ->
        {:ok, ticket} = TicketRepo.get_next_ticket(:priority)
        TicketRepo.update(ticket, %{called: true})

      false ->
        call_ticket(:common)
    end
  end

  defp call_ticket(:common) do
    {:ok, ticket} = TicketRepo.get_next_ticket(:common)
    TicketRepo.update(ticket, %{called: true})
  end
end
