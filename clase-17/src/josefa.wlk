object josefa {
 	var gramosComidos = 0
 	var kilometrosVolados = 0
 	const energiaInicial = 80
 	
 	method energia(){
 		return energiaInicial + 5 * gramosComidos - 3 * kilometrosVolados
 	}
 	method comer(gramos){
 		gramosComidos = gramosComidos + gramos
 	}
 	method volar(kilometros){
 		kilometrosVolados = kilometrosVolados + kilometros
 	}
 	
 	method estadoEmocional(){
 		if(gramosComidos > kilometrosVolados)
 		  return "Bonita y gordita"
 		if(energiaInicial < self.energia())
 		  return "Energica"
 		if(self.volo() && not self.comio())
 		  return "Explotada"
 		return "Indiferente"
 	}
 	
 	method comio(){
 		return gramosComidos > 0
 	}
 	
 	method volo(){
 		return kilometrosVolados > 0
 	}
 }
 