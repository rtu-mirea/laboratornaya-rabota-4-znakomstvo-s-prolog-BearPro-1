
domains
  s=symbol
predicates
  nondeterm parent(s,s)
  nondeterm ancestor(s,s)
  nondeterm brother(s,s)
  nondeterm sister(s, s)
  female(s)
  male(s)
  nondeterm mother(s,s)
  father(s,s)
  child(s,s)
clauses
  parent(pam,bob).
  parent(tom,bob).
  parent(tom,liz).
  parent(bob,ann).
  parent(bob,pat).
  parent(pat,jim).
  female(pam).
  female(liz).
  female(ann).
  female(pat).
  male(tom).
  male(bob).
  male(jim).
  child(Y,X):- parent(X,Y).
  mother(X,Y):- parent(X,Y),female(X).
  father(X,Y):-	parent(X,Y),male(X).
  ancestor(X,Z):- parent(X,Z).
  ancestor(X,Z):- parent(X,Y),ancestor(Y,Z).
  brother(X,Y):- parent(Z, X), parent(Z, Y), X<>Y, male(X).
  sister(X,Y):- parent(Z, X), parent(Z, Y), X<>Y, female(X).
 goal
  sister(A, B).
   
