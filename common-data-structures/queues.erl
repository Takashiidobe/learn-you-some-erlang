-module(queues).
-compile(export_all).

example() ->
  Q = queue:new(),
  io:format("Is this a queue? ~p~n", [queue:is_queue(Q)]),
  io:format("Is this queue empty? ~p~n", [queue:is_empty(Q)]),
  Q1 = queue:in(5, Q),
  Q2 = queue:in_r(1, Q1),
  Head = queue:out(Q2),
  io:format("The head of Q2 is: ~p ~n", [Head]).
