/* 
 * Попытка решить задачу Эйнштейна на Visual Prolog 5.2
 * Не работает. Я так и не понял, как в начале нулевых 
 * тут определялись сложные типы.
 */
domains
  house = symbol*.
  house_list = house*.
  
constants
  
predicates
  nondeterm who_is(house_list, symbol)
  nondeterm member(house, house_list)
  nth1(integer, house_list, house) - 
    determ(i,i,i) 
    nondeterm(i,o,o) 
    determ(i,[o,o,o,o,o|i],[i,o,o,o,o|i])
    determ(i,i,[o,o,o,i,o|i])
  
  nondeterm nextto(house, house, house_list)
  nondeterm neighbors(house, house, house_list)
  houses(house_list)
clauses
  member(X, [X | _]).
  member(X, [_ | Rest]) :- member(X, Rest).
  nth1(1, [Elem | _], Elem).
  nth1(N, [_ | Rest], Elem) :- N > 1, K = N-1, nth1(K, Rest, Elem).
  nextto(L, R, [L, R | _]).
  nextto(L, R, [_ | Rest]) :- nextto(L, R, Rest).
  neighbors(X, Y, List) :- nextto(X, Y, List).
  neighbors(X, Y, List) :- nextto(Y, X, List).
  houses(X) :- X = [_,_,_,_,_].
  who_is(Houses, Owner) :-
    nth1(1, Houses, [norwegian,_,_,_,_]),
    member([englishman,_,_,_,red], Houses),
    nextto([_,_,_,_,green], [_,_,_,_,white], Houses),
    member([dane,_,_,tea,_], Houses),
    neighbors([_,_,marlboro,_,_], [_,cat,_,_,_], Houses),
    member([_,_,dunhill,_,yellow], Houses),
    member([german,_,rothmans,_,_], Houses),
    nth1(3, Houses, [_,_,_,milk,_]),
    neighbors([_,_,marlboro,_,_], [_,_,_,water,_], Houses),
    member([_,bird,pallmall,_,_], Houses),
    member([swede,dog,_,_,_], Houses),
    neighbors([norwegian,_,_,_,_], [_,_,_,_,blue], Houses),
    member([_,horse,_,_,blue], Houses),
    member([_,_,winfield,beer,_], Houses),
    member([_,_,_,coffee,green], Houses),
    member([Owner,fish,_,_,_], Houses).
goal
  who_is([_,_,_,_,_], norwegian).