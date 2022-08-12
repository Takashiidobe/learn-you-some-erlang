-module(functions).
-compile(export_all).

% Pattern matching is done here to handle all the different cases.
greet(male, Name) ->
  io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
  io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
  io:format("Hello, ~s!", [Name]).

% Head Function
head([H|_]) -> H.

% Tail Function
tail([_|T]) -> T.

% Second
second([_,X|_]) -> X.

% Same
same(X, X) -> true;
same(_, _) -> false.

% valid time
valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
  io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n", [Date,Y,M,D]),
  io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S]);
valid_time(_) ->
  io:format("Stop feeding me wrong data!~n").
