import especies.*

object reserva {
	const habitats = []
	
	method agregarHabitat(habitat){habitats.add(habitat)}
	method habitatConMayorBiom(){return habitats.max({h=>h.biomasaHabitat()})}
	method biomasaTotal(){return habitats.sum({h=>h.biomasaHabitat()})}
	method hayEspecieEnHabitats(especie){return habitats.all({h=>h.haySerVivo(especie)})}
	method habitatsNoEquilibrados()=habitats.filter({h=>not h.estaEnEquilibrio()})
}
    

class Habitat {
	const seresVivos = []
	
	method agregarSeresVivos(serVivo){seresVivos.add(serVivo)}
	method matarSeresVivos(serVivo){seresVivos.remove(serVivo)}
	method haySerVivo(serVivo){return seresVivos.any({s => s == serVivo})}
	method producirIncendio(){
		seresVivos.forEach({s => s.consecuenciaDeIncendio()})
		seresVivos.removeAll(seresVivos.filter({s => not s.estaVivo()})) 
	} 
	method biomasaHabitat()=seresVivos.sum({s=>s.biomasa()})
	method cantPequenios()=seresVivos.count({s=>s.esPequenio()})
	method cantMedianos()=seresVivos.count({s=>s.esMediano()})
	method cantGrandes()=seresVivos.count({s=>s.esGrande()})
	method estaEnEquilibrio()=(self.cantGrandes()<self.cantPequenios()/3) and self.cantMedianos() >= 1
}