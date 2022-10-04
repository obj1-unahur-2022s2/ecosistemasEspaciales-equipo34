import especies.*

object reserva {
	const habitats = []
	
	method habitatConMayorBiom(){
		return habitats.max({h=>h.biomasaHabitat()})
	}
	method biomasaTotal(){
		return habitats.sum({h=>h.biomasaHabitat()})
	}
	method hayEspecieEnHabitats(sa){return habitats.sum({h=>h.especie()==sa})
	}
	
	method habitatsNoEquilibrados()=habitats.filter({h=>not h.estaEnEquilibrio()})
}
    

class Habitat {
	
	const seresVivos = []
	
	method producirIncendio(){ return 
		seresVivos.forEach{ a => a.consecuenciaDeIncendio() }
	} 
	method biomasaHabitat()=seresVivos.sum({s=>s.biomasa()})
	
	method cantPequenios()=seresVivos.count({s=>s.esPequenio()})
	
	method cantMedianos()=seresVivos.count({s=>s.esMediano()})
	
	method cantGrandes()=seresVivos.count({s=>s.esGrande()})
	
	method estaEnEquilibrio()=(self.cantGrandes()<self.cantPequenios()/3) and self.cantMedianos()>=1
		


	
	}



