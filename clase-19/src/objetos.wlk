class Golondrina {
	var energia = 100
	
	method energia() {
		return energia
	}
	
	method volar(kilometros){
		energia = energia - 40 - 5 * kilometros
	}
	
	method comer(gramos){
		energia = energia + 2 * gramos
	}
}

object entrenador {
	var ave = new Golondrina()
	
	method adoptaA(nuevaAve) {
		ave = nuevaAve
	}
	
	method entrenar() {
		ave.volar(10)
		ave.comer(20)
		if(ave.energia() < 20) {
			ave.comer(50)
		} else {
			ave.comer(2)
		}
	}
}

// SI quisiese tener una referencia global a un objeto creado a partir de una clase, como podria hacer?:
object tiendaDeMascotas {
	const pepa = new Golondrina()

	method pepa() = pepa
}

const pepa = new Golondrina()
