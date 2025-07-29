import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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