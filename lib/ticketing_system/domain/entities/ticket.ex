defmodule TicketingSystem.Domain.Entities.Ticket do
  defstruct [
    :id,
    :code,
    called: false,
    priority: false
  ]

  @type t :: %__MODULE__{
          id: integer | nil,
          code: String.t(),
          called: boolean,
          priority: boolean
        }

  @spec new(code :: String.t()) :: t()
  @spec new(code :: String.t(), opts :: Keyword.t()) :: t()

  def new(code, opts \\ []) when is_binary(code) do
    with {:ok, code} <- validate_code(code) do
      %__MODULE__{code: code, priority: opts[:priority] || false}
    end
  end

  defp validate_code(code) when is_binary(code) do
    pattern = ~r/^[C|P]\d{3}$/

    case Regex.match?(pattern, code) do
      true -> {:ok, code}
      false -> {:error, :invalid_code}
    end
  end
end
