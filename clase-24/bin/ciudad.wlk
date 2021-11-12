class Ciudad {
	const property produccion
	const property ubicacion
	const necesidades = []
	
	method distanciaHasta(otraCiudad) = ubicacion.distance(otraCiudad.ubicacion())
	
	method satisfecha() = necesidades.isEmpty()
	
	method dar(producto) = necesidades.remove(producto)
	
	method necesitar(producto) = necesidades.add(producto)
}

