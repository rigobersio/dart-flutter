# 04: Funciones en Dart

Las funciones son bloques de código reutilizables que realizan una tarea específica. En Dart, las funciones son objetos de primera clase, lo que significa que pueden ser asignadas a variables, pasadas como argumentos a otras funciones y retornadas por otras funciones.

## Anatomía de una Función

Una función se define con un tipo de retorno, un nombre, una lista de parámetros y un cuerpo.

```dart
// tipoDeRetorno nombreDeLaFuncion(tipoParam1 param1, tipoParam2 param2) {
//   cuerpo de la función
//   return valor; // Opcional, dependiendo del tipo de retorno
// }

// Ejemplo:
int sumar(int a, int b) {
  return a + b;
}
```

- Si una función no retorna ningún valor, se usa el tipo de retorno `void`.
- Si el cuerpo de la función contiene una sola expresión, se puede usar la sintaxis de flecha (`=>`), también conocida como *fat arrow*.

```dart
void saludar(String nombre) => print('Hola, $nombre');

int multiplicar(int a, int b) => a * b;
```

## Parámetros

Dart ofrece un sistema de parámetros muy flexible.

### Parámetros Posicionales Requeridos

Son los parámetros estándar. El orden en que se pasan los argumentos al llamar a la función es importante.

```dart
void describirPersona(String nombre, int edad) {
  print('$nombre tiene $edad años.');
}

// Se llama así:
describirPersona('Carlos', 40);
```

### Parámetros con Nombre (Opcionales por defecto)

Se definen entre llaves `{}`. Hacen el código más legible, ya que el nombre del parámetro debe ser usado al llamar a la función. Son opcionales por defecto y su valor será `null` si no se proporcionan.

```dart
void configurarWidget({String? color, double? ancho}) {
  print('Color: $color, Ancho: $ancho');
}

// Se llama así:
configurarWidget(color: 'Rojo');
configurarWidget(ancho: 150.0, color: 'Azul');
```

### Parámetros con Nombre Requeridos

Si un parámetro con nombre debe ser obligatorio, se usa la palabra clave `required`.

```dart
void registrarUsuario({required String email, required String password}) {
  // ...
}

// Esto es válido:
registrarUsuario(email: 'test@test.com', password: '123456');

// Esto es un error en tiempo de compilación:
// registrarUsuario(email: 'test@test.com');
```

### Parámetros Posicionales Opcionales

Se definen entre corchetes `[]`. Son menos comunes que los parámetros con nombre, pero útiles en ciertos casos.

```dart
void hacerPedido(String platoPrincipal, [String? bebida, String? postre]) {
  print('Plato: $platoPrincipal, Bebida: $bebida, Postre: $postre');
}

// Se llama así:
hacerPedido('Pizza');
hacerPedido('Pizza', 'Refresco');
hacerPedido('Pizza', 'Refresco', 'Helado');
```

### Valores por Defecto

Tanto los parámetros con nombre como los posicionales opcionales pueden tener un valor por defecto, que se usa si no se proporciona uno.

```dart
void crearBoton({String texto = 'Click aquí', String color = 'Azul'}) {
  print('Botón creado con texto \'$texto\' y color \'$color\'.');
}

// Se llama así:
crearBoton(); // Usa los valores por defecto
crearBoton(texto: 'Enviar');
```

## Funciones Anónimas (Lambdas)

Son funciones sin nombre. A menudo se usan como argumentos para otras funciones. Son extremadamente comunes en Flutter, por ejemplo, en los callbacks de los botones.

```dart
List<String> nombres = ['Ana', 'Juan', 'Pedro'];

nombres.forEach((nombre) {
  print('Hola, $nombre');
});

// Ejemplo en un botón (conceptual)
// boton.onPressed = () {
//   print('Botón presionado!');
// };
```