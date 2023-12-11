dados_quadrimestrais(1, alberto, 40, 12, 18, 22).
dados_quadrimestrais(1, barbara, 25, 25, 24, 1).
dados_quadrimestrais(1, carol, 48, 30, 25, 23).
dados_quadrimestrais(1, deivid, 15, 10, 12, 3).
dados_quadrimestrais(1, ester, 8, 7, 8, 0).

dados_quadrimestrais(2, alberto, 16, 2, 4, 12).
dados_quadrimestrais(2, barbara, 32, 24, 20, 12).
dados_quadrimestrais(2, carol, 20, 10, 15, 5).
dados_quadrimestrais(2, deivid, 30, 30, 20, 10).
dados_quadrimestrais(2, ester, 18, 2, 2, 16).

dados_quadrimestrais(3, alberto, 10, 3, 5, 5).
dados_quadrimestrais(3, barbara, 18, 10, 12, 6).
dados_quadrimestrais(3, carol, 21, 16, 18, 3).
dados_quadrimestrais(3, deivid, 25, 19, 18, 7).
dados_quadrimestrais(3, ester, 20, 12, 10, 10).

bonificacao(Vendedor, Quadrimestre) :-
    dados_quadrimestrais(Quadrimestre, Vendedor, Atendimentos, Vendas, Elogio, Reclamacao),
    Atendimentos =:= Vendas,
    Elogio >= 0.8 * (Elogio + Reclamacao).

notificacao(Vendedor, Quadrimestre) :-
    dados_quadrimestrais(Quadrimestre, Vendedor, _, _, Elogio, Reclamacao),
    Reclamacao >= 0.5 * (Elogio + Reclamacao).

demissao(Vendedor) :-
    dados_quadrimestrais(Quadrimestre1, Vendedor, _, Vendas, _, _),
    Vendas = 0, dados_quadrimestrais(Quadrimestre, Vendedor, _, Vendas2, _, _),
    Quadrimestre \= Quadrimestre1, Vendas2 = 0.
