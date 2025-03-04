defmodule ElixirJourney.Conditionals do
  def if_thing(thing) do
    if thing, do: :thing, else: :other_thing
  end

  def if_bool(thing) do
    if is_nil(thing), do: :thing, else: :other_thing

    if thing != nil, do: :thing, else: :other_thing
  end

  def negate(thing), do: !thing

  def negate_bool, do: !true

  def cond_example do
    cond do
      :erlang.phash2(1) -> 1
      :erlang.phash2(2) -> 2
      :otherwise -> :ok
    end
  end

  def and_example do
    Enum.random([true, false]) and nil
  end
end
