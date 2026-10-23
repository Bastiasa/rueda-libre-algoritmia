import inquirer from "inquirer";
import {
    RouteData,
    ROUTES,
    URBAN_BIKE_PRICE_PER_HOUR,
    VOLUNTARY_CONTRIBUTION_PERCENTAGE,
} from "../data.js";
import { cop, routeToString, validNumberWrapper } from "../utils.js";

export async function asistenteTaquillav0_1() {
    const {
        bikes,
        hours,
        route,
        people,
        applyVoluntaryContribution,
    }: {
        bikes: number;
        hours: number;
        route: RouteData;
        people: number;
        applyVoluntaryContribution: boolean;
    } = (await inquirer.prompt([
        {
            name: "bikes",
            type: "number",
            message: "Escriba el número de bicicletas urbanas para alquilar.",
            required: true,
            validate: validNumberWrapper((n) => {
                if (n <= 0) {
                    return "Debe alquilar al menos una bicicleta";
                }

                return true;
            }),
        },

        {
            name: "hours",
            type: "number",
            message: "Escriba la cantidad de horas que durará el alquiler",
            required: true,
            validate: validNumberWrapper((n: number) => {
                if (n < 1) {
                    return "Debe alquilar por lo menos una hora";
                }

                return true;
            }),
        },

        {
            name: "route",
            type: "select",
            message: "Seleccione la ruta que le gustaría tener",
            choices: [
                ...ROUTES.map((route) => ({
                    name: routeToString(route),
                    value: route,
                })),

                {
                    name: "Ninguna",
                    value: null,
                },
            ],
        },

        {
            name: "people",
            type: "number",
            required: true,
            message:
                "Escriba la cantidad de personas que participarán en el recorrido.",
            validate: validNumberWrapper((n: number) => {
                if (n < 1) {
                    return "Debe haber por lo menos una persona.";
                }

                return true;
            }),
        },

        {
            name: "applyVoluntaryContribution",
            type: "select",
            message: "¿Desea hacer un aporte voluntario del 10%?",
            choices: [
                {
                    value: true,
                    name: "Sí",
                },
                {
                    value: false,
                    name: "No",
                },
            ],
        },
    ])) as any;

    let startingPrice = bikes * URBAN_BIKE_PRICE_PER_HOUR * hours;

    if (route) {
        startingPrice += route[3] * people;
    }

    const voluntaryContribution =
        startingPrice * VOLUNTARY_CONTRIBUTION_PERCENTAGE;

    const finalPrice = applyVoluntaryContribution
        ? startingPrice + voluntaryContribution
        : startingPrice;

    let pricePerPerson = finalPrice / people;
    pricePerPerson = Math.ceil(pricePerPerson / 100) * 100;

    console.log(`El costo del alquiler sería de ${cop(finalPrice)}`);

    applyVoluntaryContribution
        ? console.log(
              `Gracias por tu aporte voluntario de ${cop(voluntaryContribution)} (el 10%).`,
          )
        : console.log(`Sin aporte voluntario :(.`);

    if (people > 1) {
        console.log(
            `Si se desean dividir la cuenta entre las ${people} personas, el precio que cada uno debe pagar es de ${cop(pricePerPerson)}`,
        );
    }
}
