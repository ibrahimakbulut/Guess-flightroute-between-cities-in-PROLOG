# Predicating-flightroute-between-cities-in-PROLOG
Write the predicate “route(X,Y,C) – a route between X and Y exists with cost C” that checks if there is a
route between any given two cities. 
Your Prolog program should have all the facts and predicates/rules. See the following:
% knowledge base
…
flight(istanbul,izmir,3). % fact: Istanbul and Izmir has a flight with cost 3.
…
% rules
…
route(X,Y,C) :- flight(X,Y,C). % a predicate indicating there exist a route between
 % X and Y if there is flight between X and Y with cost
 % C.
…
A single query to complete your program should check if there is a direct route between two given
cities. Alternatively, it can list all the connected cities for a given city. See the following:
?- route(edirne,X,C).
X = erzurum, C = 15 ;
X = antalya, C = 7 ;
…
