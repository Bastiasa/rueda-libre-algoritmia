import inquirer from "inquirer";
import { cop } from "../utils.js";
const ROUTES = [
    ["Río y Parques", 12, 2, 45_000],
    ["Sabores de Barrio", 18, 3, 60_000],
    ["Río y Parques", 25, 4, 85_000],
];
const ADVANCE_PAYMENT_PERCENTAGE = 0.3;
export async function cotizacionRecorrido() {
    const { selectedRoute, peopleCount, } = (await inquirer.prompt([
        {
            message: "Seleccione el recorrido",
            type: "select",
            name: "selectedRoute",
            choices: ROUTES.map((route, routeIndex) => ({
                name: `${route[0]}, ${route[1]}km, ${route[2]}h, ${cop(route[3])} (por persona)`,
                value: route,
            })),
        },
        {
            message: "Escriba la cantidad de personas",
            type: "number",
            name: "peopleCount",
            transform(value) {
                return Math.floor(value);
            },
        },
    ]));
    const totalPrice = selectedRoute[3] * peopleCount;
    const advancePayment = Math.round(totalPrice * ADVANCE_PAYMENT_PERCENTAGE);
    const outstandingBalance = totalPrice * (1 - ADVANCE_PAYMENT_PERCENTAGE);
    console.log(`El precio total del recorrido es: ${cop(totalPrice)}.`);
    console.log(`Para poder confirmar, debes pagar un anticipo del 30%, que sería: ${cop(advancePayment)}.`);
    console.log(`Luego tendrás un saldo pendiente de ${cop(outstandingBalance)}.`);
}
