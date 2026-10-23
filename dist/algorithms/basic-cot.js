import inquirer from "inquirer";
import { cop } from "../utils.js";
const PRICE_PER_HOUR = 10_000;
export async function cotizacionBasica() {
    const { hours, userName } = await inquirer.prompt([
        {
            name: "userName",
            message: "Escriba su nombre",
            type: "input",
        },
        {
            name: "hours",
            message: "Escriba el número de horas que desea usar la bicicleta",
            type: "number",
        },
    ]);
    const totalPrice = PRICE_PER_HOUR * hours;
    console.log(`Hola, ${userName}: tu alquiler de ${hours} hora${hours !== 1 ? "s" : ""} cuesta ${cop(totalPrice)}`);
}
