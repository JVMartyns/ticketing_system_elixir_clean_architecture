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

  @common_code_prefix "C"
  @priority_code_prefix "P"

  @spec new(code :: String.t()) :: t()
  @spec new(code :: String.t(), opts :: Keyword.t()) :: t()

  def new(code, opts \\ []) when is_binary(code) do
    %__MODULE__{code: code, priority: opts[:priority] || false}
  end

  def next_code(@common_code_prefix <> code) do
    generate_ticket_code(code, @common_code_prefix)
  end

  def next_code(@priority_code_prefix <> code) do
    generate_ticket_code(code, @priority_code_prefix)
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
