import inquirer from "inquirer";
import { ExitPromptError } from "@inquirer/core";
import { cotizacionBasica } from "./algorithms/basic-cot.js";
import { cotizacionRecorrido } from "./algorithms/cot-recorr.js";

const ALGOs: [string, () => any][] = [
    ["Cotización Básica", cotizacionBasica],
    ["Cotización Recorrido", cotizacionRecorrido],
];

async function main() {
    const { selectedAlgorithm } = await inquirer.prompt({
        type: "select",
        name: "selectedAlgorithm",
        message: "Seleccione el algoritmo de Rueda Libre",
        choices: [
            ...ALGOs.map(([name, algorithm]) => ({
                name: name,
                value: algorithm,
            })),
        ],
    });

    await selectedAlgorithm();
}

main().catch((e) => {
    if (e instanceof ExitPromptError) {
        console.log("Proceso cancelado con éxito.");
        process.exit(0);
    } else {
        throw e;
    }
});
