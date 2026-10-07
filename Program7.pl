% Facts
connected(a, b).
connected(a, c).
connected(b, d).
connected(c, d).

% Depth First Search
depth_first_search(Start, Goal, Path) :-
    depth_first_search(Start, Goal, [Start], Path).

depth_first_search(Goal, Goal, Path, Path).

depth_first_search(Node, Goal, Visited, Path) :-
    connected(Node, NextNode),
    \+ member(NextNode, Visited),
    depth_first_search(
        NextNode,
        Goal,
        [NextNode | Visited],
        Path
    ).