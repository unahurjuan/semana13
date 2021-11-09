//
// 6. Estadisticas del INTA
//

import parcela.*
import planta.*

object inta
{
	var property coleccionParcela = []
	
	method promedioPlanta()
	{
		var sumaPlanta     = coleccionParcela.sum({ p => p.coleccionPlanta().size() })
		var tamanioParcela = coleccionParcela.size()
		
		return sumaPlanta / tamanioParcela
	}
	
	method agregarParcela(parcela)
	{
		coleccionParcela.add(parcela)
	}
}