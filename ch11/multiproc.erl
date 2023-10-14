-module(multiproc).
-export([normal/0]).
-export([important/0]).

important() ->
  receive
    {Priority, Message} when Priority > 10 ->
      [Message | important()]
  after 0 ->
          normal()
  end.
normal() ->
  receive
    {_, Message} ->
      [Message | normal()]
  after 0 ->
          []
  end.
