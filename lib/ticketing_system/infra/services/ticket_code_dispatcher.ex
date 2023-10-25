defmodule TicketingSystem.Infra.Services.TicketCodeDispatcher do
  use GenServer

  @code_prefix %{
    common: "C",
    priority: "P"
  }

  # See https://hexdocs.pm/elixir/GenServer.html
  # for more information on OTP Applications

  # Client (public)

  def start_link(stack) when is_list(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def next_code(priority) do
    GenServer.call(__MODULE__, {:next_code, priority})
  end

  # Server (callbacks)

  @impl true
  def init(_stack) do
    {:ok, %{common: 0, priority: 0}}
  end

  @impl true
  def handle_call({:next_code, priority}, _from, stack) do
    next = stack[priority] + 1

    code =
      next
      |> Integer.to_string()
      |> String.pad_leading(3, "0")
      |> (&(@code_prefix[priority] <> &1)).()

    {:reply, code, Map.put(stack, priority, next)}
  end
end
