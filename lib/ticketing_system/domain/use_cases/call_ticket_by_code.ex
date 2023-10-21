defmodule TicketingSystem.Domain.UseCases.CallTicketByCode do
  alias TicketingSystem.Domain.Repositories.TicketRepo

  def call(code) do
    with {:ok, ticket} <- TicketRepo.get_by_code(code) do
      TicketRepo.update(ticket, %{called: true})
    end
  end
end
