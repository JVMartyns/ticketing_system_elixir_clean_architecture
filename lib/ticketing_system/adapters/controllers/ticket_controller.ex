defmodule TicketingSystem.Adapters.Controllers.TicketController do
  alias TicketingSystem.Adapters.Views.TicketView
  alias TicketingSystem.Domain.UseCases.CallTicketByCode
  alias TicketingSystem.Domain.UseCases.CreateCommonTicket
  alias TicketingSystem.Domain.UseCases.CreatePriorityTicket
  alias TicketingSystem.Domain.UseCases.CallNextTicket
  alias TicketingSystem.Domain.UseCases.GetLastCalledTickets

  def new_common_ticket() do
    with {:ok, ticket} <- CreateCommonTicket.call() do
      TicketView.render(ticket)
    end
  end

  def new_priority_ticket() do
    with {:ok, ticket} <- CreatePriorityTicket.call() do
      TicketView.render(ticket)
    end
  end

  def call_next_ticket() do
    case CallNextTicket.call() do
      {:ok, ticket} -> TicketView.render(ticket)
      {:error, :not_found} -> %{error: "No tickets to call"}
    end
  end

  def call_ticket_by_code(code) do
    case CallTicketByCode.call(code) do
      {:ok, ticket} -> TicketView.render(ticket)
      {:error, :not_found} -> %{error: "Ticket not found"}
    end
  end

  def get_last_called_tickets(limit) do
    case GetLastCalledTickets.call(limit) do
      {:ok, tickets} -> TicketView.render(tickets)
      {:error, :not_found} -> %{error: "No tickets found"}
    end
  end
end
