class Persona {
	const personalidad
	var comoViaja = noEstaSubida	
	
	method quiereSubirseEn(unMicro) = personalidad.quiereSubirseEn(unMicro)
	method bajarse(unMicro) {
		comoViaja.seBajoDe(unMicro)
		comoViaja = noEstaSubida
	}
	method subirse(modoDeViaje, unMicro) {
		comoViaja = modoDeViaje
		modoDeViaje.seSubioA(unMicro)
	}
}

class Apurada {
	method quiereSubirseEn(unMicro) {
		return true;
	}
}

class Moderada {
	
	var property minimoEspacioDisponible
	
	method quiereSubirseEn(unMicro) {
		return unMicro.quedanLugares(minimoEspacioDisponible);
	}
}

class Claustrofobica {
	method quiereSubirseEn(unMicro) {
		return unMicro.volumen() > 120;
	}
}

class Fiaca {
	method quiereSubirseEn(unMicro) {
		return unMicro.quedaLugarParaSentarse()
	}
}

class Obsecuente {
	var jefe
	method quiereSubirseEn(unMicro) {
		return jefe.quiereSubirseEn(unMicro)
	}
}

object noEstaSubida {
	method seBajoDe(unMicro) {
		self.error("No se puede bajar a alguien que no esta viajando")
	}
}
object parada {
	method seSubioA(unMicro) = unMicro.ocuparLugarParado()
	method seBajoDe(unMicro) = unMicro.liberarLugarParado()
}
object sentada {
	method seSubioA(unMicro) = unMicro.ocuparLugarSentado()
	method seBajoDe(unMicro) = unMicro.liberarLugarSentado()
}