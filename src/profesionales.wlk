import universidad.*

class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrar(unImporte) {
		asociacionProfesionalesDelLitoral.recibirDonaciones(unImporte)
	}
}


class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{universidad.provincia()} } // lo transformamos en una coleccion para respetar el polimorfismo con ProfesionalAsociado 
	method honorariosPorHora() { return universidad.honorariosRecomendado() }
	
	method cobrar(unImporte) {
		universidad.recibirDonaciones(unImporte/2)
	}
}


class ProfesionalLibre {
	var property universidad
	var property provinciasDondePuedeTrabajar
	var property honorariosPorHora
	const provincias = #{}
	var property totalRecaudado = 0
	
	method agregarProvincias(unaProvincia){provincias.add(unaProvincia)}
	method quitarrProvincias(unaProvincia){provincias.remove(unaProvincia)}
	
	method cobrar(unImporte) {
		totalRecaudado += unImporte
	}
	
	method pasarDinero(unProfesional, importe) {
		totalRecaudado -= importe.min(totalRecaudado) 
		//unProfesional.totalRecaudado(importe)
		unProfesional.cobrar(importe.min(totalRecaudado)) // no pasa mas de lo que tiene en totalRecaudado 
	}
	
}
