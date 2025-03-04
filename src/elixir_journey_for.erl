-module(elixir_journey_for).
-export([unique/0]).

unique() ->
    Range = #{'__struct__' => 'Elixir.Range', first => 1, last => 10, step => 1},

    Function = fun (Elem, Acc) ->
        {List, MapSet} = Acc,
        Key = Elem,
        case MapSet of 
            #{Key := true} -> {List, MapSet};
            #{} -> {[Key | List], MapSet#{Key => true}}
        end
    end,
    
    Result = 'Elixir.Enum':reduce(Range, {[], #{}}, Function),
    lists:reverse(erlang:element(1, Result)).
