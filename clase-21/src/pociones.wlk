
class Pocion {
	const ingredientes = [] // tambien se podria escribir como: new List()

	method agregarIngrediente(ingrediente) {
		ingredientes.add(ingrediente)
	}

	method cantidadIngredientes() = ingredientes.size()

	method rareza() {
		if(ingredientes.isEmpty()) {
			return 0
		} else {
			const rarezaTotal = ingredientes.sum { ingrediente => ingrediente.rareza() } 
			return rarezaTotal / self.cantidadIngredientes()
		}
	}
	
	method hervir() {
		ingredientes.forEach { ingrediente => ingrediente.hervir() }
	}
	
	method destilar() {
		ingredientes.removeAllSuchThat { ingrediente => ingrediente.rareza() < 5 }
	}
	
	method esRara() {
		return ingredientes.all { ingrediente => ingrediente.rareza() > 10 }
	}
}

// alternativa para destilar:

//class Pocion {
//	var ingredientes = []
//	
//	...codigo...
//	
//	method destilar() {
//		ingredientes = ingredientes.filter { ingrediente => ingrediente.rareza() >= 5 }
//	}
//}

