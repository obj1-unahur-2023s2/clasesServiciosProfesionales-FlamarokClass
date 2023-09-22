class Universidad {
	const property provincia
	var property honorariosRecomendado
	var donacionesTotal = 0
	
	method recibirDonaciones(unValor) {
		donacionesTotal += unValor
	}
}

object asociacionProfesionalesDelLitoral {
	var donacionesTotal = 0
	
	method recibirDonaciones(unValor) {
		donacionesTotal += unValor
	}
}

// Ambos deben ser polimorficos aunque uno sea clases y otro objeto unico