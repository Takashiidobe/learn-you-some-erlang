-module(kitchen).
-export([fridge1/0]).
-export([fridge2/1]).
-export([take/2]).
-export([store/2]).
-export([start/1]).
-export([take2/2]).
-export([store2/2]).


fridge1() ->
  receive
    {From, {store, _Food}} ->
      From ! {self(), ok},
      fridge1();
    {From, {take, _Food}} ->
      From ! {self(), not_found},
      fridge1();
    terminate ->
      ok
  end.


fridge2(FoodList) ->
  receive
    {From, {store, Food}} ->
      From ! {self(), ok},
      fridge2([Food | FoodList]);
    {From, {take, Food}} ->
      case lists:member(Food, FoodList) of
        true ->
          From ! {self(), {ok, Food}},
          fridge2(lists:delete(Food, FoodList));
        false ->
          From ! {self(), not_found},
          fridge2(FoodList)
      end;
    terminate ->
      ok
  end.

store(Pid, Food) ->
  Pid ! {self(), {store, Food}},
  receive
    {_Pid, Msg} -> Msg
  end.

take(Pid, Food) ->
  Pid ! {self(), {take, Food}},
  receive
    {_Pid, Msg} -> Msg
  end.

store2(Pid, Food) ->
  Pid ! {self(), {store, Food}},
  receive
    {_Pid, Msg} -> Msg
  after 3000 ->
    timeout
  end.

take2(Pid, Food) ->
    Pid ! {self(), {take, Food}},
  receive
    {_Pid, Msg} -> Msg
  after 3000 ->
    timeout
  end.

start(FoodList) ->
  spawn(?MODULE, fridge2, [FoodList]).
