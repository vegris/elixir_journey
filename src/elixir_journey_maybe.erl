-module(elixir_journey_maybe).
-export([with_else/1, without_else/1]).

with_else(Map) ->
    maybe
        {ok, Data} ?= fetch_data(Map),
        {Int, ""} ?= parse_int(Data),
        Int
    else
        {error, no_data} -> {error, no_data};
        {error, not_an_int} -> {error, not_an_int}
    end.

without_else(Map) ->
    maybe
        {ok, Data} ?= fetch_data(Map),
        {ok, Int} ?= parse_int(Data),
        Int
    end.

fetch_data(Map) ->
    case maps:find("data", Map) of
        {ok, _Data} = V -> V;
        error -> {error, no_data}
    end.

parse_int(Value) ->
    case string:to_integer(Value) of
        {Int, ""} -> {ok, Int};
        _ -> {error, not_an_int}
    end.
