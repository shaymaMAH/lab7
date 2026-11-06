% lists_tasks.pl - Lab 7, Part 2 tasks

% ============================================================
% Task 1 - deleteElement(X, List, Result)
% Removes ALL occurrences of X and gives exactly ONE answer.
% ============================================================

% Base case: nothing to delete from the empty list
deleteElement(_, [], []).

% X is the head: drop it, keep deleting from the tail
deleteElement(X, [X|T], R) :-
    !,
    deleteElement(X, T, R).

% Head is something else: keep it, continue with the tail
deleteElement(X, [H|T], [H|R]) :-
    deleteElement(X, T, R).

% ?- deleteElement(1, [1,2,1,4,3,4,1,1,1,3,4,2,1,1,1], List).
% List = [2, 4, 3, 4, 3, 4, 2].
% ?- deleteElement(3, [1,2,1,4,3,4,1,1,1,3,4,2,1,1,1], List).
% List = [1, 2, 1, 4, 4, 1, 1, 1, 4, 2, 1, 1, 1].


% ============================================================
% Task 2 - add_at_the_end(X, List, Result)
% Adding to the front is free ([X|L]); adding to the end is not,
% because we must walk to the end of the list first.
% ============================================================

% Solution 1: recursion
add_at_the_end(X, [], [X]).
add_at_the_end(X, [H|T], [H|R]) :-
    add_at_the_end(X, T, R).

% Solution 2 (alternative, use instead of Solution 1):
% add_at_the_end(X, L, R) :- append(L, [X], R).
% (or with the lab's own conc: conc(L, [X], R).)

% ?- add_at_the_end(5, [1,2,3,4], List).
% List = [1, 2, 3, 4, 5].
% ?- add_at_the_end(d, [a,b,c], List).
% List = [a, b, c, d].
