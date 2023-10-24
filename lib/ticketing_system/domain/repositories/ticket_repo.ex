defmodule TicketingSystem.Domain.Repositories.TicketRepo do
  alias TicketingSystem.Domain.Entities.Ticket

  @callback insert(ticket :: Ticket.t()) :: {:ok, Ticket.t()} | {:error, any}
  @callback update(ticket :: Ticket.t(), attrs :: map) :: {:ok, Ticket.t()} | {:error, any}
  @callback get_by_code(code :: String.t()) :: {:ok, Ticket.t()} | {:error, :not_found}
  @callback get_last_priority_ticket() :: {:ok, Ticket.t()} | {:error, :not_found}
  @callback get_last_common_ticket() :: {:ok, Ticket.t()} | {:error, :not_found}
  @callback get_next_ticket(priority :: atom) :: {:ok, Ticket.t()} | {:error, :not_found}
  @callback get_last_called_tickets(limit :: integer) :: {:ok, [Ticket.t()]}
  @callback has_tickets_to_call() :: boolean
  @callback has_priority_tickets_to_call() :: boolean

  def insert(ticket), do: impl().insert(ticket)
  def update(ticket, attrs), do: impl().update(ticket, attrs)
  def get_by_code(code), do: impl().get_by_code(code)
  def get_last_priority_ticket, do: impl().get_last_priority_ticket()
  def get_last_common_ticket, do: impl().get_last_common_ticket()
  def get_next_ticket(priority), do: impl().get_next_ticket(priority)
  def get_last_called_tickets(limit), do: impl().get_last_called_tickets(limit)
  def has_tickets_to_call, do: impl().has_tickets_to_call()
  def has_priority_tickets_to_call, do: impl().has_priority_tickets_to_call()

  defp impl do
    Application.get_env(:ticketing_system, :ticket_repo_impl)
  end
end
