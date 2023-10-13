-module(what_the_if).
-export([heh_fine/0]).
-export([oh_god/1]).
-export([help_me_fn/1]).
-export([help_me/1]).
-export([help_me_guard/1]).
-export([help_me_cases/1]).

heh_fine() ->
  if 1 =:= 1 -> works
  end,
  if 1 =:= 2; 1 =:= 1 -> works
  end,
  if 1 =:= 2, 1 =:= 1 -> fails
  end.

oh_god(N) ->
  if N =:= 2 -> might_succeed;
     true -> always_does
end.

help_me(Animal) ->
Talk = if Animal == cat -> "meow";
          Animal == cow -> "moo";
          Animal == dog -> "bark";
          Animal == tree -> "bark";
          true -> "fgdadfgna"
        end,
    {Animal, "says " ++ Talk ++ "!"}.

help_me_fn(Animal = cat) ->
  Talk = "meow",
  {Animal, "says " ++ Talk ++ "!"};
help_me_fn(Animal = cow) ->
  Talk = "moo",
  {Animal, "says " ++ Talk ++ "!"};
help_me_fn(Animal = dog) ->
  Talk = "bark",
  {Animal, "says " ++ Talk ++ "!"};
help_me_fn(Animal = tree) ->
  Talk = "bark",
  {Animal, "says " ++ Talk ++ "!"};
help_me_fn(Animal) ->
  Talk = "fgdadfgna",
  {Animal, "says " ++ Talk ++ "!"}.

help_me_guard(Animal) when Animal == cat ->
  {Animal, "says " ++ "meow" ++ "!"};
help_me_guard(Animal) when Animal == cow ->
  {Animal, "says " ++ "moo" ++ "!"};
help_me_guard(Animal) when Animal == dog, Animal == tree ->
  {Animal, "says " ++ "bark" ++ "!"}.

help_me_cases(Animal) ->
  Talk = case Animal of
    cat ->
      "meow";
    dog ->
      "bark";
    tree ->
      "bark";
    cow ->
      "moo";
    _ ->
      "fgdadfgna"
    end,
    {Animal, "says " ++ Talk ++ "!"}.
