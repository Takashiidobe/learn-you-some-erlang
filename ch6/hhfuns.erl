-module(hhfuns).
-export([one/0]).
-export([two/0]).
-export([add/2]).
-export([increment/1]).
-export([decrement/1]).
-export([map/2]).
-export([decr/1]).
-export([incr/1]).
-export([base/1]).
-export([b/1]).
-export([a/0]).
-export([even/1]).
-export([filter/2]).
-export([sum/1]).
-export([max/1]).
-export([min/1]).
-export([fold/3]).

one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().

increment([]) -> [];
increment([H|T]) -> [H + 1| increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H - 1| decrement(T)].

map(_, []) -> [];
map(F, [H|T]) -> [F(H) | map(F, T)].

incr(X) -> X + 1.
decr(X) -> X - 1.

%% This code block shows an anonymous function that can be bound twice.
%% 11> PrepareAlarm = fun(Room) ->
%% 11> io:format("Alarm set in ~s.~n",[Room]),
%% 11> fun() -> io:format("Alarm tripped in ~s! Call Batman!~n",[Room]) end
%% 11> end.
%% #Fun<erl_eval.20.67289768>
%% 12> AlarmReady = PrepareAlarm("bathroom").
%% Alarm set in bathroom.
%% #Fun<erl_eval.6.13229925>
%% 13> AlarmReady().
%% Alarm tripped in bathroom! Call Batman!
%% ok

base(A) ->
  B = A + 1,
  F = fun() -> A * B end,
  F().

a() ->
  Secret = "pony",
  fun() -> Secret end.
b(F) ->
  "a/0's password is "++F().

even(L) -> lists:reverse(even(L,[])).
even([], Acc) ->
  Acc;
even([H|T], Acc) when H rem 2 == 0 ->
  even(T, [H|Acc]);
even([_|T], Acc) ->
  even(T, Acc).

filter(Pred, L) -> lists:reverse(filter(Pred, L, [])).

filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
    true -> filter(Pred, T, [H | Acc]);
    false -> filter(Pred, T, Acc)
  end.


%% Find the maximum of a list.
max([H|T]) -> max2(T, H).
max2([], Max) -> Max;
max2([H|T], Max) when H > Max -> max2(T, H);
max2([_|T], Max) -> max2(T, Max).

%% Find the minimum of a list.
min([H|T]) -> min2(T,H).
min2([], Min) -> Min;
min2([H|T], Min) when H < Min -> min2(T,H);
min2([_|T], Min) -> min2(T, Min).

%% Find the sum of all the elements of a list.
sum(L) -> sum(L,0).
sum([], Sum) -> Sum;
sum([H|T], Sum) -> sum(T, H+Sum).

fold(_, Start, []) -> Start;
fold(F, Start, [H|T]) -> fold(F, F(H, Start), T).
