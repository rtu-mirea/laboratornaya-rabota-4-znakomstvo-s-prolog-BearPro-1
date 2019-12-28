domains
  s=symbol
  n=integer
predicates
  whants(s, s)
  costs(s, n)
  money(s, n)
  can_buy(s, s)
clauses
  whants(tom, car).
  whants(jim, pizza).
  costs(pizza, 200).
  costs(car, 300000).
  money(tom, 4000).
  money(jim, 4000).
  can_buy(Person, Item) :- whants(Person, Item), money(Person, Has), costs(Item, Cost), Cost<=Has.
goal
  can_buy(jim, pizza).