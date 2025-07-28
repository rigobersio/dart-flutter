// Este archivo fue generado automáticamente por la Interfaz de Línea de Comandos (CLI) de FlutterFire.
// Su propósito principal es centralizar las opciones de configuración de Firebase para tu aplicación Flutter,
// adaptándose a las diferentes plataformas (Web, Android, iOS, etc.) en las que se ejecutará.
//
// ignore_for_file: type=lint
// La directiva 'ignore_for_file: type=lint' es un comentario especial para el analizador de Dart.
// Le indica que ignore ciertas advertencias de linting (reglas de estilo o posibles errores)
// para todo este archivo. Esto es común en archivos generados automáticamente,
// ya que su formato y contenido pueden no adherirse estrictamente a todas las reglas de linting
// que se aplican al código escrito manualmente.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// Importa la clase 'FirebaseOptions' del paquete 'firebase_core'.
// 'FirebaseOptions' es una clase que encapsula todas las configuraciones necesarias
// para inicializar una aplicación Firebase (como la clave API, el ID del proyecto, etc.).
// El 'show FirebaseOptions' es una forma de importar solo esa clase específica
// del paquete, evitando importar todo el contenido si no es necesario.

import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
// Importa utilidades de 'flutter/foundation.dart' que ayudan a determinar
// la plataforma en la que se está ejecutando la aplicación:
// - 'defaultTargetPlatform': Proporciona la plataforma objetivo por defecto (Android, iOS, etc.).
// - 'kIsWeb': Una constante booleana que es 'true' si la aplicación se está ejecutando en la web.
// - 'TargetPlatform': Un enumerado que representa las diferentes plataformas.

/// Clase 'DefaultFirebaseOptions': Contiene las configuraciones de Firebase para cada plataforma.
///
/// Esta clase proporciona una manera conveniente de acceder a las opciones de Firebase
/// específicas para la plataforma actual en tiempo de ejecución.
///
/// Ejemplo de uso para inicializar Firebase en tu archivo 'main.dart':
/// ```dart
/// import 'package:firebase_core/firebase_core.dart';
/// import 'firebase_options.dart'; // Asegúrate de importar este archivo
///
/// void main() async {
///   // Asegura que los widgets de Flutter estén inicializados antes de usar Firebase.
///   WidgetsFlutterBinding.ensureInitialized();
///
///   // Inicializa Firebase con las opciones de la plataforma actual.
///   await Firebase.initializeApp(
///     options: DefaultFirebaseOptions.currentPlatform,
///   );
///
///   runApp(const MyApp());
/// }
/// ```
class DefaultFirebaseOptions { // **OJO ACÁ QUE ESTO SE OCUPA EN MAIN.DART**
  /// Getter 'currentPlatform': Devuelve las opciones de Firebase para la plataforma actual.
  ///
  /// Este método es crucial porque permite que tu código sea agnóstico a la plataforma
  /// al inicializar Firebase. Internamente, detecta si la aplicación es web o nativa,
  /// y luego, para las nativas, qué sistema operativo es (Android, iOS, etc.).
  static FirebaseOptions get currentPlatform {
    // Si la aplicación se está ejecutando en la web, usa las opciones 'web'.
    if (kIsWeb) {
      return web;
    }
    // Si no es web, usa un 'switch' para determinar la plataforma nativa.
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        // Si es Android, devuelve las opciones 'android'.
        return android;
      case TargetPlatform.iOS:
        // Si es iOS, lanza un error. Esto indica que las opciones para iOS
        // no fueron configuradas cuando se ejecutó 'flutterfire configure'.
        // Deberías volver a ejecutar 'flutterfire configure' y seleccionar iOS.
        throw UnsupportedError(
          'DefaultFirebaseOptions no han sido configuradas para iOS - '
          'puedes reconfigurarlo ejecutando la CLI de FlutterFire de nuevo.',
        );
      case TargetPlatform.macOS:
        // Si es macOS, lanza un error similar.
        throw UnsupportedError(
          'DefaultFirebaseOptions no han sido configuradas para macOS - '
          'puedes reconfigurarlo ejecutando la CLI de FlutterFire de nuevo.',
        );
      case TargetPlatform.windows:
        // Si es Windows, lanza un error similar.
        throw UnsupportedError(
          'DefaultFirebaseOptions no han sido configuradas para Windows - '
          'puedes reconfigurarlo ejecutando la CLI de FlutterFire de nuevo.',
        );
      case TargetPlatform.linux:
        // Si es Linux, lanza un error similar.
        throw UnsupportedError(
          'DefaultFirebaseOptions no han sido configuradas para Linux - '
          'puedes reconfigurarlo ejecutando la CLI de FlutterFire de nuevo.',
        );
      default:
        // Para cualquier otra plataforma no soportada explícitamente.
        throw UnsupportedError(
          'DefaultFirebaseOptions no son soportadas para esta plataforma.',
        );
    }
  }

  /// Opciones de Firebase para la plataforma Web.
  ///
  /// **¡ATENCIÓN!** Los valores aquí presentes (como 'apiKey', 'appId') son credenciales
  /// que identifican tu proyecto Firebase. Aunque para la web estas claves son
  /// inherentemente públicas (ya que el navegador las necesita para comunicarse con Firebase),
  /// es CRÍTICO entender que NO deben ser modificadas manualmente ni expuestas
  /// en repositorios públicos sin las precauciones adecuadas (como .gitignore).
  /// Para aplicaciones web, Firebase utiliza reglas de seguridad para proteger tus datos,
  /// no la confidencialidad de estas claves.
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCURrK9feRhW5IVtiZYusXihLHmelnHwqc', // Clave API para la autenticación con servicios de Google.
    appId: '1:769202345694:web:76198e96468538d9f7544f', // ID único de la aplicación web en Firebase.
    messagingSenderId: '769202345694', // ID del remitente para Firebase Cloud Messaging (FCM).
    projectId: 'grandparents-5aa59', // ID de tu proyecto Firebase.
    authDomain: 'grandparents-5aa59.firebaseapp.com', // Dominio para la autenticación de Firebase.
    storageBucket: 'grandparents-5aa59.firebasestorage.app', // Bucket de almacenamiento para Firebase Storage.
  );

  /// Opciones de Firebase para la plataforma Android.
  ///
  /// **¡ATENCIÓN!** Al igual que con las opciones web, estos valores son credenciales.
  /// Para Android, la 'apiKey' y 'appId' son utilizadas por el SDK de Firebase.
  /// Aunque este archivo es generado y se incluye en el código fuente, 
  /// la seguridad en Android se refuerza con el archivo 'google-services.json'
  /// (generado por la CLI y colocado en 'android/app/'), que contiene configuraciones
  /// adicionales y más sensibles que NO deben ser expuestas directamente.
  /// Es CRÍTICO NO comitear este archivo 'firebase_options.dart' si contiene
