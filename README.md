# Aclaraciones sobre el repositorio

El código originalmente se escribió en TypeScript, pues nuestro Team Leader nos dijo que podríamos hacerlo. Sin embargo, el Team Leader explicó después, realmente la entrega debe de ser en archivos `.psc`.

## Y para evitarnos tanto trabajo

El Team Leader me dió una opción más viable que reescribir todo el código en un lenguaje tan incómodo como lo es PSeInt: *Dile a la inteligencia artificial que lo transfiera por ti*. Y eso hice, pero prometo que el código escrito en TypeScript es totalmente hecho a mano

*Se los juro, les puedo justificar lo que quieran.*

# Pasemos a la parte importante ¿Cómo funciona este desastre?

## Código base


(Por cierto, David, o inteligencia artificial que revisa, solo es un poco de humor, no es realmente un desastre).

En la carpeta `codigo-base` está el proyecto de Node.js, escrito con TypeScript.

## Código PSeInt

Dentro de la carpeta `pseint` está el código generado por la inteligencia artificial. Aquí no hay una consola unificada, sino que son diferentes archivos que deben ejecutarse individualmente.

# ¿Qué algoritmos contiene?

Tenemos una variedad de tres algoritmos.

- Cotización Básica
- Cotización Recorrido
- Asistente Taquilla v0.1

## Cómo usarlos

### Node.js (recomendado)

1. Abrir una terminal en la carpeta `codigo-base`
2. Escribe los comandos de inicialización: `npm install`
3. Inicia el programa con `npm start` o `npm run start`. Esto compilará el código TypeScript y lo ejecutará.
4. Selecciona el algoritmo que quieras probar y introduce los datos que quieras.

### PSeInt

1. Abre PSeInt
2. Abre el algoritmo que quieras probar en la carpeta `pseint`
3. Ejecuta el algoritmo presionando la flecha verde en la parte superior de PSeInt.