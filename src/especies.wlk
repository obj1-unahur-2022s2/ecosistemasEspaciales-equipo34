
class EspecieFauna {
	const property pesoReferencia=150
	
	method coefDeEspecie()=pesoReferencia/2
	
	method locomocion()=[nadar,correr,quedarseQuieto,volar]
	
}

class EspecieFlora {
	const property alturaMaxima=10
	var property planta
}

class Animal {
	var property peso
	var property biomasa=(peso**2)/especie.coefDeEspecie()
	const property especie
	
	method esPequenio()=peso<especie.pesoReferencia()
	
	method esGrande()=peso>(especie.pesoReferencia()*2)
	
	method esMediano()= not self.esPequenio() and not self.esGrande()
	
	method sufrirIncendio(){
		peso-=peso*0.1
		
	}
}

class Planta {
	var property altura
	const property biomasa=altura*2
	const property especie
	
	method sufrirIncendio(){
		altura-=5
	}

}

object quedarseQuieto{
	method seSalva(animal)=false
}

object correr{
	method seSalva(animal)= animal.esMediano()
}
object volar {
	method seSalva(animal) = animal.esGrande()
}
object nadar {
	method seSalva(animal) = true
}