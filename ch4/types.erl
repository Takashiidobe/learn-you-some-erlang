-module(types).
-export([type_of/1]).

type_of(X) when is_atom(X) ->
  str = X ++ "is an atom~n",
  io:format(str);
type_of(X) when is_number(X) ->
  str = X ++ "is a number~n",
  io:format(str);
type_of(X) when is_tuple(X) ->
  io:format("This is a tuple~n").
