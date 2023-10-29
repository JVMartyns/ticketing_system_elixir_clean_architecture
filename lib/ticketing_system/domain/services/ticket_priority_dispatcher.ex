defmodule TicketingSystem.Domain.Services.TicketPriorityDispatcher do
  @callback next_ticket_priority() :: atom()
  @callback current_ticket_priority() :: atom()

  def next_ticket_priority, do: impl().next_ticket_priority()
  def current_ticket_priority, do: impl().current_ticket_priority()

  defp impl do
    Application.get_env(:ticketing_system, :ticket_priority_dispatcher_impl)
  end
end
