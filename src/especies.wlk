class EspecieFauna {
	const property pesoReferencia = 150	
	const property coefDeEspecie = pesoReferencia/2   
}
 

class EspecieFlora {
	const property alturaReferencia = 10
}


class Animal {
	var property peso
	const property especie
	var property biomasa=(peso**2)/especie.coefDeEspecie()
	var property estaVivo
	var property locomocion
    const property pesoReferencia
    
    method esPequenio() = peso < self.pesoReferencia()
	method esGrande() = peso > (self.pesoReferencia()*2)
	method esMediano() = not self.esPequenio() and not self.esGrande()
    method consecuenciaDeIncendio() { 
    	estaVivo = self.locomocion().seSalva(self)
    	peso -= peso*0.10
    }      
}

class Planta {
	
	var property altura 
	const property especie 
	var property estaVivo = true
	const property biomasa = altura*2 
	
	method esGrande() = altura>=10
	method esPequenio() = altura <10
	method esMediano(){return false}
	method estaVivo() = estaVivo
	method eliminarPlanta(){estaVivo = false}
	method consecuenciaDeIncendio(){
		if (self.esGrande()) {altura -= 5}
		else {self.eliminarPlanta()}
	}
}

object quedarseQuieto{
	method seSalva(animal) = false
}

object correr {
	method seSalva(animal) = animal.esMediano()
}

object volar {
	method seSalva(animal) = animal.esGrande()
}

object nadar {
	method seSalva(animal) = true
}