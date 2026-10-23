const copFormatter = new Intl.NumberFormat("es-CO", {
    currency: "COP",
});
export function cop(n) {
    return `$${copFormatter.format(n)}`;
}
