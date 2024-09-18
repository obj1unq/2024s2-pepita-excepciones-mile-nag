object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method validarSiPuedeVolar(distancia) {
		if (!self.puedeVolar(distancia)) {
			self.error("Pepita no tiene energía para volar")
		}
	}

	method puedeVolar(distancia) {
		return (energia - 10 - distancia) >= 0
	}

	method volar(distancia) {
		self.validarSiPuedeVolar(distancia)
		energia = energia - 10 - distancia
	}

	method energia() {
	  return energia
	}
}

object pepon {
	var energia = 30
	
	method comer(comida) {
		energia += comida.energiaQueAporta() / 2
	}
		
	method validarSiPuedeVolar(distancia) {
		if (!self.puedeVolar(distancia)) {
			self.error("Pepon no tiene energía para volar")
		}
	}

	method puedeVolar(distancia) {
		return (energia - 20 - 2 * distancia) >= 0
	}
	
	method volar(distancia) {
		self.validarSiPuedeVolar(distancia)
		energia = energia - 20 - 2 * distancia
	}
	
	method energia() {
	  return energia
	}
}

object milena {
	const aves = [pepita, pepon]
	
	method puedeMovilizarLasAves(distancia) {
		return aves.all{ ave => ave.puedeVolar(distancia) }
	}

	method movilizar(distancia) {
		if (self.puedeMovilizarLasAves(distancia)) {
			aves.map({ ave => ave.volar(distancia) })
		} else {
			self.error("Algún bicho no tiene energía para volar")
		}
	}
}
