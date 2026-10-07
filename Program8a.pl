% Flatten
flatten([], []).

flatten([H | T], FlatList) :-
    flatten(H, NewH),
    flatten(T, NewT),
    append(NewH, NewT, FlatList).

flatten(L, [L]).