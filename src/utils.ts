const copFormatter = new Intl.NumberFormat("es-CO", {
    currency: "COP",
});

export function cop(n: number) {
    return `$${copFormatter.format(n)}`;
}
