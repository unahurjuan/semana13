//
// 3. Parcelas
//

import planta.*

class Parcela
{
	var property ancho
	var property largo
	var property hora
	var property coleccionPlanta = []
	
	method superficie      () { return ancho * largo }
	method cantidadMaxima  ()
	{
		var resultado
		
		if (ancho > largo)
			resultado = self.superficie() / 5
		else
			resultado = self.superficie() / 3 + largo
		
		return resultado
	}
	method hayComplicacion ()       { return coleccionPlanta.any ({ planta => hora > planta.toleranciaSol() }) }
	method plantarPlanta   (planta)
	{
		var check_1 = coleccionPlanta.size() + 1 > self.cantidadMaxima()
		var check_2 = (planta.toleranciaSol() - hora).abs() >= 2 
		
		if (check_1 or check_2)
			self.error("Esta planta no se puede plantar en esta parcela.")
		else
			coleccionPlanta.add(planta)
	}
}

//
// 5. Asociacion de plantas
//

class ParcelaEcologica inherits Parcela
{
	method plantaAsociacion(planta)
	{
		return planta.parcelaIdeal(self) and not self.hayComplicacion()
	}
}

class ParcelaIndustrial inherits Parcela
{
	method plantaAsociacion(planta)
	{
		return self.coleccionPlanta().size() <= 2 and planta.plantaFuerte()
	}
}