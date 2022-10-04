import especies.*

object reserva {
	const habitats = []
	
	method habitatConMayorBiom(){
		return habitats.max({h=>h.biomasaHabitat()})
	}
	method biomasaTotal(){
		return habitats.sum({h=>h.biomasaHabitat()})
	}
	method hayEspecieEnHabitats(especie){
		habitats.all({h=>h.hayEspecie(especie)}) 
	}
	method habitatsNoEquilibrados()=habitats.filter({h=>not h.estaEnEquilibrio()})
}

class Habitat {
	const seresVivos = []	
	
	method hayEspecie(especie){
		seresVivos.any({s=>s.especie()})
	}
	method producirIncendio(){
		
	}
	
	method biomasaHabitat()=seresVivos.sum({s=>s.biomasa()})
	
	method cantPequenios()=seresVivos.count({s=>s.esPequenio()})
	
	method cantMedianos()=seresVivos.count({s=>s.esMediano()})
	
	method cantGrandes()=seresVivos.count({s=>s.esGrande()})
	
	method estaEnEquilibrio()=(self.cantGrandes()<self.cantPequenios()/3) and self.cantMedianos()>=1
		
}

