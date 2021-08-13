parejaPosible(Persona, pareja(Persona, OtraPersona, GradoDeCompatibilidad)):-
    preferencia(Persona, PreferenciaDePersona, OtraPersona),
    preferencia(OtraPersona, PreferenciaDeOtraPersona, Persona),
    GradoDeCompatibilidad is 6 - PreferenciaDePersona - PreferenciaDeOtraPersona.
  
  mejorPareja(Persona, pareja(Persona, Otro, Grado)):-
    parejaPosible(Persona, pareja(Persona, Otro, Grado)),
    forall(parejaPosible(Persona, pareja(Persona, _, OtroGrado)),
           OtroGrado =< Grado).
  
  seVanAPelear(Pareja, OtraPareja):-
    personasDeLaPareja(A, B, Pareja),
    personasDeLaPareja(C, D, OtraPareja),
    prefiere(A, C, B),
    prefiere(C, A, D).
  
  seVanAPelear(Pareja, OtraPareja):-
    personasDeLaPareja(A, B, Pareja),
    personasDeLaPareja(A, C, OtraPareja),
    B \= C.
  
  personasDeLaPareja(UnaPersona, OtraPersona, pareja(UnaPersona, OtraPersona, _)).
  personasDeLaPareja(UnaPersona, OtraPersona, pareja(OtraPersona, UnaPersona, _)).
  
    
  prefiere(Persona, Crush, Pareja):-
    parejaPosible(Persona,pareja(Persona,Crush,G)),
    parejaPosible(Persona,pareja(Persona,Pareja,G2)),
    G > G2.
    
    
  