defmodule TicketingSystem.Domain.UseCases.GenerateNextTicketCode do
  @common_ticket_code_prefix "C"
  @priority_ticket_code_prefix "P"

  def call(@common_ticket_code_prefix <> code) do
    generate_ticket_code(code, @common_ticket_code_prefix)
  end

  def call(@priority_ticket_code_prefix <> code) do
    generate_ticket_code(code, @priority_ticket_code_prefix)
  end

  defp generate_ticket_code(code, prefix) do
    code
    |> String.to_integer()
    |> Kernel.+(1)
    |> Integer.to_string()
    |> String.pad_leading(3, "0")
    |> (&(prefix <> &1)).()
  end
end
