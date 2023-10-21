defmodule TicketingSystem.Domain.Entities.Ticket do
  defstruct [
    :id,
    :code,
    :inserted_at,
    :updated_at,
    called: false,
    priority: false
  ]

  @type t :: %__MODULE__{
          id: integer | nil,
          code: String.t(),
          called: boolean,
          priority: boolean,
          inserted_at: DateTime.t() | nil,
          updated_at: DateTime.t() | nil
        }

  @spec new(code :: String.t()) :: t()
  @spec new(code :: String.t(), opts :: Keyword.t()) :: t()

  def new(code, opts \\ []) when is_binary(code) do
    %__MODULE__{code: code, priority: opts[:priority] || false}
  end

  def from_map(%{
        id: id,
        code: code,
        called: called,
        priority: priority,
        inserted_at: inserted_at,
        updated_at: updated_at
      }) do
    %__MODULE__{
      id: id,
      code: code,
      called: called,
      priority: priority,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end
