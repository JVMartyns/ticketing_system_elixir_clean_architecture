defmodule TicketingSystem.Domain.UseCases.CreateCommonTicket do
  alias TicketingSystem.Domain.Entities.Ticket
  alias TicketingSystem.Domain.Repositories.TicketRepo
  alias TicketingSystem.Domain.UseCases.GenerateNextTicketCode

  @default_ticket_code "C000"

  def call do
    get_last_common_ticket_code()
    |> GenerateNextTicketCode.call()
    |> Ticket.new()
    |> TicketRepo.insert()
  end

  defp get_last_common_ticket_code do
    case TicketRepo.get_last_common_ticket() do
      {:error, :not_found} -> @default_ticket_code
      {:ok, %{code: code}} -> code
    end
  end
end
