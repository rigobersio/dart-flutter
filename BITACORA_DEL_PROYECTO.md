# Bitácora del Proyecto: Grandparents App

## Descripción

Una aplicación diseñada para que personas de la tercera edad puedan entretenerse y ejercitar la memoria a través de juegos y actividades interactivas. El proyecto se inicia con un enfoque en la web para luego expandirse a Android, sirviendo como un caso práctico para el aprendizaje de Flutter con un fuerte apoyo de herramientas de IA.

## Metodología de Evolución Pedagógica

Este proyecto no seguirá un desarrollo lineal tradicional. En su lugar, se gestionará a través de versiones incrementales (`v00`, `v01`, `v02`, etc.), donde cada versión representará un hito de aprendizaje concreto. Esto permite:

*   Documentar el progreso de forma clara y ordenada.
*   Aislar conceptos y técnicas en etapas específicas.
*   Facilitar la revisión y el estudio del código en cada fase del aprendizaje.

La versión inicial, `v00`, corresponde a la aplicación base generada por Flutter, sin modificaciones.

## Estructura de un Proyecto Flutter (v00)

Al crear un proyecto con `flutter create`, se genera una estructura de carpetas y archivos estándar. Usando `flutter_grandparents_v00` como ejemplo, estos son los componentes clave:

*   **`lib/`**: Es el corazón de la aplicación. **Todo el código Dart que escribiremos irá aquí.**
    *   `main.dart`: Es el punto de entrada de la aplicación. Cuando la app se inicia, el código de este archivo es el primero en ejecutarse.

*   **`web/`**: Contiene los archivos necesarios para construir la versión web de la aplicación. El más importante es `index.html`, que es la página base donde se cargará la app de Flutter.

*   **`android/`**: Similar a la carpeta `web/`, pero para la plataforma Android. Contiene archivos de configuración de Gradle y el `AndroidManifest.xml`, que son específicos del sistema operativo Android.

*   **`test/`**: Aquí se escriben las pruebas unitarias y de widgets para asegurar que el código funciona como se espera.

*   **`pubspec.yaml`**: **Este es uno de los archivos más importantes.** Define la configuración del proyecto, incluyendo:
    *   El nombre y la descripción de la aplicación.
    *   Las **dependencias** (paquetes o librerías de terceros que el proyecto necesita).
    *   Recursos como imágenes o fuentes personalizadas.

*   **`.gitignore`**: Un archivo estándar de Git que le indica qué archivos y carpetas debe ignorar (por ejemplo, archivos generados automáticamente que no deben ser subidos al repositorio).

*   **`.dart_tool/`**: Una carpeta generada automáticamente por Dart que gestiona las dependencias y otros aspectos internos del proyecto. No se debe modificar manualmente.

*   **`analysis_options.yaml`**: Permite configurar las reglas del analizador de código de Dart. Ayuda a mantener un código limpio y consistente.

### Puntos Clave para un Desarrollador

Un desarrollador que llega a un proyecto Flutter nuevo debe revisar principalmente:

1.  **`pubspec.yaml`**: Para entender qué paquetes y recursos externos utiliza el proyecto.
2.  **`lib/main.dart`**: Para ver cómo se inicia la aplicación y cuál es su estructura principal. Se han traducido los comentarios al español para facilitar la comprensión inicial. Se pueden consultar directamente en el código para más detalles.
3.  **La estructura de carpetas dentro de `lib/`**: A medida que el proyecto crezca, la forma en que se organizan los archivos aquí revelará la arquitectura de la aplicación.

### Siguientes Pasos (Post-v00)

El siguiente paso lógico es levantar el proyecto para verlo en funcionamiento.

**Instrucciones para Ejecutar la Aplicación:**

1.  **Abrir una Terminal:** Navega a la raíz del proyecto `flutter_grandparents_v00`.
2.  **Ejecutar para Web:**
    ```bash
    flutter run -d chrome
    ```
    > **Nota:** Si no tienes Chrome, puedes usar `flutter run -d web-server` y abrir la URL que te proporcione en cualquier navegador, o configurar la variable de entorno `CHROME_EXECUTABLE` para que apunte a tu navegador preferido.

3.  **Ejecutar en un Emulador de Android:**
    *   Asegúrate de tener un emulador creado en Android Studio.
    *   Inicia el emulador.
    *   Ejecuta `flutter run` en la terminal. Flutter lo detectará automáticamente.

## Tecnologías y Herramientas

*   **Lenguaje**: Dart
*   **Framework**: Flutter
*   **Plataformas Iniciales**: Web, Android
*   **Editores de Código (en evaluación)**:
    *   Visual Studio Code
    *   JetBrains Fleet
    *   Trae 2.0
