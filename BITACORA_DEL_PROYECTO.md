# Bitácora del Proyecto: Grandparents App

## Índice

*   [Descripción](#descripción)
*   [Metodología de Evolución Pedagógica](#metodología-de-evolución-pedagógica)
*   [Tecnologías y Herramientas](#tecnologías-y-herramientas)
*   [v0.0 - El Lienzo en Blanco](#v00---el-lienzo-en-blanco)
*   [v0.1 - Conexión a Firebase y Autenticación](#v01---conexión-a-firebase-y-autenticación)
*   [v0.2 - Autenticación por Correo Electrónico sin Contraseña](#v02---autenticación-por-correo-electrónico-sin-contraseña)

---

## Descripción

Registro del desarrollo de una aplicación para que personas de la tercera edad puedan entretenerse y ejercitar la memoria. El proyecto se inicia con un enfoque en la web para luego expandirse a Android, sirviendo como un caso práctico para el aprendizaje de Flutter con un fuerte apoyo de herramientas de IA.

## Metodología de Evolución Pedagógica

Este proyecto no sigue un desarrollo lineal tradicional. Se gestiona a través de versiones incrementales (`v00`, `v01`, etc.), donde cada versión representa un hito de aprendizaje concreto. Esto permite documentar el progreso, aislar conceptos y facilitar la revisión del código en cada fase.

## Tecnologías y Herramientas

*   **Lenguaje**: Dart
*   **Framework**: Flutter
*   **Plataformas Iniciales**: Web, Android
*   **Editores de Código (en evaluación)**:
    *   Visual Studio Code
    *   JetBrains Fleet
    *   Trae 2.0

---

## v0.0 - El Lienzo en Blanco

La versión `v00` corresponde a la aplicación base generada por Flutter, sin modificaciones. Sirve como punto de partida y referencia.

### Estructura de un Proyecto Flutter

Al ejecutar `flutter create`, se genera una estructura de carpetas y archivos estándar. Los componentes clave son:

*   **`lib/`**: El corazón de la aplicación, donde reside todo el código Dart.
    *   `main.dart`: El punto de entrada de la aplicación.
*   **`web/` y `android/`**: Contienen los archivos de configuración específicos para cada plataforma.
*   **`pubspec.yaml`**: Archivo de configuración del proyecto. Define dependencias (paquetes externos) y recursos (imágenes, fuentes).
*   **`analysis_options.yaml`**: Permite configurar reglas del analizador de código para mantener la consistencia.

### Puntos Clave para Revisión

Para entender un proyecto Flutter inicial, se deben revisar principalmente:

1.  **`pubspec.yaml`**: Para entender las dependencias.
2.  **`lib/main.dart`**: Para ver el punto de arranque y la estructura principal. Los comentarios del código en esta versión (`v00`) fueron traducidos y ampliados con fines pedagógicos.

### Ejecución de la Aplicación Base

Para levantar el proyecto, se deben seguir los siguientes pasos:

1.  **Navegar al directorio** del proyecto (`flutter_grandparents_v00`).
2.  **Ejecutar el comando** `flutter run -d chrome` (o el dispositivo deseado).
3.  **ejecuta el comando** `flutter run -d web-server` (para obtener la ip)

---

## v0.1 - Conexión a Firebase y Autenticación

En esta etapa, el objetivo es conectar la aplicación a un servicio de backend. El servicio elegido es **Firebase**, una plataforma de Google que provee, entre otras cosas, sistemas de autenticación y bases de datos.

### Paso 1: Configuración Inicial en la Nube

Lo primero fue preparar el entorno en la nube.

1.  **Creación de la cuenta y el proyecto:** Se accedió a la [página oficial de Firebase](https://firebase.google.com/) y, usando una cuenta de Google, se procedió a la consola. Dentro de la consola, se creó un nuevo proyecto llamado `grandparents`. Durante la configuración, se decidió no habilitar Google Analytics para mantener el setup inicial lo más simple posible.

### Paso 2: Conexión Flutter-Firebase (Próximos Pasos)

La conexión del proyecto local de Flutter con el proyecto recién creado en Firebase se abordó utilizando la **Firebase CLI** (Command Line Interface), una herramienta fundamental para la gestión de proyectos Firebase. La Firebase CLI es una interfaz de línea de comandos que permite a los desarrolladores interactuar con los servicios de Firebase directamente desde su terminal. Es una herramienta versátil que se utiliza para desplegar aplicaciones web, gestionar bases de datos, configurar funciones en la nube, y, en este caso, para integrar proyectos de desarrollo local con los servicios de Firebase en la nube, independientemente del framework o lenguaje de programación utilizado (no es exclusiva de Flutter).

*   **Instalación de la CLI:** Para la instalación de la herramienta, se utilizó el comando `dart pub global activate flutterfire_cli`. Es importante destacar que `flutterfire_cli` es una extensión o un "wrapper" de la Firebase CLI principal, desarrollada específicamente para simplificar y automatizar el proceso de configuración de Firebase en proyectos Flutter. Su propósito es abstraer la complejidad de la configuración manual por plataforma, que de otra manera requeriría pasos específicos para Android, iOS y Web.
    *   **Posible problema de PATH en Windows:** En sistemas operativos Windows, después de activar `flutterfire_cli` globalmente, es común que el sistema no reconozca el comando `flutterfire` directamente en la terminal. Esto se debe a que el directorio donde `dart pub global activate` instala los ejecutables no está automáticamente incluido en la variable de entorno `PATH` del sistema.
        *   **Solución:** Para resolverlo, se debe añadir manualmente la ruta de instalación de los paquetes globales de Dart a la variable `PATH` del sistema. Típicamente, esta ruta es `%USERPROFILE%\AppData\Local\Pub\Cache\bin` (o similar, dependiendo de la configuración de Dart/Flutter). Una vez añadida, es necesario reiniciar la terminal para que los cambios surtan efecto.
*   **Configuración del proyecto:** La configuración del proyecto se realizó ejecutando `flutterfire configure` en la raíz del proyecto `v01`. Este comando se eligió como la opción preferida y más robusta para vincular un proyecto Flutter con Firebase. Al ejecutarlo, `flutterfire configure` realiza varias acciones clave:
    *   **Genera `firebase_options.dart`:** Este archivo Dart contiene todas las credenciales y configuraciones específicas de Firebase para cada plataforma (API keys, IDs de proyecto, etc.). Es crucial porque permite que la aplicación Flutter sepa a qué proyecto de Firebase debe conectarse y cómo.
    *   **Configura archivos nativos:** Modifica o crea archivos de configuración específicos de la plataforma (como `google-services.json` para Android o `GoogleService-Info.plist` para iOS) y ajusta los archivos de construcción (`build.gradle`, `Podfile`) para incluir las dependencias y plugins necesarios de Firebase.
    *   **Automatización y seguridad:** Este proceso automatizado minimiza errores manuales y asegura que las credenciales y configuraciones del proyecto Firebase en la nube se sincronicen correctamente con la aplicación local. Esto es fundamental para la seguridad, ya que evita la exposición accidental de credenciales y garantiza que la comunicación entre la aplicación y Firebase sea autenticada y segura.
    *   **Dependencia de la Firebase CLI oficial:** Durante la ejecución de `flutterfire configure`, se encontró un mensaje de error que indicaba la necesidad de la Firebase CLI oficial. El mensaje exacto fue:
        ```
        Failed to fetch your Firebase projects. Fetch failed with this: FirebaseCommandException: An error occured on the Firebase CLI when attempting to run a command.
        COMMAND: firebase --version
        ERROR: The FlutterFire CLI currently requires the official Firebase CLI to also be installed, see https://firebase.google.com/docs/cli#install_the_firebase_cli for how to install it.
        ```
        Esto significa que, aunque `flutterfire_cli` simplifica la integración con Flutter, actúa como una capa superior que invoca comandos de la Firebase CLI subyacente. Por lo tanto, fue indispensable tener instalada la Firebase CLI principal.
        *   **Solución:** Se procedió a instalar la Firebase CLI oficial. La forma recomendada es a través de `npm` (Node Package Manager) si Node.js está instalado en el sistema, ejecutando `npm install -g firebase-tools`. Alternativamente, se pueden seguir las instrucciones específicas para cada sistema operativo en la documentación oficial de Firebase.
    *   **Proceso de autenticación con `firebase login`:** Tras la instalación de la Firebase CLI oficial, al intentar ejecutar `flutterfire configure` nuevamente, se encontró un nuevo error relacionado con la autenticación. Para resolverlo, se ejecutó `firebase login`.
        *   Se presentó una opción para habilitar las características de Gemini en Firebase, la cual fue aceptada.
        *   Se solicitó permiso para recopilar información de uso y errores de la CLI y Emulator Suite, lo cual también fue aceptado.
        *   La CLI proporcionó una URL para completar el inicio de sesión en el navegador.
        *   Tras completar el proceso en el navegador, la terminal confirmó el éxito de la autenticación, indicando que se había iniciado sesión con la cuenta de desarrollador.

    *   **Re-ejecución de `flutterfire configure` (post-autenticación):** Con la Firebase CLI autenticada, se volvió a ejecutar `flutterfire configure`.
        *   La CLI detectó un proyecto Firebase existente (`grandparents`).
        *   Se solicitó seleccionar el proyecto Firebase para configurar la aplicación Flutter, eligiendo `grandparents`.
        *   Se preguntó qué plataformas debían ser configuradas, seleccionando `android` y `web`.
        *   La CLI informó que las aplicaciones Android y Web (`com.example.flutter_grandparents_v00` y `flutter_grandparents_v00 (web)` respectivamente) no estaban registradas en el proyecto Firebase `grandparents`.
        *   Automáticamente, la CLI procedió a registrar nuevas aplicaciones Android y Web en el proyecto Firebase.
        *   Finalmente, se generó exitosamente el archivo de configuración `lib/firebase_options.dart`, conteniendo los IDs de las aplicaciones Firebase para las plataformas web y android. Este archivo es crucial para la inicialización de Firebase en la aplicación Flutter.
            *   **Para más información:** Este archivo (`lib/firebase_options.dart`) ha sido comentado extensivamente en español para proporcionar una comprensión detallada de su contenido y propósito. Se recomienda consultarlo directamente para una explicación pedagógica de cada sección y la relación con la configuración de Firebase.
    *   **Consideraciones al duplicar el proyecto (`flutter_grandparents_v02`):**
        Al crear una copia del proyecto (`flutter_grandparents_v01` a `flutter_grandparents_v02`), la conexión a Firebase se mantiene en gran medida. Esto se debe a que el archivo `lib/firebase_options.dart` (que contiene las credenciales del proyecto Firebase) y, para Android, el `android/app/google-services.json` se copian junto con el resto del código.
        *   **Conexión de código Dart/Flutter:** El código Dart/Flutter en `flutter_grandparents_v02` podrá inicializar Firebase y conectarse al proyecto `grandparents` en la nube, ya que `firebase_options.dart` proporciona la información necesaria.
        *   **Configuraciones Nativas:** Para Android, si el `applicationId` en `android/app/build.gradle` no se modifica, la aplicación `v02` será reconocida por Firebase como la misma aplicación Android registrada para `v01`. Si el `applicationId` se cambia, Firebase la considerará una aplicación nueva y requerirá un nuevo registro en la consola de Firebase o una re-ejecución de `flutterfire configure` para esa plataforma. Para la web, la configuración se mantiene sin problemas.
        *   **Recomendación:** Aunque la copia directa puede funcionar, la práctica recomendada para un nuevo proyecto o un fork que se desarrollará de forma independiente es ejecutar `flutterfire configure` en el nuevo directorio. Esto asegura que todas las configuraciones nativas estén optimizadas y que Firebase reconozca correctamente la nueva instancia de la aplicación, especialmente si se planean despliegues o monitoreo separados.
    *   **¡ADVERTENCIA CRÍTICA DE SEGURIDAD: GESTIÓN DE CREDENCIALES!**
        Es **CRÍTICO** comprender cómo se manejan las credenciales en un proyecto Firebase. Las claves API y los IDs de aplicación que se encuentran en `firebase_options.dart` (y que son generados automáticamente) son credenciales de **cliente**. Esto significa que están diseñadas para ser públicas, ya que la aplicación cliente las necesita para comunicarse con los servicios de Firebase. El verdadero peligro no radica en la exposición de estas claves de cliente, sino en:
        *   **Malas configuraciones de las Reglas de Seguridad de Firebase:** Si tus reglas de seguridad (para Firestore, Realtime Database, Storage) no están configuradas correctamente, cualquier persona con las claves de cliente podría acceder o manipular tus datos, incluso si las claves no son "secretas". **Esta es la principal línea de defensa de tu backend.**
        *   **Exposición de Credenciales Verdaderamente Sensibles:** Comitear al repositorio credenciales que *sí* deben ser secretas (como claves de API de servicios de terceros, tokens de acceso a bases de datos privadas, etc.) es un **ERROR GRAVE**.
        *   **Riesgos de una mala gestión:**
            *   Uso no autorizado de tus servicios de Firebase (si las reglas son débiles).
            *   Costos inesperados debido al consumo de recursos por parte de terceros malintencionados.
            *   Compromiso de datos de usuarios si las reglas de seguridad son laxas o si se exponen secretos reales.
        *   **Prácticas de Protección de Credenciales:** Para mitigar estos riesgos, se deben seguir las siguientes prácticas:
            *   **`.gitignore`:** Asegurarse de que archivos como `android/app/google-services.json` (para Android) y `ios/Runner/GoogleService-Info.plist` (para iOS) estén SIEMPRE incluidos en el archivo `.gitignore` de tu proyecto.
            *   **Reglas de Seguridad de Firebase:** La principal línea de defensa para tus datos en Firebase son las **Reglas de Seguridad** (Firestore, Realtime Database, Storage). Estas reglas deben ser configuradas cuidadosamente para permitir solo el acceso autorizado a tus datos.
            *   **Variables de Entorno para Secretos No-Firebase:** Para cualquier otra clave API o secreto que no sea de Firebase (por ejemplo, claves de API de terceros), se deben usar variables de entorno y paquetes como `flutter_dotenv` o `flutter_config`. El archivo `.env` que contiene estas variables debe estar SIEMPRE en `.gitignore`.
            *   **Revisión de Commits:** Antes de realizar cualquier `git commit` o `git push`, es fundamental revisar los cambios (`git diff`) para asegurarse de que no se estén incluyendo accidentalmente archivos con credenciales sensibles.

### Paso 3: Inicialización de Firebase en la Aplicación

Con la configuración de la CLI completa y el archivo `firebase_options.dart` generado, el siguiente paso fue modificar el punto de entrada de la aplicación (`lib/main.dart`) para que efectivamente se conectara a Firebase al arrancar.

*   **Respaldo del código original:** Antes de cualquier modificación, se creó una copia del archivo `lib/main.dart` original y se guardó como `lib/main_original.dart` para futuras consultas.
*   **Modificación de `main()`:** La función `main` se modificó para realizar la inicialización de Firebase antes de ejecutar la aplicación.

    *   **Nota pedagógica: El concepto de "Binding" (Enlace).** Se analizó un concepto clave: el "Binding". Se puede pensar en el código Dart/Flutter como un "mundo" y en la plataforma nativa (Android, iOS, o el navegador web) como otro "mundo". El **Binding** es el **puente** o el **enlace** que permite que estos dos mundos se comuniquen. La línea `WidgetsFlutterBinding.ensureInitialized();` es una orden directa a Flutter que dice: "Espera. No dibujes nada todavía. Necesito hablar con la plataforma nativa. Por favor, garantiza que el puente de comunicación (el Binding) esté 100% listo y operativo". Sin esta línea, la llamada a `Firebase.initializeApp()` fallaría.

### Paso 4: Análisis Detallado de la Inicialización

Se detectó que la línea de inicialización de Firebase, aunque corta, encapsulaba varios conceptos fundamentales de Dart que merecían un análisis más profundo.

*   La línea en cuestión es: `await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);`
*   **`Firebase.initializeApp(...)`**: Se identificó a `Firebase` como una **clase** y a `initializeApp` como un **método estático** de esa clase. Análogo a `Promise.resolve()` en JavaScript, es una función de utilidad que se llama directamente sobre la clase para realizar una acción global.
*   **`DefaultFirebaseOptions.currentPlatform`**: Se determinó que `DefaultFirebaseOptions` es una clase proveniente del archivo `firebase_options.dart`. La clave fue entender que `.currentPlatform` no es una simple propiedad, sino un **`getter` estático**. Un *getter* es un método que se invoca como si fuera una propiedad y que ejecuta código para devolver un valor. En este caso, el código del getter detecta la plataforma actual (web, Android, etc.) y devuelve el objeto de configuración correcto.
*   **Nota Pedagógica (Visibilidad en Dart):** Se resolvió la duda de por qué `main.dart` puede usar `DefaultFirebaseOptions` sin una declaración `export` en `firebase_options.dart`. A diferencia de JS/TS, en Dart todo es **público por defecto** dentro de una biblioteca. La simple importación es suficiente para acceder a sus componentes públicos. Para un análisis más detallado, se creó el documento `dart_learning/05_Clases_y_POO/06_caso_de_estudio_interaccion.md`.

### Paso 5: Implementación del Flujo de Autenticación

Una vez configurada la conexión básica con Firebase, el siguiente paso fue implementar un flujo de autenticación completo usando Google Sign-In. Este proceso se dividió en tres grandes bloques conceptuales para facilitar el aprendizaje: la gestión del estado, el diseño de la interfaz y la lógica de interacción.

#### 1. Añadir Dependencias de Firebase a `pubspec.yaml`

Para que la aplicación Flutter pueda interactuar con los servicios de Firebase, fue necesario añadir los paquetes (dependencias) correspondientes al archivo `pubspec.yaml`.

*   **Dependencias necesarias:** `firebase_core`, `firebase_auth`, `google_sign_in`.
*   **Proceso:** Se utilizó el comando `flutter pub add <nombre_paquete>` para cada una, ya que este método automáticamente añade la última versión compatible a `pubspec.yaml` y ejecuta `flutter pub get`.

#### 2. Gestión de Estado y Navegación: El "Guardián de Autenticación"

El primer desafío fue resolver cómo la aplicación debía decidir qué pantalla mostrar. Se optó por un enfoque reactivo.

*   **El Widget `StreamBuilder`:** Se identificó como la herramienta perfecta para este trabajo, ya que se reconstruye a sí mismo cada vez que un `Stream` (flujo de datos) emite un nuevo valor.
*   **El Stream `authStateChanges()`:** El paquete `firebase_auth` proporciona este stream que emite un objeto `User` si el usuario está logueado, o `null` si no lo está.
*   **Implementación del Guardián (`AuthGate`):** Se diseñó un widget (`AuthGate`) cuyo único propósito es contener un `StreamBuilder` que escucha a `authStateChanges()` y devuelve la `HomeView` si hay un usuario o la `LoginView` si no lo hay.
*   **Nota Pedagógica (Reactividad vs. Imperatividad):** Este patrón es el corazón de una aplicación Flutter bien estructurada. En lugar de navegar de forma imperativa (ej. `if (user) { Navigator.push(...) }`), se define de forma declarativa qué se debe mostrar para cada estado posible.

#### 3. Diseño de la Interfaz de Usuario (UI): Las Vistas

Con la lógica de navegación resuelta, el siguiente paso fue diseñar las dos pantallas.

*   **`LoginView` (Vista de Inicio de Sesión):** Una pantalla simple con un `Scaffold` y un `ElevatedButton` con el texto "Iniciar sesión con Google".
*   **`HomeView` (Vista Principal):** Una pantalla con un `Scaffold` y un `AppBar` que muestra un mensaje de bienvenida personalizado y un `IconButton` para cerrar sesión.

#### 4. Lógica de Autenticación: La Acción

Finalmente, se implementó el código que se ejecuta cuando el usuario interactúa con los botones.

*   **Función `_signInWithGoogle()`:** Utiliza el paquete `google_sign_in` para obtener las credenciales del usuario, crea una `OAuthCredential` de Firebase y la usa para `FirebaseAuth.instance.signInWithCredential(credential)`.
*   **Función `_signOut()`:** Llama a `FirebaseAuth.instance.signOut()` y a `GoogleSignIn().signOut()` para asegurar un cierre de sesión completo.
*   **Nota Pedagógica (Manejo de Errores):** Todo el proceso de inicio de sesión se envolvió en un bloque `try-catch` para manejar errores de forma robusta.

### Paso 6: Refactorización a una Arquitectura Limpia

Se observó que, aunque el código era funcional, tener toda la lógica de la interfaz de usuario dentro de `main.dart` no era una práctica escalable. Inspirado en los principios de componentización de React, se decidió refactorizar la estructura de archivos para una mayor claridad y mantenibilidad.

*   **Creación de la Capa de Presentación:** Se creó un nuevo directorio `lib/presentation/` para albergar todo el código relacionado con la interfaz de usuario.
*   **Separación de Widgets:**
    *   El widget `AuthGate` se movió a su propio archivo: `lib/presentation/auth_gate.dart`.
    *   Las vistas (pantallas) se movieron a un subdirectorio `screens/`.
    *   `LoginView` se movió a `lib/presentation/screens/login_view.dart`.
    *   `HomeView` se movió a `lib/presentation/screens/home_view.dart`.
*   **Limpieza de `main.dart`:** Tras la refactorización, el archivo `main.dart` quedó significativamente más limpio y con una única responsabilidad: inicializar los servicios y ejecutar la aplicación, usando el `AuthGate` como punto de entrada.
*   **Nota Pedagógica (Arquitectura):** Esta separación es un primer paso hacia una arquitectura más limpia. A medida que la aplicación crezca, se podrían crear más directorios dentro de `lib/` para la lógica de negocio (`application/`), el acceso a datos (`domain/`, `infrastructure/`), etc. Separar los widgets de la UI en sus propios archivos es la base fundamental para un proyecto Flutter mantenible.

### Problemas Persistentes con Google Sign-In y Decisión de Cambio de Enfoque

Durante la implementación de la autenticación con Google Sign-In en `v0.1`, se encontraron problemas persistentes y recurrentes que impidieron la compilación exitosa de la aplicación web. A pesar de múltiples intentos de depuración, limpieza de caché, reinstalación de dependencias y verificación de configuraciones, los errores relacionados con la resolución del paquete `google_sign_in` y el acceso a sus propiedades (`accessToken`) persistieron.

*   **Síntomas del Problema:** El compilador de Dart no lograba encontrar el constructor `GoogleSignIn` ni acceder a propiedades como `accessToken` de `GoogleSignInAuthentication`, a pesar de que el paquete estaba correctamente listado en `pubspec.yaml` y las importaciones eran correctas en el código Dart.
*   **Acciones Tomadas:** Se realizaron limpiezas profundas de la caché de Flutter (`flutter clean`, eliminación de `pubspec.lock`, `.dart_tool`, `build`), reinstalación de dependencias (`flutter pub get`), y se verificó la inclusión de scripts de Firebase y Google Sign-In en `web/index.html`. Incluso se consolidó todo el código de la UI en `main.dart` para descartar problemas de importación entre archivos.
*   **Conclusión:** Dada la dificultad para resolver estos problemas específicos de la integración de Google Sign-In en el entorno de desarrollo actual, y con el objetivo de avanzar en el aprendizaje de Firebase Authentication, se tomó la decisión de **pausar el desarrollo de la autenticación con Google Sign-In en `v0.1`**.
*   **Estado Actual de `v0.1`:** El proyecto `flutter_grandparents_v01` se mantiene con el código de autenticación de Google Sign-In implementado, pero no funcional en la plataforma web debido a los errores de compilación mencionados. Servirá como referencia de los intentos y desafíos encontrados.

---

## v0.2 - Autenticación por Correo Electrónico sin Contraseña

Para superar los obstáculos encontrados en `v0.1` y continuar con el aprendizaje de Firebase Authentication, se decidió iniciar una nueva versión del proyecto (`v0.2`) con un enfoque de autenticación diferente: **inicio de sesión por correo electrónico sin contraseña (Email Link Sign-In)**. Este método es más simple en términos de configuración de dependencias y scripts de terceros, lo que debería permitir un avance más fluido.

*   **Punto de Partida:** El proyecto `flutter_grandparents_v02` se creará como una copia directa de la versión base `v0.0` (`flutter_grandparents_v00`). Esto asegura un lienzo limpio y funcional para la nueva implementación.
*   **Objetivo:** Implementar un flujo de autenticación donde el usuario introduce su correo electrónico, recibe un enlace mágico por correo y, al hacer clic en él, inicia sesión en la aplicación. Esto permitirá explorar los conceptos de Firebase Authentication sin las complejidades adicionales de la integración con proveedores externos como Google Sign-In.
*   **Pasos Iniciales:**
    1.  Se copió el directorio `flutter_grandparents_v00` a `flutter_grandparents_v02`.
    2.  Se ejecutó `flutterfire configure` en el nuevo proyecto `flutter_grandparents_v02`, vinculándolo exitosamente con el proyecto `grandparents` en Firebase y generando el archivo `lib/firebase_options.dart` para las plataformas Android y Web.
    3.  Habilitar el método de inicio de sesión "Correo electrónico/Contraseña" (específicamente "Enlace de correo electrónico (inicio de sesión sin contraseña)") en la consola de Firebase.
    4.  Se añadió las dependencias necesarias para Firebase Core (`firebase_core`) y Firebase Auth (`firebase_auth`) en `pubspec.yaml` de `v0.2`.
    5.  Se modificó `main.dart` para inicializar Firebase y configurar un `AuthGate` que gestiona la visualización de `LoginView` (para enviar el enlace de inicio de sesión) y `HomeView` (para usuarios autenticados).


