defmodule TicketingSystem.Infra.Repositories.Sqlite.Schemas.TicketSchema do
  use Ecto.Schema
  import Ecto.Changeset

  alias TicketingSystem.Domain.Entities.Ticket

  @fields ~w(code called priority)a

  schema "tickets" do
    field(:code, :string)
    field(:called, :boolean, default: false)
    field(:priority, :boolean, default: false)

    timestamps()
  end

  def changeset(%Ticket{} = ticket) do
    changeset(Map.from_struct(ticket))
  end

  def changeset(attrs) when is_map(attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(%Ticket{} = ticket, attrs) do
    ticket
    |> changeset()
    |> changeset(attrs)
  end

  def changeset(ticket, attrs) do
    ticket
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end

  def from_ticket(%Ticket{} = ticket) do
    ticket
    |> Map.from_struct()
    |> changeset()
    |> put_change(:id, ticket.id)
    |> apply_changes()
  end

  def to_ticket(%__MODULE__{} = ticket_schema) do
    %Ticket{
      id: ticket_schema.id,
      code: ticket_schema.code,
      called: ticket_schema.called,
      priority: ticket_schema.priority
    }
  end
end
