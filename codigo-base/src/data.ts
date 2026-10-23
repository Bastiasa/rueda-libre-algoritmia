export type RouteData = [
    routeName: string,
    routeDistanceKilometers: number,
    routeDurationHours: number,
    routePricePerPerson: number,
];

export const ROUTES: RouteData[] = [
    ["Río y Parques", 12, 2, 45_000],
    ["Sabores de Barrio", 18, 3, 60_000],
    ["Río y Parques", 25, 4, 85_000],
];

export const VOLUNTARY_CONTRIBUTION_PERCENTAGE = 0.1;
export const ADVANCE_PAYMENT_PERCENTAGE = 0.3;
export const URBAN_BIKE_PRICE_PER_HOUR = 10_000;
