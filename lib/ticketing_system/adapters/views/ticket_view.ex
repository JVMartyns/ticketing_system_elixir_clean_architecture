defmodule TicketingSystem.Adapters.Views.TicketView do
  def render(ticket) when is_map(ticket) do
    %{data: render_one(ticket)}
  end

  def render(tickets) when is_list(tickets) do
    %{data: render_many(tickets)}
  end

  def render_one(ticket) do
    %{
      code: ticket.code,
      called: ticket.called,
      priority: ticket.priority
    }
  end

  def render_many(tickets), do: Enum.map(tickets, &render_one/1)
end
