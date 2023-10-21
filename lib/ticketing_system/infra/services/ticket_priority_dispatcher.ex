defmodule TicketingSystem.Infra.Services.TicketPriorityDispatcher do
  use GenServer

  # See https://hexdocs.pm/elixir/GenServer.html
  # for more information on OTP Applications

  # Client (public)

  def start_link(stack) when is_list(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def next_ticket_priority do
    GenServer.call(__MODULE__, :next_ticket)
  end

  # Server (callbacks)

  @impl true
  def init(stack) when is_list(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:next_ticket, _from, [head | tail]) do
    {:reply, head, tail ++ [head]}
  end
end
