/// En Flutter, casi todo es un Widget. Un Widget es como un "bloque de construcción" para la interfaz de usuario.
/// Puede ser algo visible como un botón o un texto, o algo invisible que ayuda a organizar otros widgets, como una fila o una columna.
/// La importación de 'material.dart' nos da acceso a un enorme catálogo de Widgets pre-diseñados que siguen las guías de diseño de Material Design de Google.
import 'package:flutter/material.dart';

/// La función `main()` es el punto de entrada de toda la aplicación, al igual que en muchos otros lenguajes de programación.
/// Flutter comienza a ejecutar el código desde aquí.
void main() {
  // `runApp()` es la función que toma el Widget raíz de nuestra aplicación y lo "infla", es decir, lo dibuja en la pantalla.
  // Aquí, le estamos diciendo a Flutter que el widget principal de nuestra app es una instancia de la clase `MyApp`.
  runApp(const MyApp());
}

/// `MyApp` es el widget raíz de nuestra aplicación.
/// Extiende de `StatelessWidget`, lo que significa que es un widget que no tiene un "estado" interno que pueda cambiar con el tiempo.
/// Su apariencia y configuración son inmutables y se definen por la información que recibe cuando se crea.
/// Piensa en él como una "plantilla" estática.
class MyApp extends StatelessWidget {
  // El `const` aquí indica que este constructor puede ser evaluado en tiempo de compilación, lo que es una optimización de rendimiento.
  // `{super.key}` es una forma moderna de pasar la clave (key) al constructor de la clase padre (`StatelessWidget`).
  // Las claves (keys) son identificadores que Flutter usa internamente para diferenciar y gestionar los widgets.
  const MyApp({super.key});

  // La anotación `@override` le dice al compilador de Dart que estamos sobrescribiendo intencionadamente un método que ya existe en la clase padre (`StatelessWidget`).
  // En este caso, estamos proporcionando nuestra propia implementación del método `build`.
  @override
  // El método `build` es el más importante en cualquier widget. Describe cómo se debe dibujar el widget en la pantalla.
  // Flutter llama a este método cada vez que necesita renderizar el widget.
  // Recibe un `BuildContext` como argumento, que contiene información sobre la ubicación del widget en el árbol de widgets.
  Widget build(BuildContext context) {
    // `MaterialApp` es un widget fundamental que proporciona muchas de las funcionalidades básicas que una aplicación necesita.
    // Envuelve toda la aplicación y configura cosas como el enrutamiento (navegación entre pantallas), el tema visual y más.
    return MaterialApp(
      // El título de la aplicación, que se usa en el administrador de tareas del sistema operativo.
      title: 'Flutter Demo',
      // La propiedad `theme` nos permite definir el estilo visual de la aplicación.
      // `ThemeData` es una clase que contiene toda la información de estilo: colores, fuentes, formas de botones, etc.
      theme: ThemeData(
        // `colorScheme` es la forma moderna de definir la paleta de colores de la aplicación.
        // `ColorScheme.fromSeed()` crea un esquema de colores completo y armonioso a partir de un único color "semilla".
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // La propiedad `home` especifica el widget que se mostrará como la pantalla principal o "página de inicio" de la aplicación.
      home: const MyHomePage(title: 'Página de Inicio de Flutter Demo'),
    );
  }
}

/// `MyHomePage` es nuestro widget de la página de inicio.
/// A diferencia de `MyApp`, este extiende de `StatefulWidget`. Esto significa que es un widget dinámico.
/// Tiene un "estado" interno que PUEDE cambiar durante la vida del widget, y cuando ese estado cambia, el widget se redibuja para reflejar los cambios.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Los campos en una clase de widget siempre se marcan como `final` porque la configuración del widget en sí es inmutable.
  // El "estado" que cambia se gestiona en una clase separada.
  final String title;

  // Un `StatefulWidget` no tiene un método `build` directamente. En su lugar, tiene un método `createState()`.
  // Este método debe devolver una instancia de una clase que extienda de `State`.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// `_MyHomePageState` es la clase que contiene el "estado" para el widget `MyHomePage`.
/// El guion bajo `_` al principio del nombre la convierte en una clase privada, solo accesible dentro de este archivo.
/// Aquí es donde vive la lógica y los datos que pueden cambiar.
class _MyHomePageState extends State<MyHomePage> {
  // Esta es una variable de estado. Su valor puede cambiar.
  int _counter = 0;

  // Este es un método que modifica el estado.
  void _incrementCounter() {
    // `setState()` es una función crucial. Le notifica a Flutter que el estado de este widget ha cambiado.
    // Al llamar a `setState()`, Flutter marca este widget como "sucio" y programa una nueva llamada a su método `build()` para que la interfaz de usuario se actualice con el nuevo valor de `_counter`.
    // Si simplemente hiciéramos `_counter++` sin `setState()`, el valor cambiaría, pero la pantalla no se redibujaría y no veríamos ningún cambio.
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // `Scaffold` es otro widget fundamental de Material Design. Proporciona una estructura visual estándar para las pantallas.
    // Incluye espacios para una barra de aplicación (AppBar), un cuerpo principal (body), un botón de acción flotante, etc.
    return Scaffold(
      // `appBar` es la barra de título que aparece en la parte superior de la pantalla.
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Aquí usamos `widget.title` para acceder a la propiedad `title` de la clase `MyHomePage` (el StatefulWidget).
        title: Text(widget.title),
      ),
      // `body` es el contenido principal de la pantalla, debajo de la AppBar.
      body: Center(
        // `Center` es un widget de diseño que centra a su hijo (child) tanto horizontal como verticalmente.
        child: Column(
          // `Column` es un widget de diseño que organiza a sus hijos (children) en una columna vertical.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Has presionado el botón tantas veces:',
            ),
            Text(
              '$_counter', // Muestra el valor actual de la variable de estado `_counter`.
              style: Theme.of(context).textTheme.headlineMedium, // Aplica un estilo de texto predefinido del tema.
            ),
          ],
        ),
      ),
      // `floatingActionButton` es el botón circular que "flota" sobre el contenido.
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Cuando se presiona, llama a nuestro método que cambia el estado.
        tooltip: 'Incrementar', // Texto que aparece si se deja el cursor sobre el botón.
        child: const Icon(Icons.add), // El icono que se muestra dentro del botón.
      ),
    );
  }
}
