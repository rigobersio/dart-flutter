import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/home_view.dart';
import 'screens/login_view.dart';

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
