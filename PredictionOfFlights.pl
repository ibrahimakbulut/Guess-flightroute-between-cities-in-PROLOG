flight(edirne,erzurum,5).
flight(antalya,izmir,1).
flight(izmir,istabul,3).
flight(istanbul,ankara,2).
flight(istanbul,trabzon,3).
flight(ankara,kars,3).
flight(ankara,diyarbakir,8).
flight(kars,gaziantep,3).
flight(antalya,diyarbakir,5).
flight(ankara,izmir,6).
flight(erzurum,antalya,2).
flight(trabzon,ankara,6).

flight(ankara,trabzon,6).
flight(antalya,erzurum,2).
flight(erzurum,edirne,5).
flight(izmir,antalya,1).
flight(istabul,izmir,3).
flight(ankara,istanbul,2).
flight(trabzon,istanbul,3).
flight(kars,ankara,3).
flight(diyarbakir,ankara,8).
flight(gaziantep,kars,3).
flight(diyarbakir,antalya,5).
flight(izmir,ankara,6).

%iki yönlü olarak  aktarmasız tüm uçuşlar tanımlanır.

route(A,B,C):-
	way_planning(A,B,C).
way_planning(A,B,Cost) :-
       flyed(A,B,[],0,Cost). 

%herhangi bir iki yer arasında rota olabilmesi için o iki yer ya direk aktarmasız uçuş ile uçulabilir yada aktarmalı olarak.
%burada recursive mantığı devreye giriyor.rota ;rota + flight gibi düşünülebilir.

flyed(A,B,H,OLD,COST) :- 
       flight(A,B,C1),
       \+member(H,A),
       COST is OLD + C1.
       

flyed(A,B,Passed,OLD,COST) :-
       flight(A,C,C2),
        \+member(C,Passed),          
       C \== B,
       flyed(C,B,[C|Passed],OLD,COST_TOTAL),
       COST is COST_TOTAL + C2.

%fleyd kuralı iki kere belirlenir.İlk kural flight olması.İkinci kural flight + rota(fleyd) olmasıdır.
%Geçilen noktaların daha önce üstünden geçtiğimiz yerler olmadığını anlamak için geçilen yerler için fonksiyonlara parametre göndeririz.
%Tabi bu sırada kabul edilen her flight ve flyed(rota)  için cost (maliyet) arttırılır.




