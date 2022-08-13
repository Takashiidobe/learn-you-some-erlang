-module(ordereddicts).
-compile(export_all).

% Create a new map, store in it, then map it.
new() ->
  D = orddict:new(),
  D1 = orddict:store(1, "test", D),
  orddict:map(fun(K,V) -> V ++ " " ++ integer_to_list(K) end, D1).
