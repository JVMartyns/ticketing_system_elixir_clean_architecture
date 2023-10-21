defmodule TicketingSystem.Domain.UseCases.GenerateNextTicketCode do
  @common_ticket_code_prefix "C"
  @priority_ticket_code_prefix "P"

  def call(@common_ticket_code_prefix <> code) do
    code
    |> String.to_integer()
    |> Kernel.+(1)
    |> Integer.to_string()
    |> String.pad_leading(3, "0")
    |> (&(@common_ticket_code_prefix <> &1)).()
  end

  def call(@priority_ticket_code_prefix <> code) do
    code
    |> String.to_integer()
    |> Kernel.+(1)
    |> Integer.to_string()
    |> String.pad_leading(3, "0")
    |> (&(@priority_ticket_code_prefix <> &1)).()
  end
end
