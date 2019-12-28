predicates
  likes(symbol,symbol) - nondeterm (i,i)

clauses
  likes(ellen,tennis).
  likes(john,football).
  likes(tom,baseball).
  likes(eric,swimming).
  likes(mark,tennis).
  likes(bill,Activity):-likes(tom, Activity).
