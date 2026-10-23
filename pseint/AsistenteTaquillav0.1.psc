Proceso AsistenteTaquillaV0_1
    Definir bikes, hours, opcionRuta, aporte Como Entero
    Definir precioBicicleta, precioRuta Como Real
    Definir startingPrice, voluntaryContribution Como Real
    Definir finalPrice, pricePerPerson Como Real
    Definir nombreRuta Como Caracter
	
    precioBicicleta <- 10000
	
    Escribir "=== RUEDA LIBRE - ASISTENTE TAQUILLA v0.1 ==="
    Escribir ""
	
    // Solicitar cantidad de bicicletas
    Repetir
        Escribir "Escriba el numero de bicicletas urbanas para alquilar:"
        Leer bikes
		
        Si bikes <= 0 Entonces
            Escribir "Debe alquilar al menos una bicicleta."
        FinSi
    Hasta Que bikes > 0
	
    // Solicitar horas de alquiler
    Repetir
        Escribir "Escriba la cantidad de horas que durara el alquiler:"
        Leer hours
		
        Si hours < 1 Entonces
            Escribir "Debe alquilar por lo menos una hora."
        FinSi
    Hasta Que hours >= 1
	
    // Seleccionar recorrido
    Escribir ""
    Escribir "Seleccione la ruta que le gustaria tener:"
    Escribir "1. Rio y Parques - 12 km - 2 horas - $45000"
    Escribir "2. Sabores de Barrio - 18 km - 3 horas - $60000"
    Escribir "3. Rio y Parques - 25 km - 4 horas - $85000"
    Escribir "4. Ninguna"
	
    Repetir
        Leer opcionRuta
		
        Si opcionRuta < 1 O opcionRuta > 4 Entonces
            Escribir "Seleccione una opcion entre 1 y 4."
        FinSi
    Hasta Que opcionRuta >= 1 Y opcionRuta <= 4
	
    // Asignar precio de la ruta
    Segun opcionRuta Hacer
        1:
            nombreRuta <- "Rio y Parques"
            precioRuta <- 45000
        2:
            nombreRuta <- "Sabores de Barrio"
            precioRuta <- 60000
        3:
            nombreRuta <- "Rio y Parques (25 km)"
            precioRuta <- 85000
        4:
            nombreRuta <- "Ninguna"
            precioRuta <- 0
    FinSegun
	
    // Calcular precio del alquiler y recorrido
    startingPrice <- bikes * precioBicicleta * hours
	
    Si opcionRuta <> 4 Entonces
        startingPrice <- startingPrice + precioRuta * bikes
    FinSi
	
    // Preguntar por aporte voluntario
    Escribir ""
    Escribir "Desea hacer un aporte voluntario del 10%?"
    Escribir "1. Si"
    Escribir "2. No"
	
    Repetir
        Leer aporte
		
        Si aporte <> 1 Y aporte <> 2 Entonces
            Escribir "Ingrese 1 para Si o 2 para No."
        FinSi
    Hasta Que aporte = 1 O aporte = 2
	
    // Calcular aporte voluntario
    voluntaryContribution <- startingPrice * 0.10
	
    // Calcular costo final
    Si aporte = 1 Entonces
        finalPrice <- startingPrice + voluntaryContribution
    SiNo
        finalPrice <- startingPrice
        voluntaryContribution <- 0
    FinSi
	
    // Calcular precio por persona
    pricePerPerson <- finalPrice / bikes
	
    // Redondear hacia arriba a la centena
    pricePerPerson <- REDON(pricePerPerson / 100)
	
    Si pricePerPerson * 100 < finalPrice / bikes Entonces
        pricePerPerson <- pricePerPerson + 1
    FinSi
	
    pricePerPerson <- pricePerPerson * 100
	
    // Mostrar resultados
    Escribir ""
    Escribir "=== RESUMEN DE LA CUENTA ==="
    Escribir "Bicicletas alquiladas: ", bikes
    Escribir "Horas de alquiler: ", hours
    Escribir "Ruta seleccionada: ", nombreRuta
    Escribir "Costo del alquiler y recorrido: $", startingPrice
	
    Si aporte = 1 Entonces
        Escribir "Aporte voluntario (10%): $", voluntaryContribution
        Escribir "Gracias por tu aporte voluntario."
    SiNo
        Escribir "Sin aporte voluntario."
    FinSi
	
    Escribir "Costo final del alquiler: $", finalPrice
	
    Si bikes > 1 Entonces
        Escribir "Si dividen la cuenta entre las ", bikes, " personas:"
        Escribir "Cada persona debe pagar: $", pricePerPerson
    FinSi
	
FinProceso