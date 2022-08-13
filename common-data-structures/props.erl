-module(props).
-compile(export_all).

P = [{5, 10}, {10, 20}].
V = proplists:get_value(P, 5).
io:format("val is ~p,~n", [V]).
