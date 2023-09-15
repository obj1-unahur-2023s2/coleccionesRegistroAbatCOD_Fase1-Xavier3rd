object registroAbatidosCOD {
	const registro = []
	
	method agregarAbatidosDia(cantidad, dia){
		if (self.yaEstaElDia(dia)){
			self.error("Ya esta el dia")
		}
		registro.add([cantidad, dia])
	}
	
	method agregarAbatidosVariosDias(registrosAbatidos){
		if(listaDeDias.any{e => !self.yaEstaElDia(e)}){
			
		}
		
		registro.addAll(registrosAbatidos)
	}
	
	method dia(reg) = reg.get(1)
	
	method cantidad(reg) = reg.first()
	
	method yaEstaElDia(dia) = registro.any({r => self.dia(r) == dia})
	
	method registroDia(dia) = registro.find({r => self.dia(r) == dia})
	
	method eliminarElRegistroDelDia(dia){
		if (!self.yaEstaElDia(dia)){
			self.error("El dia no está en la lista")
		}
		registro.remove(self.registroDia(dia))
	}
	
	
	method eliminarVariosRegistrosDeDias(listaDeDias){
		if (!listaDeDias.all{e => self.yaEstaElDia(e)}){
			self.error("Algun dia de la lista no esta en el registro")
		}
		listaDeDias.forEach{e => self.eliminarElRegistroDelDia(e)}	
	}
	
	method cantidadDeDiasRegistrados() = registro.size()
	method esVacioElRegistro() = registro.isEmpty()
	method algunDiaAbatio(cantidad) = registro.any({r => self.cantidad(r) == cantidad})
	method primerValorDeAbatidos() = self.cantidad(registro.first())
	method ultimoValorDeAbatidos() = self.cantidad(registro.last())
	method ultimoValorDeAbatidosConSize() = self.cantidad(registro.get(registro.size()-1))
	method maximoValorDeAbatidos() = registro.max({r => self.cantidad(r)}).first()
	method totalAbatidos() = registro.sum({r => self.cantidad(r)})
	method cantidadDeAbatidosElDia(dia) = self.cantidad(self.registroDia(dia))

	method esCrack() = (1..registro.size()-1).all({ i => self.cantidad(registro.get(i))> self.cantidad(registro.get(i-1))})

}