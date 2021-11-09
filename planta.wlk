//
// 1. Plantas
//

import parcela.*

class Planta
{
	var property anio
	var property altura
	
	method plantaFuerte   () { return self.toleranciaSol() > 10 }
	method toleranciaSol  ()
	method nuevaSemilla   ()
	method espacioOcupado ()
	// 4. Parcelas ideales
	method parcelaIdeal   (parcela)
}

class Menta inherits Planta
{
	override method toleranciaSol  () { return 6 }
	override method nuevaSemilla   () { return self.plantaFuerte() or altura > 0.4 }
	override method espacioOcupado () { return altura * 3 }
	// 4. Parcelas ideales
	override method parcelaIdeal   (parcela) { return parcela.superficie() > 6 }
}

class Soja inherits Planta
{
	override method toleranciaSol  () 
	{
		var tolerancia = 0
		
		if (altura > 1)
			tolerancia = 9
		else if (altura.between(0.5, 1))
			tolerancia = 7
		else
			tolerancia = 6
		
		return tolerancia
	}
	override method nuevaSemilla   () { return self.plantaFuerte() or (anio > 2007 and altura > 1) }
	override method espacioOcupado () { return altura * 0.5 }
	// 4. Parcelas ideales
	override method parcelaIdeal   (parcela) { return parcela.hora() == self.toleranciaSol() }
}

class Quinoa inherits Planta
{
	var property tolerancia
	
	override method toleranciaSol  () { return tolerancia }
	override method nuevaSemilla   () { return self.plantaFuerte() or anio < 2005 }
	override method espacioOcupado () { return 0.5 }
	// 4. Parcelas ideales
	override method parcelaIdeal   (parcela) { return parcela.coleccionPlanta().all ({ p => p.altura() <= 1.5 }) }
}

//
// 2. Variedades
//

class SojaTransgenica inherits Soja
{
	override method nuevaSemilla   () { return false }
	// 4. Parcelas ideales
	override method parcelaIdeal   (parcela) { return parcela.cantidadMaxima() == 1 }
}

class Hierbabuena inherits Menta
{
	override method espacioOcupado () { return super() * 2 }
}