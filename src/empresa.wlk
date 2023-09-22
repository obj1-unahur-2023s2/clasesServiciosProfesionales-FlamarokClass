import solicitantes.*
import profesionales.*
import universidad.*

class Empresa {
	var property honorariosDeReferencia
	const property profesionales = #{} // conjunto para que no se pueda agregar dos veces el mismo
	// esto me da un setter, no getter ya que es un const
	// const property profesionales = new Set() // es lo mismo
	
	const property clientes = #{}
	
	method cuantosEstudiaronEn(unaUniversidad) = profesionales.count({p => p.universidad() == unaUniversidad})
	
	method profesionalesCaros() = profesionales.filter({p => p.honorariosPorHora() > honorariosDeReferencia})
	
	method universidadesFormadoras() = profesionales.map({p => p.universidad()}).asSet() // map devuelve una LISTA y lo transformamos en conjunto para quitar otra vez repetidos
	
	method profesionalesMasBaratos() = profesionales.min({p => p.honorariosPorHora()})
	
	method esDeGenteAcotada() = not profesionales.any({p => p.provinciasDondePuedeTrabajar().size() > 3})
	
	method puedeSatisfacer(unSolicitante) = profesionales.any({p => unSolicitante.puedeSerAtendidoPor(p)})
	// dentro del conjunto profesionales alguno puede atender al solicitante
	
	method agregarCliente(unCliente){
		clientes.add(unCliente)
	}
	
	method darServicio(unSolicitante){
		if(self.puedeSatisfacer(unSolicitante)){
			var elegido = profesionales.filter({p => unSolicitante.puedeSerAtendidoPor(p)}).anyOne()
			elegido.cobrar(elegido.honorariosPorHora())
			self.agregarCliente(unSolicitante)
		}
	}
	
	method cuantosClientesTiene() {
		return clientes.size()
	}
	
	method tieneAlCliente(unCliente) {
		return clientes.contains(unCliente)
	}
}




