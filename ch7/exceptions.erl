-module(exceptions).
-export([throws/1]).
-export([exits/1]).
-export([errors/1]).
-export([black_knight/1]).
-export([sword/1]).
-export([catcher/2]).
-export([has_value/2]).

throws(F) ->
  try F() of
    _ -> ok
  catch
    Throw -> {throw, caught, Throw}
  end.

errors(F) ->
  try F() of
    _ -> ok
  catch
    error:Error -> {error, caught, Error}
  end.
exits(F) ->
  try F() of
    _ -> ok
  catch
    exit:Exit -> {exit, caught, Exit}
  end.

sword(1) -> throw(slice);
sword(2) -> erlang:error(cut_arm);
sword(3) -> exit(cut_leg);
sword(4) -> throw(punch);
sword(5) -> exit(cross_bridge).

black_knight(Attack) when is_function(Attack, 0) ->
  try Attack() of
    _ -> "None shall pass."
  catch
    throw:slice -> "It is but a scratch.";
    error:cut_arm -> "I've had worse.";
    exit:cut_leg -> "Come on you pansy!";
    _:_ -> "Just a flesh wound."
end.

catcher(X,Y) ->
case catch X/Y of
  {'EXIT', {badarith,_}} -> "uh oh";
  N -> N
end.

has_value(Val, Tree) ->
  try has_value1(Val, Tree) of
    false -> false
  catch
    true -> true
  end.
has_value1(_, {node, 'nil'}) ->
  false;
has_value1(Val, {node, {_, Val, _, _}}) ->
  throw(true);
has_value1(Val, {node, {_, _, Left, Right}}) ->
has_value1(Val, Left),
has_value1(Val, Right).
