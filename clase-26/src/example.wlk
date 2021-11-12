
class Minion {
	var estamina
	const herramientas = []
	const tareasRealizadas = []
	const raza = biclope
	var rol = mucama
	
	method rol() = rol
	
	method comerFruta(unaFruta) {
		estamina = raza.estaminaQueAporta(estamina, unaFruta.estamina())
	}
	
	method dificultadParaDefenderUnSector(gradoDeAmenaza) =
		raza.dificultadParaDefenderUnSector(gradoDeAmenaza)
	
	method estamina() = estamina
	
	method experiencia() =
		tareasRealizadas.size() * tareasRealizadas.sum { tarea => tarea.dificultad(self) }
		
	method realizo(tarea) = tareasRealizadas.contains(tarea)
	
	method disminuirEstamina(estaminaPerdida) {
		estamina -= estaminaPerdida
	}
	
	method tieneEstaminaSuficiente(estaminaRequerida) = estamina >= estaminaRequerida
	
	method tieneHerramienta(unaHerramienta) = herramientas.contains(unaHerramienta)
	
	method validarSiSePuedeRealizarTarea(tarea) {
		if(not tarea.puedeSerRealizadaPor(self)) {
			self.error("No pudo realizar la tarea")
		}
	}
	
	method realizarTarea(tarea) {
		self.validarSiSePuedeRealizarTarea(tarea)
		tareasRealizadas.add(tarea)
		self.disminuirEstamina(tarea.estaminaRequerida())
	}
	
	method fuerza() = raza.fuerza(rol.fuerza((estamina / 2) + 2))
	
	method tieneMasFuerzaQue(unaFuerza) = self.fuerza() > unaFuerza
}

object obrero {
	method fuerza(fuerzaBase) = fuerzaBase
}

object mucama {
	method fuerza(fuerzaBase) = fuerzaBase
}

class Soldado {
	var danioPorPractica
	
	method fuerza(fuerzaBase) = fuerzaBase + danioPorPractica
}

object biclope {
	method dificultadParaDefenderUnSector(gradoDeAmenaza) = gradoDeAmenaza
	
	method estaminaQueAporta(estamina, estaminaAAgregar) = (estamina + estaminaAAgregar).min(10)
	
	method fuerza(unaFuerza) = unaFuerza
}

object ciclope {
	method dificultadParaDefenderUnSector(gradoDeAmenaza) = gradoDeAmenaza * 2
	
	method estaminaQueAporta(estamina, estaminaAAgregar) = estamina + estaminaAAgregar
	
	method fuerza(unaFuerza) = unaFuerza / 2
}

// alternativa con herencia:
//class Minion {
//	var estamina
//	
//	method comerFruta(unaFruta)
//	
//	method estamina() = estamina
//  
//  method dificultadParaDefenderUnSector(gradoDeAmenaza) = gradoDeAmenaza
//}
//
//class Biclope inherits Minion {
//	override method comerFruta(unaFruta) {
//		estamina = (estamina + unaFruta.estamina()).min(10)
//	}
//}
//
//class Ciclope inherits Minion {
//	override method comerFruta(unaFruta) {
//		estamina += unaFruta.estamina()
//	}
//  method dificultadParaDefenderUnSector(gradoDeAmenaza) = super(gradoDeAmenaza) * 2
//}




object uva {
	method estamina() = 1
}

object manzana {
	method estamina() = 5
}

object banana {
	method estamina() = 10
}

//class Fruta {
//	const estamina
//	method estamina() = estamina
//}
//
//const uva = new Fruta(estamina = 1)
//const manzana = new Fruta(estamina = 5)
//const banana = new Fruta(estamina = 10)
