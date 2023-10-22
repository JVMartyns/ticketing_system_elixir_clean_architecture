defmodule TicketingSystem.Infra.Repositories.Sqlite.TicketRepoImpl do
  import Ecto.Query
  alias TicketingSystem.Domain.Repositories.TicketRepo
  alias TicketingSystem.Infra.Repositories.Sqlite.Repo
  alias TicketingSystem.Infra.Repositories.Sqlite.Schemas.TicketSchema
  alias TicketingSystem.Domain.Entities.Ticket

  @behaviour TicketingSystem.Domain.Repositories.TicketRepo

  # Queries

  @impl TicketRepo
  def get_by_code(code) do
    case Repo.get_by(TicketSchema, code: code) do
      nil -> {:error, :not_found}
      ticket -> {:ok, Ticket.from_map(ticket)}
    end
  end

  @impl TicketRepo
  def get_last_priority_ticket do
    query =
      from(t in TicketSchema,
        where: t.priority == true,
        order_by: [desc: t.inserted_at],
        limit: 1
      )

    case Repo.one(query) do
      nil -> {:error, :not_found}
      ticket -> {:ok, Ticket.from_map(ticket)}
    end
  end

  @impl TicketRepo
  def get_last_common_ticket do
    query =
      from(
        t in TicketSchema,
        where: t.priority == false,
        order_by: [desc: t.inserted_at],
        limit: 1
      )

    case Repo.one(query) do
      nil -> {:error, :not_found}
      ticket -> {:ok, Ticket.from_map(ticket)}
    end
  end

  @impl TicketRepo
  def get_next_ticket(:common), do: do_get_next_ticket(false)
  def get_next_ticket(:priority), do: do_get_next_ticket(true)

  defp do_get_next_ticket(priority) when is_boolean(priority) do
    query =
      from(
        t in TicketSchema,
        where: t.priority == ^priority and t.called == false,
        order_by: [asc: t.inserted_at],
        limit: 1
      )

    case Repo.one(query) do
      nil -> {:error, :not_found}
      ticket -> {:ok, Ticket.from_map(ticket)}
    end
  end

  @impl TicketRepo
  def has_tickets_to_call do
    query = from(t in TicketSchema, where: t.called == false and t.priority == false)

    Repo.aggregate(query, :count) > 0
  end

  @impl TicketRepo
  def has_priority_tickets_to_call() do
    query = from(t in TicketSchema, where: t.called == false and t.priority == true)

    Repo.aggregate(query, :count) > 0
  end

  @impl TicketRepo
  def get_last_called_tickets(limit) do
    query =
      from(t in TicketSchema,
        where: t.called == true,
        order_by: [desc: t.inserted_at],
        limit: ^limit
      )

    case Repo.all(query) do
      [] -> {:error, :not_found}
      tickets -> {:ok, tickets}
    end
  end

  # Commands

  @impl TicketRepo
  def insert(%Ticket{} = ticket) do
    changeset = TicketSchema.changeset(ticket)

    case Repo.insert(changeset) do
      {:ok, ticket_schema} -> {:ok, Ticket.from_map(ticket_schema)}
      {:error, _error} = error -> error
    end
  end

  @impl TicketRepo
  def update(%Ticket{} = ticket, attrs) do
    changeset =
      ticket
      |> TicketSchema.from_ticket()
      |> TicketSchema.changeset(attrs)

    case Repo.update(changeset) do
      {:ok, ticket_schema} -> {:ok, Ticket.from_map(ticket_schema)}
      {:error, _error} = error -> error
    end
  end
end
