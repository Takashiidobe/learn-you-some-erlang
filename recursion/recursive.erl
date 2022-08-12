-module(recursive).
-export([tail_fac/1, fac/1, len/1, tail_len/1, sum/1, tail_sum/1, duplicate/2, tail_duplicate/2, reverse/1, tail_reverse/1, sublist/2, zip/2, tail_sublist/2, lenient_zip/2, quicksort/1]).

fac(0) -> 1;
fac(N) when N < 0 -> 1;
fac(N) when N > 0 -> N * fac(N - 1).

len([]) -> 0;
len([_|T]) -> 1 + len(T).

% Tail Recursion
tail_fac(N) -> tail_fac(N, 1).

% Don't export these, they're private helper functions
tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N-1, N * Acc).

tail_len(L) -> tail_len(L, 0).

tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc + 1).

sum([]) -> 0;
sum([X]) -> X;
sum([X|T]) -> X + sum(T).

% Tail recursive sum
tail_sum(L) -> tail_sum(L, 0).

tail_sum([], Acc) -> Acc;
tail_sum([X|T], Acc) -> tail_sum(T, Acc + X).

% Duplicate
duplicate(0, _) -> [];
duplicate(N, Term) when N > 0 -> [Term | duplicate(N-1, Term)].

% Tail recursive duplicate
tail_duplicate(N, Term) -> tail_duplicate(N, Term, []).

tail_duplicate(0, _, List) -> List;
tail_duplicate(N, Term, List) when N > 0 -> tail_duplicate(N-1, Term, [Term|List]).

% reverse
reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].

% tail_reverse
tail_reverse(L) -> tail_reverse(L, []).

tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).

% sublist
sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H|T], N) when N > 0 -> [H|sublist(T, N - 1)].

% tail recursive sub_list
tail_sublist(L, N) -> reverse(tail_sublist(L, N, [])).

tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 -> tail_sublist(T, N-1, [H|SubList]).

% zip
zip([], []) -> [];
zip([X|Xs], [Y|Ys]) -> [{X, Y}|zip(Xs, Ys)].

lenient_zip([], _) -> [];
lenient_zip(_, []) -> [];
lenient_zip([X|Xs], [Y|Ys]) -> [{X, Y}| lenient_zip(Xs, Ys)].

quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot,Rest,[],[]),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_,[], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
    if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
       H >  Pivot -> partition(Pivot, T, Smaller, [H|Larger])
    end.
