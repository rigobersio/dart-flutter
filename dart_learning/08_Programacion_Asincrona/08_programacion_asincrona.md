# 08: Programación Asíncrona en Dart

Las aplicaciones modernas, especialmente las que se conectan a internet o leen archivos, necesitan realizar operaciones que pueden tardar un tiempo en completarse. Si estas operaciones se realizaran de forma síncrona, la interfaz de usuario de la aplicación se congelaría, creando una mala experiencia para el usuario.

La **programación asíncrona** permite que tu programa inicie una operación de larga duración y continúe con otras tareas sin esperar a que la primera termine. Una vez que la operación finaliza, el programa es notificado y puede manejar el resultado.

Dart gestiona la asincronía a través de dos conceptos clave: `Future` y `Stream`, y la sintaxis `async`/`await`.

## `Future`

Un `Future` representa un valor que estará disponible **en algún momento en el futuro**. Es como una promesa de que recibirás un valor (o un error) más adelante. Piensa en ello como el ticket que te dan en un restaurante: no es la comida, pero es la promesa de que la recibirás cuando esté lista.

Un `Future` puede tener dos estados:
- **Incompleto**: La operación asíncrona aún no ha terminado.
- **Completo**: La operación ha terminado, ya sea con un valor o con un error.

## `async` y `await`

Para trabajar con `Future`s de una manera que se vea y se sienta como código síncrono, Dart proporciona las palabras clave `async` y `await`.

- **`async`**: Se usa para marcar una función como asíncrona. Esto le permite usar la palabra clave `await` dentro de ella y garantiza que la función siempre devolverá un `Future`.

- **`await`**: Se usa para esperar a que un `Future` se complete. Pausa la ejecución **dentro de la función `async`** hasta que el `Future` devuelve un valor, sin bloquear el resto de la aplicación.

### Ejemplo de `async`/`await`

```dart
// Esta función simula una petición a una API que tarda 2 segundos.
Future<String> obtenerDatosDeApi() {
  return Future.delayed(Duration(seconds: 2), () {
    return '¡Datos recibidos de la API!';
  });
}

// Usamos async para poder usar await dentro.
Future<void> main() async {
  print('Iniciando petición a la API...');
  
  // Usamos await para esperar el resultado del Future.
  String resultado = await obtenerDatosDeApi();
  
  // Esta línea solo se ejecuta después de que el Future se completa.
  print(resultado);
  
  print('Programa terminado.');
}
```

## `Stream`

Mientras que un `Future` representa un único valor que llegará en el futuro, un `Stream` es una secuencia de eventos asíncronos. Es como un `Future` que puede devolver múltiples valores a lo largo del tiempo.

Puedes pensar en un `Stream` como una cinta transportadora que entrega eventos (datos o errores) a medida que ocurren. Son útiles para manejar eventos continuos, como la lectura de un archivo grande, datos de WebSockets o eventos de usuario.

Para trabajar con `Stream`s, puedes usar un bucle `await for`.

### Ejemplo de `Stream`

```dart
// Esta función simula un stream que emite un número cada segundo.
Stream<int> contadorStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // 'yield' emite un valor en el stream
  }
}

Future<void> main() async {
  print('Iniciando stream...');
  
  // Usamos await for para escuchar los valores del stream.
  await for (int numero in contadorStream(5)) {
    print('Recibido del stream: $numero');
  }
  
  print('Stream terminado.');
}
```

La programación asíncrona es un pilar en el desarrollo con Flutter para realizar operaciones de red, acceder a bases de datos o leer archivos sin bloquear el hilo de la UI.
