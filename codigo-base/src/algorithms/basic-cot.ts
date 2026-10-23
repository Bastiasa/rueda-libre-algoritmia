import inquirer from "inquirer";
import { cop, validNumberWrapper } from "../utils.js";
import { URBAN_BIKE_PRICE_PER_HOUR } from "../data.js";

export async function cotizacionBasica() {
    const { hours, userName } = await inquirer.prompt([
        {
            name: "userName",
            message: "Escriba su nombre",
            type: "input",
            validate(text: string) {
                if (text.trim().length <= 1) {
                    return "Debes escribir tu nombre.";
                }

                return true;
            },
        },

        {
            name: "hours",
            message: "Escriba el número de horas que desea usar la bicicleta",
            type: "number",
            validate: validNumberWrapper(),
        },
    ]);

    const totalPrice = URBAN_BIKE_PRICE_PER_HOUR * hours;

    console.log(
        `Hola, ${userName}: tu alquiler de ${hours} hora${hours !== 1 ? "s" : ""} cuesta ${cop(totalPrice)}`,
    );
}
