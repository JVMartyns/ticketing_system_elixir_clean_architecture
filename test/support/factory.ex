defmodule TicketingSystem.Factory do
  use ExMachina.Ecto, repo: TicketingSystem.Infra.Persistence.SqliteRepo

  alias TicketingSystem.Infra.Repositories.Sqlite.Schemas.TicketSchema

  def common_ticket_factory do
    %TicketSchema{code: random_ticket_code(), priority: false, called: false}
  end

  defp random_ticket_code do
    :rand.uniform(999)
    |> Integer.to_string()
    |> String.pad_leading(3, "0")
    |> (&"#{Enum.random(["C", "P"])}#{&1}").()
  end

  def priority_ticket_factory do
    %TicketSchema{code: "P001", priority: true, called: false}
  end
end
