object chivita {
	method salirDeAhi() {
		lobo.sacarALaChiva()
	}
}

object lobo {
	method sacarALaChiva() {
		palo.pegarAlLobo()
	}
}

object palo {
	method pegarAlLobo() {
		self.error("El palo no quiere pegar al lobo")
	}
}