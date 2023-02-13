/*facts*/

male(abir).
male(partho).
male(robi).
male(arup).
male(indro).
male(rupak).
male(topon).
male(sujit).
male(shuvo).
male(anik).
male(suborno).
male(motin).
male(souvik).
male(nirjon).
male(raj).
male(milon).
male(pranto).
male(jeet).
male(amit).
male(prokash).
male(suman).


female(indrani).
female(mimi).
female(payel).
female(srabonti).
female(sayoni).
female(tithi).
female(kajol).
female(dipa).
female(proma).
female(charly).
female(kohinoor).
female(mohona).
female(bristy).
female(priya).
female(beauty).
female(rifa).






father(abir,partho).
father(abir,robi).
father(partho,arup).
father(partho,indro).
father(arup,sujit).
father(indro,shuvo).
father(sujit,motin).
father(sujit,souvik).
father(motin,rifa).
father(souvik,pranto).
father(souvik,jeet).
father(robi,topon).
father(robi,rupak).
father(topon,anik).
father(anik,nirjon).
father(anik,raj).
father(nirjon,amit).
father(raj,prokash).
father(rupak,subrono).
father(subroto,milon).
father(milon,suman).



mother(indrani,partho).
mother(indrani,robi).
mother(mimi,arup).
mother(mimi,indro).
mother(srabonti,sujit).
mother(sayoni,shuvo).
mother(dipa,sanjoy).
mother(dipa,souvik).
mother(kohinoor,rifa).
mother(mohona,pranto).
mother(mohona,jeet).
mother(payel,topon).
mother(payel,rupak).
mother(tithi,anik).
mother(proma,nirjon).
mother(proma,raj).
mother(bristy,amit).
mother(priya,prokash).
mother(kajol,suborno).
mother(charly,milon).
mother(beauty,suman).



/*rules*/

parent(X,Y):-
     mother(X,Y);
     father(X,Y).

sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

sibling(Y,X):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

grandparent(X,Y):-
     parent(Z,Y),
     parent(X,Z).


greatgrandparent(X,Y):-
    parent(X,P),
    parent(P,Z),
    parent(Z,Y).

greatgreatgrandparent(X,Y):-
     parent(A,Y),
     parent(B,A),
     parent(C,B),
     parent(X,C).

firstcousin(X,Y):-
    parent(Z,X),
    parent(W,Y),
    sibling(Z,W).
firstcousin(Y,X):-
    parent(Z,X),
    parent(W,Y),
    sibling(Z,W).

secondcousin(X,Y):-
    greatgrandparent(Z,X),
    greatgrandparent(Z,Y),
    \+firstcousin(X,Y),
    \+sibling(X,Y),
    X\=Y.
	
thirdcousin(X,Y):-
    greatgreatgrandparent(Z,X),
    greatgreatgrandparent(Z,Y),
    \+firstcousin(X,Y),
    \+secondcousin(X,Y),
    \+sibling(X,Y),
    X\=Y.

firstcousin_onceremoved(X,Y):-
    parent(Z,Y),
    firstcousin(X,Z).
firstcousin_onceremoved(X,Y):-
    parent(Z,X),
    firstcousin(Z,Y).

firstcousin_twiceremoved(X,Y):-
    firstcousin(X,Z),
    grandparent(Z,Y).
firstcousin_twiceremoved(X,Y):-
    firstcousin(Z,Y),
    grandparent(Z,X).

secondcousin_onceremoved(X,Y):-
     parent(Z,Y),
     secondcousin(X,Z).
secondcousin_onceremoved(X,Y):-
     parent(Z,X),
     secondcousin(Z,Y).

secondcousin_twiceremoved(X,Y):-
     grandparent(Z,Y),
     secondcousin(X,Z).
secondcousin_twiceremoved(X,Y):-
     grandparent(Z,X),
     secondcousin(Z,Y).

thirdcousin_onceremoved(X,Y):-
     parent(Z,Y),
     thirdcousin(X,Z).
thirdcousin_onceremoved(X,Y):-
     parent(Z,X),
     thirdcousin(Z,Y).

thirdcousin_twiceremoved(X,Y):-
     grandparent(Z,Y),
     thirdcousin(X,Z).
thirdcousin_twiceremoved(X,Y):-
     grandparent(Z,X),
     thirdcousin(Z,Y).

