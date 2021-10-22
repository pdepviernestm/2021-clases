
class BigoteDeGato {
	method rareza() = 1
	method hervir() {
		
	}
}

class HiedraVenenosa {
	var concentracion
	
	method concentracion() = concentracion
	
	method rareza() = self.concentracion()
	
	method hervir() {
		concentracion = concentracion * 2
	}
}


class Trebol {
	var hojas
	
	method hojas() = hojas
	
	method rareza() {
		if(hojas == 4) {
			return 20
		} else {
			return 1
		}
	}
	
	method hervir() {
		hojas -= 1
	}
}

