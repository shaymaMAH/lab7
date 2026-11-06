% shopping.pl - Lab 7, Part 1: Shopping Program
% Run with:  ?- start.

:- dynamic basket/1.

% The basket starts with five items, stored as ONE list.
basket([coffee, milk, chocolate, apple, juice]).

start :- menu.

% ---------- menu ----------
menu :-
    nl,
    write('** SHOPPING LIST **'), nl,
    write('d. display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. exit.'), nl,
    write('ENTER YOUR CHOICE .'), nl,
    read(Choice),
    do(Choice).

% ---------- actions ----------
do(d) :-
    basket(L),
    display_items(L),          % recursion over the list
    menu.

do(a) :-
    write('enter the item you want to add it'), nl,
    read(Item),
    retract(basket(L)),
    append(L, [Item], NewL),   % add at the end of the basket
    assertz(basket(NewL)),
    write('The item has been added'), nl,
    menu.

do(e) :-
    write('Goodbye!'), nl.

do(_) :-
    write('Invalid choice, try again.'), nl,
    menu.

% ---------- recursion over the list ----------
display_items([]).                         % stop at the empty list
display_items([H|T]) :-
    write(H), nl,
    display_items(T).
