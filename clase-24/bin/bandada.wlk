
class Bandada {
	const aves
	
	method descansar() {
		aves.forEach { unAve => unAve.descansar() }
	}
	
	method volarA(destino) {
		self.validarQuePuedenVolarA(destino)
		aves.forEach { unAve => unAve.volarA(destino) }
	}
	
	method validarQuePuedenVolarA(destino) {
		aves.forEach { unAve => unAve.validarQuePuedeVolarA(destino) }
	}
	
	method transportarA(destino) {
		self.validarQuePuedenVolarA(destino)
		aves.forEach { unAve => unAve.transportarA(destino) }
	}
}

