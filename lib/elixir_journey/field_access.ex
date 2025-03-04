defmodule ElixirJourney.FieldAccess do
  def dot(map) when is_map(map) do
    map.field
  end

  def dot(module) when is_atom(module) do
    module.function()
  end

  def brackets(data) do
    data[:field]
  end
end
