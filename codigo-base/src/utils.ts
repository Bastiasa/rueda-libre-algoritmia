import { RouteData } from "./data.js";

const copFormatter = new Intl.NumberFormat("es-CO", {
    currency: "COP",
});

export function cop(n: number) {
    return `$${copFormatter.format(n)}`;
}

export function validNumberWrapper(
    validator: (n: number) => true | string = () => true,
) {
    return (n: number) => {
        if (n === undefined || n === null || (n as any) === "") {
            return "Debes escribir un valor.";
        }

        return validator(n);
    };
}

export function routeToString(route: RouteData) {
    return `${route[0]}, ${route[1]}km, ${route[2]}h, ${cop(route[3])} por persona`;
}