/// información sensible que no deba ser pública, o asegurarse de que el repositorio
/// sea privado. Para proyectos de código abierto, se deben usar variables de entorno
/// o servicios de gestión de secretos.
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA36eSAWSUMTh3WPnsBT_tOMpPADcktRos', // Clave API para la autenticación con servicios de Google.
    appId: '1:769202345694:android:eb915853fc84a7c8f7544f', // ID único de la aplicación Android en Firebase.
    messagingSenderId: '769202345694', // ID del remitente para Firebase Cloud Messaging (FCM).
    projectId: 'grandparents-5aa59', // ID de tu proyecto Firebase.
    storageBucket: 'grandparents-5aa59.firebasestorage.app', // Bucket de almacenamiento para Firebase Storage.
  );
}

// NOTA IMPORTANTE:
// La generación de este archivo 'firebase_options.dart' por 'flutterfire configure'
// es solo una parte del proceso de configuración de Firebase.
// Para que Firebase funcione correctamente en tu aplicación Flutter, también necesitas:
//
// 1.  **Añadir las dependencias de Firebase en 'pubspec.yaml'**:
//     Por ejemplo, 'firebase_core', 'firebase_auth', 'google_sign_in'.
//     Estos paquetes son los que proporcionan la funcionalidad real de Firebase
//     y deben ser declarados en tu archivo de dependencias.
//
// 2.  **Inicializar Firebase en tu aplicación**:
//     Como se muestra en el ejemplo de 'main.dart' arriba, debes llamar a
//     'Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);'
//     al inicio de tu aplicación para que Firebase se configure y esté listo para usar.
//
// 3.  **Configuraciones nativas adicionales (gestionadas por 'flutterfire configure')**:
//     Para Android, esto incluye el archivo 'google-services.json' en 'android/app/'
//     y las configuraciones en los archivos 'build.gradle'.
//     Para iOS, incluye 'GoogleService-Info.plist' y configuraciones en el 'Podfile'.
//     Estos archivos son cruciales para que los SDK nativos de Firebase funcionen.
//
// En resumen, este archivo 'firebase_options.dart' es el mapa de tu proyecto Firebase,
// pero los paquetes de Firebase son las herramientas y la inicialización es el encendido del motor.