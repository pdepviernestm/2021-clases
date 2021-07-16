:- module(begin_tests_con, [begin_tests_con/2]).

predicado(Consulta, user:Name/Arity):- functor(Consulta, Name, Arity).

make_dynamic(Consulta):-
    predicado(Consulta, Predicado), dynamic(Predicado).

begin_tests_con(TestSuiteName, Consultas):-
    forall(member(C, Consultas), make_dynamic(C)),
    begin_tests(TestSuiteName, [
        setup(forall(member(C, Consultas), assert(user:C))),
        cleanup(forall(member(C, Consultas), retract(user:C)))
    ]).