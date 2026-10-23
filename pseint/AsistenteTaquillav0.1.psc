Algoritmo AsistenteTaquilla

Definir bicicletas, horas, personas Como Entero
Definir ruta, opcionAporte Como Entero
Definir precioBicicleta, precioRuta Como Real
Definir precioInicial, aporteVoluntario Como Real
Definir precioFinal, precioPorPersona Como Real

// Precio por bicicleta por hora
precioBicicleta <- 10000

// Solicitar cantidad de bicicletas
Repetir
    Escribir "Ingrese el numero de bicicletas urbanas que desea alquilar:"
    Leer bicicletas

    Si bicicletas <= 0 Entonces
        Escribir "Debe alquilar al menos una bicicleta."
    FinSi
Hasta Que bicicletas > 0

// Solicitar cantidad de horas
Repetir
    Escribir "Ingrese la cantidad de horas que durara el alquiler:"
    Leer horas

    Si horas < 1 Entonces
        Escribir "Debe alquilar por lo menos una hora."
    FinSi
Hasta Que horas >= 1

// Seleccionar ruta
Escribir ""
Escribir "Seleccione la ruta que desea realizar:"
Escribir "1. Rio y Parques - 12 km - 2 horas - $45000 por persona"
Escribir "2. Sabores de Barrio - 18 km - 3 horas - $60000 por persona"
Escribir "3. Rio y Parques - 25 km - 4 horas - $85000 por persona"
Escribir "4. Ninguna"

Repetir
    Leer ruta

    Si ruta < 1 O ruta > 4 Entonces
        Escribir "Seleccione una opcion valida entre 1 y 4."
    FinSi
Hasta Que ruta >= 1 Y ruta <= 4

// Asignar precio de la ruta
Segun ruta Hacer
    1:
        precioRuta <- 45000
    2:
        precioRuta <- 60000
    3:
        precioRuta <- 85000
    4:
        precioRuta <- 0
FinSegun

// Solicitar cantidad de personas
Repetir
    Escribir "Ingrese la cantidad de personas que participaran en el recorrido:"
    Leer personas

    Si personas < 1 Entonces
        Escribir "Debe haber por lo menos una persona."
    FinSi
Hasta Que personas >= 1

// Calcular el costo del alquiler de las bicicletas
precioInicial <- bicicletas * precioBicicleta * horas

// Agregar el precio de la ruta por persona
Si ruta <> 4 Entonces
    precioInicial <- precioInicial + (precioRuta * personas)
FinSi

// Consultar aporte voluntario
Escribir ""
Escribir "Desea realizar un aporte voluntario del 10 %?"
Escribir "1. Si"
Escribir "2. No"

Repetir
    Leer opcionAporte

    Si opcionAporte <> 1 Y opcionAporte <> 2 Entonces
        Escribir "Ingrese 1 para Si o 2 para No."
    FinSi
Hasta Que opcionAporte = 1 O opcionAporte = 2

// Calcular aporte voluntario del 10 %
aporteVoluntario <- precioInicial * 0.10

// Calcular el precio final
Si opcionAporte = 1 Entonces
    precioFinal <- precioInicial + aporteVoluntario
SiNo
    precioFinal <- precioInicial
FinSi

// Calcular el precio por persona
precioPorPersona <- precioFinal / personas

// Redondear hacia arriba al siguiente multiplo de 100
precioPorPersona <- Trunc((precioPorPersona + 99) / 100) * 100

// Mostrar resumen de la compra
Escribir ""
Escribir "========================================"
Escribir "       RESUMEN DEL ALQUILER"
Escribir "========================================"
Escribir "Cantidad de bicicletas: ", bicicletas
Escribir "Horas de alquiler: ", horas

Segun ruta Hacer
    1:
        Escribir "Ruta seleccionada: Rio y Parques (12 km)"
    2:
        Escribir "Ruta seleccionada: Sabores de Barrio (18 km)"
    3:
        Escribir "Ruta seleccionada: Rio y Parques (25 km)"
    4:
        Escribir "Ruta seleccionada: Ninguna"
FinSegun

Escribir "Cantidad de personas: ", personas
Escribir "Costo inicial: $", precioInicial

Si opcionAporte = 1 Entonces
    Escribir "Aporte voluntario (10 %): $", aporteVoluntario
SiNo
    Escribir "Aporte voluntario: $0"
FinSi

Escribir "Costo total del alquiler: $", precioFinal

Si personas > 1 Entonces
    Escribir "Precio por persona: $", precioPorPersona
FinSi

Escribir "========================================"


FinAlgoritmo