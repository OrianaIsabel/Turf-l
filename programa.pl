% Aquí va el código.
jockey(valdivieso, 155, 52).
jockey(leguisamo, 161, 49).
jockey(lezcano, 149, 50).
jockey(baratucci, 153, 55).
jockey(falero, 157, 52).

caballo(botafogo).
caballo(oldMan).
caballo(energica).
caballo(matBoy).
caballo(yatasto).

prefiere(botafogo, Jockey):-
    jockey(Jockey,_, Peso),
    Peso < 52.

prefiere(botafogo, baratucci).

prefiere(oldMan, Jockey):-
    jockey(Jockey,_,_),
    atom_length(Jockey, Largo),
    Largo > 7.

prefiere(energica, Jockey):-
    jockey(Jockey,_,_),
    not(prefiere(botafogo, Jockey)).

prefiere(matBoy, Jockey):-
    jockey(Jockey, Altura,_),
    Altura > 170.

representa(valdivieso, elTute).
representa(falero, elTute).
representa(lezcano, lasHormigas).
representa(baratucci, elCharabon).
representa(leguisamo, elCharabon).

gano(botafogo, granPremioNacional).
gano(botafogo, granPremioRepublica).
gano(oldMan, granPremioRepublica).
gano(oldMan, campeonatoPalermoDeOro).
gano(matBoy, granPremioCriadores).

% Punto 2

prefiereAVarios(Caballo):-
    caballo(Caballo),
    prefiere(Caballo, Jockey1),
    prefiere(Caballo, Jockey2),
    Jockey1 \= Jockey2.

% Punto 3

aborrece(Caballo, Stud):-
    caballo(Caballo),
    representa(_, Stud),
    forall(representa(Jockey, Stud), not(prefiere(Caballo, Jockey))).

% Punto 4

importante(granPremioNacional).
importante(granPremioRepublica).

ganoPremioImportante(Caballo):-
    caballo(Caballo),
    gano(Caballo, Premio),
    importante(Premio).

piolin(Jockey):-
    jockey(Jockey,_,_),
    forall(ganoPremioImportante(Caballo), prefiere(Caballo, Jockey)).

% Punto 5

primero(Caballo, [Caballo|_]).

segundo(Caballo, [_, Caballo|_]).

apuestaGanadora(ganadorPorCaballo(Caballo), Resultado):-
    primero(Caballo, Resultado).

apuestaGanadora(segundoPorCaballo(Caballo), Resultado):-
    primero(Caballo, Resultado).

apuestaGanadora(segundoPorCaballo(Caballo), Resultado):-
    segundo(Caballo, Resultado).

apuestaGanadora(exacta(Primero, Segundo), Resultado):-
    primero(Primero, Resultado),
    segundo(Segundo, Resultado).

apuestaGanadora(imperfecta(Caballo1, Caballo2), Resultado):-
    primero(Caballo1, Resultado),
    segundo(Caballo2, Resultado).

apuestaGanadora(imperfecta(Caballo1, Caballo2), Resultado):-
    primero(Caballo2, Resultado),
    segundo(Caballo1, Resultado).

% Punto 6

crin(botafogo, tordo).
crin(oldMan, alazan).
crin(energica, ratonero).
crin(matBoy, palomino).
crin(yatasto, pinto).

posee(tordo, negro).
posee(alazan, marron).
posee(ratonero, gris).
posee(ratonero, negro).
posee(palomino, marron).
posee(palomino, blanco).
posee(pinto, marron).
posee(pinto, blanco).

seriaComprado(Color, Caballo):-
    crin(Caballo, Crin),
    posee(Crin, Color).

serianComprados(Color, [Caballo]):-
    seriaComprado(Color, Caballo).

serianComprados(Color, [Caballo|Caballos]):-
    seriaComprado(Color, Caballo),
    serianComprados(Color, Caballos).
