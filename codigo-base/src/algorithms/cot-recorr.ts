import inquirer from "inquirer";
import { cop, routeToString, validNumberWrapper } from "../utils.js";
import { ADVANCE_PAYMENT_PERCENTAGE, ROUTES } from "../data.js";

export async function cotizacionRecorrido() {
    const {
        selectedRoute,
        peopleCount,
    }: { peopleCount: number; selectedRoute: (typeof ROUTES)[number] } =
        (await inquirer.prompt([
            {
                message: "Seleccione el recorrido",
                type: "select",
                name: "selectedRoute",
                choices: ROUTES.map((route, routeIndex) => ({
                    name: routeToString(route),
                    value: route,
                })),
            },

            {
                message: "Escriba la cantidad de personas",
                type: "number",
                name: "peopleCount",
                validate: validNumberWrapper(),
                transform(value: number) {
                    return Math.floor(value);
                },
            },
        ])) as any;

    const totalPrice = selectedRoute[3] * peopleCount;
    const advancePayment = Math.round(totalPrice * ADVANCE_PAYMENT_PERCENTAGE);
    const outstandingBalance = totalPrice * (1 - ADVANCE_PAYMENT_PERCENTAGE);

    console.log(`El precio total del recorrido es: ${cop(totalPrice)}.`);
    console.log(
        `Para poder confirmar, debes pagar un anticipo del 30%, que sería: ${cop(advancePayment)}.`,
    );
    console.log(
        `Luego tendrás un saldo pendiente de ${cop(outstandingBalance)}.`,
    );
}
