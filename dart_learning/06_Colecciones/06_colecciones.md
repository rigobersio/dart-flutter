# 06: Colecciones en Dart

Las colecciones son objetos que agrupan múltiples elementos en una sola unidad. Dart proporciona tres tipos principales de colecciones: `List`, `Set` y `Map`.

## `List`

Una `List` es una colección ordenada de elementos, indexada por un entero (empezando en 0). Es el equivalente a los arrays en otros lenguajes. Los elementos en una lista pueden estar duplicados.

```dart
// Creación de una lista
List<String> frutas = ['Manzana', 'Banana', 'Cereza'];
var numeros = <int>[1, 2, 3, 4, 5];

// Acceder a un elemento por su índice
String primeraFruta = frutas[0]; // 'Manzana'

// Añadir un elemento
frutas.add('Naranja');

// Longitud de la lista
int cantidad = frutas.length; // 4

// Iterar sobre una lista
for (String fruta in frutas) {
  print(fruta);
}
```

## `Set`

Un `Set` es una colección no ordenada de elementos **únicos**. No permite elementos duplicados. Es útil cuando necesitas asegurarte de que cada elemento en la colección aparezca solo una vez.

```dart
// Creación de un set
Set<String> paises = {'Chile', 'Argentina', 'Perú'};

// Añadir un elemento (si ya existe, no hace nada)
paises.add('Brasil');
paises.add('Chile'); // No tendrá efecto

// Comprobar si un elemento existe
bool contieneChile = paises.contains('Chile'); // true

// Los sets no tienen un orden garantizado
print(paises); // {Chile, Argentina, Perú, Brasil}
```

## `Map`

Un `Map` es una colección de pares clave-valor. Cada clave debe ser única. Los mapas son ideales para almacenar datos que se pueden buscar eficientemente por una clave específica.

```dart
// Creación de un mapa
Map<String, String> capitales = {
  'Chile': 'Santiago',
  'Argentina': 'Buenos Aires',
  'Perú': 'Lima'
};

// Acceder a un valor por su clave
String capitalDeChile = capitales['Chile']; // 'Santiago'

// Añadir o modificar un par clave-valor
capitales['Brasil'] = 'Brasilia';

// Iterar sobre un mapa
capitales.forEach((pais, capital) {
  print('La capital de $pais es $capital');
});
```

## Operadores de Colección

Dart ofrece operadores muy útiles para trabajar con colecciones de forma concisa.

### Operador de Propagación (`...` y `...?`)

Permite insertar todos los elementos de una colección dentro de otra.

```dart
var lista1 = [1, 2, 3];
var lista2 = [4, 5, 6];
var listaCombinada = [...lista1, ...lista2]; // [1, 2, 3, 4, 5, 6]

List<int>? listaNula;
var listaSegura = [...lista1, ...?listaNula]; // El `...?` evita errores si la lista es nula
```

### `collection if` y `collection for`

Permiten construir colecciones de forma declarativa.

```dart
bool agregarAzul = true;
var colores = [
  'Rojo',
  'Verde',
  if (agregarAzul) 'Azul' // Añade 'Azul' solo si la condición es verdadera
];

var numerosPares = [
  for (int i = 1; i <= 10; i++)
    if (i % 2 == 0) i // Añade el número solo si es par
]; // [2, 4, 6, 8, 10]
```
