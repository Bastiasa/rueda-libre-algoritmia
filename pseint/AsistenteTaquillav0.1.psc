Algoritmo AsistenteTaquilla

Definir bicicletas, horas, personas Como Entero
Definir ruta, opcionAporte Como Entero
Definir precioBicicleta, precioRuta Como Real
Definir precioInicial, aporteVoluntario Como Real
Definir precioFinal, precioPorPersona Como Real

// Precio del alquiler por bicicleta por hora
precioBicicleta <- 5000

// Solicitar cantidad de bicicletas
Repetir
    Escribir "Escriba el numero de bicicletas urbanas para alquilar:"
    Leer bicicletas

    Si bicicletas <= 0 Entonces
        Escribir "Debe alquilar al menos una bicicleta."
    FinSi
Hasta Que bicicletas > 0

// Solicitar cantidad de horas
Repetir
    Escribir "Escriba la cantidad de horas que durara el alquiler:"
    Leer horas

    Si horas < 1 Entonces
        Escribir "Debe alquilar por lo menos una hora."
    FinSi
Hasta Que horas >= 1

// Seleccionar ruta
Escribir "Seleccione la ruta que le gustaria tener:"
Escribir "1. Ruta corta"
Escribir "2. Ruta media"
Escribir "3. Ruta larga"
Escribir "4. Ninguna"

Repetir
    Leer ruta

    Si ruta < 1 O ruta > 4 Entonces
        Escribir "Seleccione una opcion valida entre 1 y 4."
    FinSi
Hasta Que ruta >= 1 Y ruta <= 4

// Asignar precio por persona segun la ruta
Segun ruta Hacer
    1:
        precioRuta <- 3000
    2:
        precioRuta <- 5000
    3:
        precioRuta <- 8000
    4:
        precioRuta <- 0
FinSegun

// Solicitar cantidad de personas
Repetir
    Escribir "Escriba la cantidad de personas que participaran en el recorrido:"
    Leer personas

    Si personas < 1 Entonces
        Escribir "Debe haber por lo menos una persona."
    FinSi
Hasta Que personas >= 1

// Calcular el precio inicial
precioInicial <- bicicletas * precioBicicleta * horas

Si ruta <> 4 Entonces
    precioInicial <- precioInicial + precioRuta * personas
FinSi

// Preguntar si desea realizar el aporte voluntario
Escribir "Desea hacer un aporte voluntario del 10 %?"
Escribir "1. Si"
Escribir "2. No"

Repetir
    Leer opcionAporte

    Si opcionAporte <> 1 Y opcionAporte <> 2 Entonces
        Escribir "Seleccione 1 para Si o 2 para No."
    FinSi
Hasta Que opcionAporte = 1 O opcionAporte = 2

// Calcular aporte voluntario
aporteVoluntario <- precioInicial * 0.10

// Calcular precio final
Si opcionAporte = 1 Entonces
    precioFinal <- precioInicial + aporteVoluntario
SiNo
    precioFinal <- precioInicial
FinSi

// Calcular precio por persona y redondear hacia arriba
precioPorPersona <- precioFinal / personas
precioPorPersona <- Redon((precioPorPersona + 99) / 100) * 100

// Mostrar resultados
Escribir ""
Escribir "========== RESUMEN DEL ALQUILER =========="
Escribir "El costo del alquiler seria de $", precioFinal

Si opcionAporte = 1 Entonces
    Escribir "Gracias por tu aporte voluntario de $", aporteVoluntario, " (el 10 %)."
SiNo
    Escribir "Sin aporte voluntario."
FinSi

Si personas > 1 Entonces
    Escribir "Si se desea dividir la cuenta entre las ", personas, " personas:"
    Escribir "Cada persona debe pagar aproximadamente $", precioPorPersona
FinSi

Escribir "=========================================="


FinAlgoritmo