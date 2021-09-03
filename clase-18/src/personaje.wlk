import wollok.game.*

object personaje {
	const posicionInicial = game.at(4, 4)
	var position = posicionInicial
	var direccion = abajo
	method position() = position
	method image() = direccion.imagen()
	method volveAlPrincipio() {
		position = posicionInicial
	}
	method abajo() {
		self.mirarHacia(abajo)
		self.avanzar()
	}
	method izquierda() {
		self.mirarHacia(izquierda)
		self.avanzar()
	}
	method derecha() {
		self.mirarHacia(derecha)
		self.avanzar()
	}
	method arriba() {
		self.mirarHacia(arriba)
		self.avanzar()
	}
	method mirarHacia(nuevaDireccion) {
		direccion = nuevaDireccion
	}

	method avanzar() {
		position = self.siguientePosicion()
	}

	method siguientePosicion() = direccion.siguientePosicion(position)

	method atacar() {
		espada.position(self.siguientePosicion())
		if(!game.hasVisual(espada)) {
			game.addVisual(espada)
		}
	}
	
	method colisionasteConEnemigo(enemigo) {
		self.volveAlPrincipio()
	}
}

object espada {
	var property position = game.at(0, 0)
	method image() = "Visuals/OBJECTS/items/sword.png"
	
	method colisionasteConEnemigo(enemigo) {
		game.removeVisual(enemigo)
	}
}

object arriba {
	method siguientePosicion(posicion) {
		return posicion.up(1)	
	}
	method imagen() = "Visuals/CHARACTERS/player/hero-arriba.png"
}
object izquierda {
	method siguientePosicion(posicion) = posicion.left(1)
	method imagen() = "Visuals/CHARACTERS/player/hero-izquierda.png"
}
object derecha {
	method siguientePosicion(posicion) = posicion.right(1)
	method imagen() = "Visuals/CHARACTERS/player/hero-derecha.png"
}
object abajo {
	method siguientePosicion(posicion) = posicion.down(1)
	method imagen() = "Visuals/CHARACTERS/player/hero-abajo.png"
}