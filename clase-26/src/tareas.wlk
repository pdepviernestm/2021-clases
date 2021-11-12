import example.*

class ArreglarMaquina {
	const complejidadMaquina
	const herramientasNecesarias = []
	
	method dificultad(minion) = complejidadMaquina * 2
	
	method estaminaRequerida() = complejidadMaquina
	
	method puedeSerRealizadaPor(minion) =
		minion.tieneEstaminaSuficiente(self.estaminaRequerida()) &&
			herramientasNecesarias.all { herramienta => minion.tieneHerramienta(herramienta) }
}

object destornillador {}

class DefenderUnSector {
	const gradoDeAmenaza
	
	method dificultad(minion) = minion.dificultadParaDefenderUnSector(gradoDeAmenaza)
	
	method puedeSerRealizadaPor(minion) = minion.rol() != mucama && minion.tieneMasFuerzaQue(gradoDeAmenaza)
}

class LimpiarSector {
	const grande

	method dificultad(minion) = dificultadDeLimpiarSector.dificultad()
	
	method estaminaRequerida() {
		if(grande) {
			return 4
		} else {
			return 1
		}
	}
	
	method puedeSerRealizadaPor(minion) = minion.tieneEstaminaSuficiente(self.estaminaRequerida())
}

object dificultadDeLimpiarSector {
	var dificultad = 10

	method cambiarDificultad(nuevaDificultad) {
		dificultad = nuevaDificultad
	}

	method dificultad() = dificultad
}

