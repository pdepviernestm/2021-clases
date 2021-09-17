import personas.*

class Micro {
		
	var property maximoPersonasSentadas 
	var property maximoPersonasParadas
	const property volumen = 100
	var personasQueSeSubieronSentadas = 0
	var personasQueSeSubieronParadas = 0

	method puedeSubir(unaPersona) {
		return self.hayLugar() and unaPersona.quiereSubirseEn(self)
	}
	
	method hayLugar() {
		return self.quedanLugares(1);
	}
	
	method quedanLugares(unaCantidad) {
		return self.cuantosLugaresLibresQuedan() >= unaCantidad
	}
	
	method lugaresParaIrSentado() {
		return maximoPersonasSentadas - personasQueSeSubieronSentadas
	}

	method lugaresParaIrParado() {
		return maximoPersonasParadas - personasQueSeSubieronParadas
	}
	
	method quedaLugarParaSentarse() {
		return self.lugaresParaIrSentado() > 0
	}
	
	method subirA(unaPersona) {
		if (self.puedeSubir(unaPersona)) {
			unaPersona.subirse(self.comoPuedeViajar(), self)
		} else {
			self.error("no se puede subir")
		}
	}
	
	method comoPuedeViajar() {
		if(self.quedaLugarParaSentarse()) {
			return sentada
		} else {
			return parada
		}
	}
	
	method ocuparLugarParado() {
		personasQueSeSubieronParadas += 1
	}
	method ocuparLugarSentado() {
		personasQueSeSubieronSentadas += 1	
	}
	method liberarLugarParado() {
		personasQueSeSubieronParadas -= 1
	}
	method liberarLugarSentado() {
		personasQueSeSubieronSentadas -= 1	
	}
	
	method bajarA(unaPersona) {
		unaPersona.bajarse(self)
	}
	
	method cuantosLugaresLibresQuedan() {
		return self.lugaresParaIrSentado() + self.lugaresParaIrParado()
	}
}