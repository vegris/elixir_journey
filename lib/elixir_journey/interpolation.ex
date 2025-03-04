defmodule ElixirJourney.Interpolation do
  def interpolation do
    "This #{:will} #{"be"} #{[97]} #{"str" <> "ing"}"
  end
end
