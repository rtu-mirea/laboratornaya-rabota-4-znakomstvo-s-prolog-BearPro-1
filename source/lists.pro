domains
  element_list = symbol*.
  elements = symbol.
constants
  
predicates
  nondeterm member(elements, element_list)
  nondeterm nth1(integer, element_list, elements)
  nondeterm nextto(elements, elements, element_list)
  nondeterm neighbors(elements, elements, element_list)
  nondeterm neighbors(elements, elements)
  street(element_list)
clauses
  member(X, [X | _]).
  member(X, [_ | Rest]) :- member(X, Rest).
  nth1(1, [Elem | _], Elem).
  nth1(N, [_ | Rest], Elem) :- N > 1, K = N-1, nth1(K, Rest, Elem).
  nextto(L, R, [L, R | _]).
  nextto(L, R, [_ | Rest]) :- nextto(L, R, Rest).
  neighbors(X, Y, List) :- nextto(X, Y, List).
  neighbors(X, Y, List) :- nextto(Y, X, List).
  neighbors(X, Y) :- street(L), nextto(X, Y, L).
  street(X) :- X = [bill, mike, ann].
goal
  neighbors(bill, ann).