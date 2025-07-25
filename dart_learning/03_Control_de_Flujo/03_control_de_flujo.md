# 03: Estructuras de Control de Flujo

Las estructuras de control de flujo son esenciales en cualquier lenguaje de programación. Permiten que tu programa tome decisiones, repita acciones y cambie su comportamiento basado en diferentes condiciones.

## Condicionales: `if` y `else`

La estructura `if-else` es la forma más básica de toma de decisiones. Ejecuta un bloque de código si una condición es verdadera y, opcionalmente, otro bloque si es falsa.

```dart
int edad = 20;

if (edad >= 18) {
  print('Eres mayor de edad.');
} else if (edad >= 13) {
  print('Eres un adolescente.');
} else {
  print('Eres un niño.');
}
```

## Condicionales: `switch`

La declaración `switch` es una alternativa al `if-else` cuando se necesita comparar una única variable contra múltiples valores. Es especialmente útil y legible cuando hay muchos casos posibles.

**Importante:** Cada bloque `case` no vacío en Dart debe terminar con una declaración de salida, comúnmente `break`. Olvidarlo es un error.

```dart
String estado = 'pendiente';

switch (estado) {
  case 'aprobado':
    print('El estado es aprobado.');
    break;
  case 'rechazado':
    print('El estado es rechazado.');
    break;
  case 'pendiente':
    print('El estado está pendiente de revisión.');
    break;
  default:
    print('Estado desconocido.');
}
```

## Bucles: Repitiendo Acciones

### Bucle `for`

El bucle `for` es ideal cuando sabes de antemano cuántas veces quieres repetir una acción. Consta de un inicializador, una condición y un incrementador.

```dart
for (int i = 1; i <= 5; i++) {
  print('Repetición número: $i');
}
```

### Bucle `for-in`

Este bucle es la forma más sencilla de iterar sobre todos los elementos de una colección, como una `List` o un `Set`.

```dart
List<String> frutas = ['Manzana', 'Banana', 'Cereza'];

for (String fruta in frutas) {
  print('Fruta actual: $fruta');
}
```

### Bucle `while`

El bucle `while` repite un bloque de código **mientras** una condición sea verdadera. La condición se evalúa antes de cada iteración.

```dart
int contador = 5;

while (contador > 0) {
  print('El contador está en: $contador');
  contador--; // Es crucial modificar la condición para evitar un bucle infinito.
}
```

### Bucle `do-while`

Es similar al `while`, pero con una diferencia clave: el bloque de código se ejecuta **al menos una vez**, y la condición se evalúa después de la primera ejecución.

```dart
int numero = 10;

do {
  print('Este mensaje se imprime al menos una vez.');
  numero--;
} while (numero > 10);
```

## Controlando los Bucles: `break` y `continue`

- **`break`**: Termina el bucle inmediatamente, sin importar la condición.
- **`continue`**: Salta la iteración actual y pasa a la siguiente.

```dart
for (int i = 1; i <= 10; i++) {
  if (i % 2 != 0) {
    continue; // Salta los números impares
  }
  if (i > 8) {
    break; // Termina el bucle si el número es mayor que 8
  }
  print('Número par: $i');
}
```
