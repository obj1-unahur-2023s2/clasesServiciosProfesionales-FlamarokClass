import profesionales.*

class Persona {
	var property provinciaDondeVive
	
	method puedeSerAtendidoPor(unProfesional) {
		return unProfesional.provinciasDondePuedeTrabajar().contains(provinciaDondeVive)
	}
}

class Institucion {
	const universidadesQueReconoce = #{}
	
	method puedeSerAtendidoPor(unProfesional) {
		return universidadesQueReconoce.contains(unProfesional.universidad())
	}
	
	// hacer un setter o definir las universidades cuando se inicialice la instancia
}

class Club {
	const provinciasDondeEsta = #{}
	
	method puedeSerAtendidoPor(unProfesional) {
		return not provinciasDondeEsta.intersection(unProfesional.provinciasDondePuedeTrabajar()).isEmpty()
	}
}