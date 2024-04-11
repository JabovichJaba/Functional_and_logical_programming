man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).


men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.
% children(X+)
children(X):- parent(X,Y), print(Y), nl, fail.

% mother(X+, Y+)
mother(X,Y):- woman(X), parent(X,Y).
% mother(X+)
mother(X):- mother(Y,X), print(Y), nl, fail.

% brother(X+, Y+)
brother(X,Y):- man(X), parent(Z,X), parent(Z,Y), woman(Z), X \= Y.
% brothers(X+)
brothers(X):- brother(Y,X), print(Y), nl, fail.

% b_s(X+, Y+)
b_s(X,Y):- parent(Z,X), parent(Z,Y), woman(Z), X \= Y.
% b_s(X+)
b_s(X):- b_s(X, Y), print(Y), nl, fail.

%daughter(X+, Y+)
daughter(X,Y):- woman(X), parent(Y,X).
%daughter(X+)
daughter(X):- daughter(Y,X), print(Y), nl, fail.
%wife(X+, Y+)
wife(X,Y):- woman(X), parent(X,Z), parent(Y,Z).
%wife(X+)
wife(X):- wife(Y,X), print(Y), nl, !.