Algoritmo CotizacionRecorrido
	
    Definir opcion, personas Como Entero
    Definir precioPersona, precioTotal Como Real
    Definir anticipo, saldoPendiente Como Real
    Definir nombreRecorrido Como Cadena
    Definir distancia, duracion Como Entero
	
    Escribir "===== COTIZACION DE RECORRIDO ====="
    Escribir ""
    Escribir "Seleccione el recorrido:"
    Escribir "1. Rio y Parques - 12 km - 2 horas - $45000 por persona"
    Escribir "2. Sabores de Barrio - 18 km - 3 horas - $60000 por persona"
    Escribir "3. Rio y Parques - 25 km - 4 horas - $85000 por persona"
    Escribir ""
	
    Escribir "Ingrese el numero del recorrido:"
    Leer opcion
	
    Segun opcion Hacer
        1:
            nombreRecorrido <- "Rio y Parques"
            distancia <- 12
            duracion <- 2
            precioPersona <- 45000
			
        2:
            nombreRecorrido <- "Sabores de Barrio"
            distancia <- 18
            duracion <- 3
            precioPersona <- 60000
			
        3:
            nombreRecorrido <- "Rio y Parques"
            distancia <- 25
            duracion <- 4
            precioPersona <- 85000
			
        De Otro Modo:
            Escribir "Opcion no valida."
    FinSegun
	
    // Si opcion >= 1 Y opcion <= 3 Entonces
		
        Escribir ""
        Escribir "Recorrido seleccionado: ", nombreRecorrido
        Escribir "Distancia: ", distancia, " km"
        Escribir "Duracion: ", duracion, " horas"
        Escribir ""
		
        Escribir "Ingrese la cantidad de personas:"
        Leer personas
		
        // Si personas > 0 Entonces
			
            precioTotal <- precioPersona * personas
            anticipo <- Redon(precioTotal * 0.30)
            saldoPendiente <- precioTotal * 0.70
			
            Escribir ""
            Escribir "===== RESULTADO DE LA COTIZACION ====="
            Escribir "Precio por persona: $", precioPersona
            Escribir "Cantidad de personas: ", personas
            Escribir "Precio total del recorrido: $", precioTotal
            Escribir "Anticipo del 30%: $", anticipo
            Escribir "Saldo pendiente: $", saldoPendiente
			
        //SiNo
            //Escribir "La cantidad de personas debe ser mayor que cero."
        //FinSi
		
    //FinSi
	
FinAlgoritmo