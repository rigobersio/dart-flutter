// Importaciones necesarias para Flutter, Firebase y Google Sign-In.
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart'; // Importa las credenciales de Firebase generadas.

// Punto de entrada de la aplicación.
void main() async {
  // 1. Asegura que el "puente" de comunicación con la plataforma nativa esté listo.
  // Es obligatorio para poder llamar a Firebase.initializeApp().
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Inicializa Firebase usando las credenciales del archivo firebase_options.dart.
  // 'await' pausa la ejecución hasta que Firebase esté listo.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 3. Dibuja el widget raíz de la aplicación en la pantalla.
  runApp(const MyApp());
}

// El widget raíz de la aplicación. Es un "StatelessWidget", análogo a un
// componente funcional de React sin estado.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp es un widget que envuelve toda la aplicación, dándole
    // funcionalidades básicas de Material Design, como el tema y la navegación.
    return MaterialApp(
      title: 'Grandparents App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // El 'home' de nuestra aplicación ahora es nuestro "guardián de autenticación".
      home: const AuthGate(),
    );
  }
}

// AuthGate (Puerta de Autenticación): Este widget actúa como un "portero".
// Su único trabajo es verificar el estado de autenticación del usuario y mostrar
// la pantalla de Login o la pantalla de Home según corresponda.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // StreamBuilder: Un widget que se reconstruye a sí mismo cada vez que recibe
    // nuevos datos de un "Stream" (un flujo de datos asíncrono).
    return StreamBuilder<User?>(
      // Estamos "escuchando" los cambios en el estado de autenticación de Firebase.
      // authStateChanges() emite un objeto 'User' si el usuario está logueado, o 'null' si no.
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Mientras espera la primera información, muestra una pantalla de carga.
        // CircularProgressIndicator: El típico círculo que da vueltas.
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Si el snapshot tiene datos (el objeto User no es null), el usuario está autenticado.
        if (snapshot.hasData) {
          // Lo enviamos a la pantalla principal (Home).
          return HomeView(user: snapshot.data!);
        }

        // Si no tiene datos, el usuario no está autenticado.
        return const LoginView();
      },
    );
  }
}

// LoginView: La pantalla que se muestra cuando el usuario NO está autenticado.
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  // Función para manejar el proceso de inicio de sesión con Google.
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) { return; } // El usuario canceló
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // En una app real, aquí se mostraría un mensaje de error al usuario.
      // Por ejemplo, usando un SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error durante el inicio de sesión: $e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold (Andamio): Proporciona la estructura básica de una pantalla
    // (barra superior, cuerpo, etc.).
    return Scaffold(
      // AppBar (Barra de Aplicación): La barra superior.
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      // Center (Centrador): Un widget que centra a su hijo.
      body: Center(
        // ElevatedButton (Botón Elevado): Un botón estándar con sombra.
        child: ElevatedButton(
          onPressed: () => _signInWithGoogle(context),
          child: const Text('Entrar con Google'),
        ),
      ),
    );
  }
}

// HomeView: La pantalla principal que se muestra cuando el usuario SÍ está autenticado.
class HomeView extends StatelessWidget {
  // Recibe el objeto User para poder mostrar su información.
  final User user;
  const HomeView({super.key, required this.user});

  // Función para cerrar la sesión.
  Future<void> _signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal'),
        actions: [
          // IconButton (Botón de Icono): Un botón que solo muestra un icono.
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _signOut,
            tooltip: 'Cerrar sesión',
          )
        ],
      ),
      body: Center(
        // Column (Columna): Apila a sus hijos widgets en vertical.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¡Bienvenido!'),
            const SizedBox(height: 8),
            Text(
              user.displayName ?? 'Usuario sin nombre',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(user.email ?? ''),
          ],
        ),
      ),
    );
  }
}