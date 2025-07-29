# El Paradigma de Flutter: Todo es un Widget

## Introducción

A diferencia de otras tecnologías donde se separa la estructura (HTML), el estilo (CSS) y la lógica (JS), en Flutter la filosofía es unificar estos conceptos. La idea central es que la interfaz de usuario se construye a partir de una única cosa: **Widgets**.

Un Widget es un "componente" o un bloque de construcción. Es una descripción inmutable de una parte de la interfaz de usuario. Pueden ser visibles (un botón), invisibles (una columna para organizar elementos), o pueden manejar datos (un detector de gestos).

La mejor analogía es pensar en los Widgets como bloques de LEGO. Se componen anidando unos dentro de otros para crear desde un simple botón hasta una pantalla completa.

## Tipos de Widgets

Podemos agrupar los widgets en categorías conceptuales para entenderlos mejor.

### 1. Widgets de UI y Estructura (Lo que se ve)

Son los más parecidos a los componentes visuales de React o a los elementos de HTML.

*   **`Scaffold` (Andamio):** Un esqueleto para una pantalla completa. Proporciona espacios listos para usar como la barra superior, el cuerpo principal, etc.

    ```dart
    Scaffold(
      appBar: AppBar(title: const Text('Mi App')),
      body: const Center(child: Text('Hola Mundo')),
    );
    ```

*   **`Text`:** Muestra una cadena de texto con un estilo opcional.

    ```dart
    const Text(
      'Esto es un texto',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
    ```

*   **`ElevatedButton` (Botón Elevado):** Un botón estándar con fondo y una pequeña sombra.

    ```dart
    ElevatedButton(
      onPressed: () {
        print('Botón presionado!');
      },
      child: const Text('Haz clic aquí'),
    );
    ```

*   **`Icon`:** Muestra un icono de una colección predefinida (Material Icons).

    ```dart
    const Icon(
      Icons.favorite,
      color: Colors.red,
      size: 30.0,
    );
    ```

### 2. Widgets de Maquetación (Layout)

Estos widgets son invisibles. Su único propósito es controlar la posición, el tamaño y la alineación de otros widgets hijos. Son el equivalente a Flexbox o Grid de CSS, pero en forma de Widgets.

*   **`Container`:** Un "contenedor" genérico, similar a un `<div>`. Se puede decorar con colores, bordes, padding, etc.

    ```dart
    Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(10.0),
      color: Colors.blue,
      child: const Text('Dentro de un contenedor'),
    );
    ```

*   **`Column` y `Row` (Columna y Fila):** Los pilares del layout en Flutter. Apilan a sus hijos en vertical (`Column`) u horizontal (`Row`). Son el Flexbox de Flutter.

    ```dart
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround, // Cómo se distribuyen los hijos
      children: const <Widget>[
        Icon(Icons.home),
        Icon(Icons.search),
        Icon(Icons.settings),
      ],
    );
    ```

*   **`Center`:** Centra a su widget hijo en el espacio disponible.

    ```dart
    Center(
      child: const Text('Estoy centrado'),
    );
    ```

*   **`Padding`:** Añade un espacio de relleno alrededor de su widget hijo.

    ```dart
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Text('Tengo espacio alrededor'),
    );
    ```

### 3. Widgets de Lógica y Datos

Estos widgets interactúan con datos o estados y afectan a cómo o cuándo se renderizan otros widgets.

*   **`StreamBuilder`:** Se suscribe a un `Stream` (flujo de datos) y se reconstruye cada vez que llegan nuevos datos. Ideal para el estado de autenticación, notificaciones en tiempo real, etc.

    ```dart
    StreamBuilder<String>(
      stream: miFlujoDeDatos, // Un stream que emite strings
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('Último dato recibido: ${snapshot.data}');
        } else {
          return const CircularProgressIndicator(); // Muestra un spinner mientras espera
        }
      },
    );
    ```

*   **`FutureBuilder`:** Similar al anterior, pero para un `Future` (el equivalente a una `Promise` en JS). Ideal para llamadas a APIs.

    ```dart
    FutureBuilder<String>(
      future: miLlamadaApi(), // Una función que devuelve un Future<String>
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return Text('Dato cargado: ${snapshot.data}');
        }
        return const CircularProgressIndicator();
      },
    );
    ```

## Conclusión

El paradigma de "todo es un widget" te anima a pensar en la construcción de interfaces como un proceso de composición. Creas widgets pequeños y muy específicos (un botón, un texto con un estilo particular) y luego los unes usando widgets de maquetación para formar componentes más complejos, que a su vez se unen para formar pantallas completas. Esta filosofía promueve un código altamente reutilizable y fácil de leer.
