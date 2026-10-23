Algoritmo CotizacionBasica
	
    Definir userName Como Cadena
    Definir hours Como Entero
    Definir precioPorHora, precioTotal Como Real
	
    precioPorHora <- 10000
	
    Escribir "===== COTIZACION BASICA ====="
    Escribir ""
	
    Escribir "Escriba su nombre:"
    Leer userName
	
    Escribir "Escriba el numero de horas que desea usar la bicicleta:"
    Leer hours
	
    Si hours > 0 Entonces
		
        precioTotal <- precioPorHora * hours
		
        Escribir ""
        Escribir "===== RESULTADO DE LA COTIZACION ====="
        Escribir "Hola, ", userName, ":"
		
        Si hours = 1 Entonces
            Escribir "Tu alquiler de ", hours, " hora cuesta $", precioTotal
        SiNo
            Escribir "Tu alquiler de ", hours, " horas cuesta $", precioTotal
        FinSi
		
    SiNo
        Escribir "La cantidad de horas debe ser mayor que cero."
    FinSi
	
FinAlgoritmo