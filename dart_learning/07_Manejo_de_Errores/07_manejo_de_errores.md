# 07: Manejo de Errores en Dart

Incluso en el código mejor escrito, pueden ocurrir errores. Dart proporciona un mecanismo para manejar errores de forma controlada, permitiendo que tu aplicación se recupere de situaciones inesperadas sin cerrarse abruptamente. Este mecanismo se basa en el concepto de **excepciones**.

## Excepciones vs. Errores

En Dart, existen dos tipos principales de problemas en tiempo de ejecución:

- **`Exception`**: Es una condición de error prevista que una aplicación podría querer capturar. Por ejemplo, intentar dividir por cero o acceder a un recurso de red que no está disponible. Son problemas que un programa bien escrito debería poder manejar.

- **`Error`**: Representa problemas más serios que un programa normalmente no debería intentar capturar. Suelen ser errores de programación, como llamar a un método en una referencia nula (`NullThrownError`) o salirse de los límites de una lista (`RangeError`).

## Lanzando Excepciones: `throw`

Puedes lanzar (o "disparar") una excepción intencionadamente usando la palabra clave `throw`. Puedes lanzar instancias predefinidas de `Exception` o crear las tuyas propias.

```dart
void verificarEdad(int edad) {
  if (edad < 18) {
    // Lanza una excepción si la condición no se cumple
    throw Exception('La edad no puede ser menor a 18.');
  }
  print('Edad verificada correctamente.');
}
```

## Capturando Excepciones: `try-catch-finally`

Para manejar una excepción y evitar que detenga tu programa, usas un bloque `try-catch`.

- **`try`**: Envuelve el código que podría lanzar una excepción.
- **`catch`**: Se ejecuta si se lanza una excepción dentro del bloque `try`. Permite manejar el error.
- **`finally`**: Es un bloque opcional que se ejecuta **siempre**, sin importar si se lanzó una excepción o no. Es ideal para limpiar recursos, como cerrar archivos o conexiones de red.

### Sintaxis de `try-catch`

```dart
try {
  // Código propenso a errores
  var resultado = 10 ~/ 0; // División entera por cero
  print(resultado);
} on IntegerDivisionByZeroException {
  // Bloque 'on' para capturar un tipo específico de excepción
  print('Error específico: No se puede dividir por cero.');
} catch (e, s) {
  // Bloque 'catch' para capturar cualquier otra excepción
  // 'e' es la excepción lanzada
  // 's' es el StackTrace (la pila de llamadas que llevó al error)
  print('Ocurrió un error inesperado: $e');
  print('StackTrace: \n$s');
} finally {
  // Este bloque se ejecuta siempre
  print('Operación terminada. Limpiando recursos...');
}
```

- **`on`**: Se usa para manejar tipos de excepciones específicos. Es la forma preferida si conoces el tipo de excepción que podría ocurrir.
- **`catch`**: Se usa para capturar excepciones de manera más general. Puede recibir el objeto de la excepción y, opcionalmente, el `StackTrace`.

Usar `try-catch` de manera efectiva es fundamental para construir aplicaciones fiables y resilientes que puedan manejar problemas sin fallar.

