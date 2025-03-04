defmodule ElixirJourney do
  @spec to_abstract(module()) :: String.t()
  def to_abstract(module) do
    module
    |> :code.get_object_code()
    |> then(fn {_module, beam, _path} -> beam end)
    |> :beam_lib.chunks([:abstract_code])
    |> then(fn result ->
      {:ok, {_, [abstract_code: {:raw_abstract_v1, abstract_code}]}} = result
      abstract_code
    end)
    |> :erl_syntax.form_list()
    |> :erl_prettypr.format()
    |> List.to_string()
  end

  def dot_map_benchmark do
    # Прячем литерал за runtime вычислением, иначе BEAM способен запечь конкретное значение при использовании map_get
    map = Enum.random([%{name: "John Doe", age: 30, email: "john.doe@example.com"}])

    Benchee.run(
      %{
        dot: fn ->
          name = map.name
          age = map.age
          email = map.email

          {name, age, email}
        end,
        pattern_match: fn ->
          %{name: name, age: age, email: email} = map

          {name, age, email}
        end,
        fetch!: fn ->
          name = Map.fetch!(map, :name)
          age = Map.fetch!(map, :age)
          email = Map.fetch!(map, :email)

          {name, age, email}
        end
      },
      measure_function_call_overhead: true
    )
  end
end
