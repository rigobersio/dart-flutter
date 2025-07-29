import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _signInWithGoogle(context),
          child: const Text('Entrar con Google'),
        ),
      ),
    );
  }
}