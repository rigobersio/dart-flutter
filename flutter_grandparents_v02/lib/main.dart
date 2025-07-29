// Importaciones necesarias para Flutter y Firebase.
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart'; // Importa las credenciales de Firebase generadas.

// Punto de entrada de la aplicación.
void main() async {
  // Asegura que el "puente" de comunicación con la plataforma nativa esté listo.
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

// El widget raíz de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grandparents App v0.2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}

// AuthGate (Puerta de Autenticación): Verifica el estado del usuario.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          return HomeView(user: snapshot.data!);
        }

        return const LoginView();
      },
    );
  }
}

// LoginView: Pantalla de inicio de sesión para Email Link.
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendSignInLinkToEmail() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.sendSignInLinkToEmail(
        email: _emailController.text,
        actionCodeSettings: ActionCodeSettings(
          url: 'https://grandparents.page.link', // URL de tu dominio personalizado de Firebase
          handleCodeInApp: true,
          androidInstallApp: true,
          androidMinimumVersion: '12',
          iOSBundleId: 'com.example.flutterGrandparentsV02',
          androidPackageName: 'com.example.flutter_grandparents_v02',
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enlace de inicio de sesión enviado a tu correo.'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al enviar el enlace: $e'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión (Email Link)'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _sendSignInLinkToEmail,
                      child: const Text('Enviar enlace de inicio de sesión'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// HomeView: Pantalla principal para usuarios autenticados.
class HomeView extends StatelessWidget {
  final User user;
  const HomeView({super.key, required this.user});

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal (v0.2)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _signOut,
            tooltip: 'Cerrar sesión',
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¡Bienvenido!'),
            const SizedBox(height: 8),
            Text(
              user.email ?? 'No se pudo obtener el email',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text('ID de Usuario: ${user.uid}'),
          ],
        ),
      ),
    );
  }
}