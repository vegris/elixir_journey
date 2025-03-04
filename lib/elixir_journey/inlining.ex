defmodule ElixirJourney.Inlining do
  def to_string do
    _string = to_string("static")
    _string = String.Chars.to_string("static")

    to_convert = Enum.random([:atom, "string"])

    _string = to_string(to_convert)
    _string = String.Chars.to_string(to_convert)
  end

  def maps do
    _map = Map.put(%{field: :value}, :key, :value)
    _map = Map.put(%{field: :value}, :key, Enum.random([1, 2]))
    _map = :maps.put(:key, :value, %{field: :value})

    random_map = Enum.random([Map.new(), Map.new()])

    _map = Map.put(random_map, :key, :value)

    _merge = Map.merge(%{field1: :value}, %{field2: :value, field3: :value})
    _merge = Map.merge(random_map, %{field2: :value})
    _merge = :maps.merge(%{field1: :value}, %{field2: :value, field3: :value})
  end

  def pure_functions do
    _duration = Duration.new!(year: 1, week: 3, hour: 4, second: 1)

    _set = MapSet.new([1, 2, 3])

    _length = String.length("static string")
    _length = String.length("dynamic" <> " " <> "string")
    _length = "static string" |> to_string() |> String.length()

    _version = Version.parse!("1.0.0")
    _version = Version.parse("static invalid")
    _version = Version.parse!("static invalid")
    _version = Version.parse!(Enum.join(["1", "0", "0"], "."))

    _shifted = Date.shift(~D[2025-01-01], day: 1)
    _shifted = Date.shift(~D[2025-01-01], day: 1)
    _shifted = DateTime.shift(~U[2025-01-01T00:00:00Z], day: 1)
    _shifted = NaiveDateTime.shift(~N[2025-01-01T00:00:00], day: 1)
    _shifted = Time.shift(~T[00:00:00], hour: 1)

    _shifted = Date.shift(~D[2025-01-01], day: Enum.random([1, 2]))
  end
end
