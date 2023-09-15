object registroAbatidosCOD {
	const registro = []
	
	method agregarAbatidosDia(cantidad, dia){
		if (self.yaEstaElDia(dia)){
			self.error("Ya esta el dia")
		}
		registro.add([cantidad, dia])
	}
	
	method agregarAbatidosVariosDias(registrosAbatidos){
		registro.addAll(registrosAbatidos)
	}
	
	method dia(reg) = reg.get(1)
	
	method cantidad(reg) = reg.get(0)
	
	method yaEstaElDia(dia) = registro.any({r => self.dia(r) == dia})
	
	method registroDia(dia) = registro.find({r => self.dia(r) == dia})
	
	method eliminarElRegistroDelDia(dia){
		if (!self.yaEstaElDia(dia)){
			self.error("El dia no está en la lista")
		}
		registro.remove(self.registroDia(dia))
	}
}