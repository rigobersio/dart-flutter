# 01: Introducción a Dart

## ¿Qué es Dart?

Dart es un lenguaje de programación de código abierto y propósito general, desarrollado y mantenido por Google. Fue presentado en 2011 con el objetivo de ofrecer una alternativa más estructurada y robusta a JavaScript para el desarrollo web. Sin embargo, con el tiempo, su enfoque principal ha evolucionado.

Actualmente, Dart es conocido por ser el lenguaje detrás de **Flutter**, el popular framework de UI de Google para construir aplicaciones compiladas de forma nativa para móvil, web, escritorio y sistemas embebidos desde una única base de código.

## Historia y Evolución

- **2011:** Google presenta Dart como un lenguaje para la web, con su propia VM (Máquina Virtual de Dart) integrada en una versión especial de Chrome (Dartium).
- **2013:** Se lanza la primera versión estable, Dart 1.0.
- **2015:** Google presenta **Flutter** (inicialmente llamado Sky), un framework experimental para Android que utiliza Dart.
- **2018:** Se lanza Dart 2.0, una versión que marcó un punto de inflexión. Se centró en la seguridad de tipos (type safety), se eliminaron características que no tuvieron éxito y se optimizó para el desarrollo del lado del cliente. Este cambio consolidó a Dart como el lenguaje de Flutter.
- **2021:** Se introduce la seguridad de nulos (null safety), una característica moderna que ayuda a prevenir errores de referencia nula en tiempo de ejecución.

## Características Clave

Dart es un lenguaje moderno que combina características de muchos otros lenguajes. Si vienes de Java, C#, Swift o JavaScript, encontrarás muchos conceptos familiares.

1.  **Orientado a Objetos:** En Dart, todo es un objeto. Desde los números y booleanos hasta las funciones. Todos los objetos heredan de la clase `Object`.

2.  **Flexiblemente Tipado:** Dart es **fuertemente tipado**, lo que significa que cada variable debe tener un tipo definido. Sin embargo, ofrece flexibilidad a través de la **inferencia de tipos** (con la palabra clave `var`) y el tipo `dynamic`, aunque se recomienda especificar los tipos siempre que sea posible para aprovechar la seguridad que ofrece el lenguaje.

3.  **Compilación JIT y AOT:**
    *   **Just-In-Time (JIT):** Durante el desarrollo, Dart utiliza un compilador JIT. Esto permite la increíblemente útil función de **Hot Reload** de Flutter, donde los cambios en el código se inyectan en la aplicación en ejecución en menos de un segundo, preservando el estado de la app. Esto acelera drásticamente el ciclo de desarrollo.
    *   **Ahead-Of-Time (AOT):** Cuando la aplicación está lista para ser lanzada, Dart se compila a código máquina nativo (ARM o x86). Esto garantiza que la aplicación final tenga un rendimiento rápido y predecible, cercano al de una aplicación nativa pura.

4.  **Seguridad de Nulos (Null Safety):** El sistema de tipos de Dart distingue entre tipos que no pueden ser nulos y tipos que sí pueden serlo (marcados con un `?`). Esto obliga al desarrollador a manejar la posibilidad de valores nulos, eliminando una categoría entera de errores comunes en muchos otros lenguajes.

5.  **Multiplataforma:** Aunque su principal caso de uso es con Flutter, Dart es un lenguaje de propósito general. Se puede usar para crear aplicaciones de consola, scripts y servidores.

## El Famoso "Hola, Mundo"

La puerta de entrada a cualquier programa en Dart es la función `main()`. Este es el primer código que se ejecuta.

```dart
// Este es un comentario de una sola línea.

/*
 * Este es un comentario
 * de múltiples líneas.
 */

// La función main() es el punto de entrada de la aplicación.
void main() {
  // La función print() muestra un mensaje en la consola.
  print('¡Hola, Mundo desde Dart!');
}
```

En la carpeta `ejemplos` de esta sección, encontrarás el archivo `hola_mundo.dart` para que puedas ejecutarlo tú mismo.
