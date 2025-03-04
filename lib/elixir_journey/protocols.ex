defmodule ElixirJourney.Protocols do
  defprotocol Size do
    @type t :: bitstring() | map() | tuple()

    @spec size(t()) :: non_neg_integer()
    def size(data)
  end

  defimpl Size, for: BitString do
    def size(binary), do: byte_size(binary)
  end

  defimpl Size, for: Map do
    def size(map), do: map_size(map)
  end

  defimpl Size, for: Tuple do
    def size(tuple), do: tuple_size(tuple)
  end

  def protocol(value) do
    Size.size(value)
  end
end
