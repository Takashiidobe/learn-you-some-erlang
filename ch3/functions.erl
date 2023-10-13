-module(functions).

-export([head/1]).
-export([second/1]).
-export([rest/1]).
-export([same/2]).
-export([valid_time/1]).

head([H | _]) ->
  H.

second([_, X | _]) ->
  {ok, X};
second([_]) ->
  {err, nil};
second([]) ->
  {err, nil}.

rest([_ | T]) ->
  T.

same(X, X) ->
  true;
same(_, _) ->
  false.

valid_time({Date = {Y, M, D}, Time = {H, Min, S}}) ->
  io:format("The date tuple (~p) says today is: ~p/~p/~p, ~n", [Date, Y, M, D]),
  io:format("The time tuple (~p) says today is: ~p:~p:~p, ~n", [Time, H, Min, S]);
valid_time(_) ->
  io:format("Invalid date~n").
