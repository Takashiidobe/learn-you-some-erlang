-module(dolphins).
-export([dolphin1/0]).
-export([dolphin2/0]).
-export([dolphin3/0]).

dolphin1() ->
  receive
    do_a_flip ->
      io:format("How about no?~n");
    fish ->
      io:format("So long and thanks for all the fish!~n");
    _ ->
      io:format("Heh, we're smarter than you humans.~n")
  end.

dolphin2() ->
  receive
    {From, do_a_flip} ->
      From ! "How about no?";
    {From, fish} ->
      From ! "So long and thanks for all the fish!";
    {From, _} ->
      From ! "Heh, we're smarter than you humans.~n";
    _ ->
      io:format("Heh, we're smarter than you humans.~n")
  end.

dolphin3() ->
  receive
    {From, do_a_flip} ->
      From ! "How about no?",
      dolphin3();
    {From, fish} ->
      From ! "So long and thanks for all the fish!";
      %% Shutdown here
    {From, _} ->
      From ! "Heh, we're smarter than you humans.~n",
      dolphin3();
    _ ->
      io:format("Heh, we're smarter than you humans.~n"),
      dolphin3()
  end.
