defmodule ElixirJourney.With do
  def with_else(map) do
    with {_, {:ok, data}} <- {:map, Map.fetch(map, "data")},
         {_, {int, ""}} <- {:int, Integer.parse(data)} do
      int
    else
      {:map, :error} -> {:error, :no_data}
      {:int, _} -> {:error, :not_an_int}
    end
  end

  def without_else(map) do
    with {:ok, data} <- fetch_data(map),
         {:ok, int} <- parse_int(data) do
      int
    end
  end

  defp fetch_data(map) do
    case Map.fetch(map, "data") do
      {:ok, _data} = v -> v
      :error -> {:error, :no_data}
    end
  end

  defp parse_int(value) do
    case Integer.parse(value) do
      {int, ""} -> {:ok, int}
      _ -> {:error, :not_an_int}
    end
  end
end
