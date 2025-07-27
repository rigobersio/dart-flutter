# Aprendiendo Dart y Flutter: Un Repositorio de Desarrollo

## Introducción: ¿Qué son Dart y Flutter?

Este repositorio documenta un proceso de aprendizaje práctico de **Dart** y **Flutter**, dos tecnologías de Google diseñadas para construir aplicaciones de alta calidad para múltiples plataformas desde una única base de código.

### Dart: El Lenguaje

**Dart** es un lenguaje de programación de código abierto optimizado para el desarrollo de interfaces de usuario (UI). Sus características clave incluyen:

*   **Multiplataforma**: El código Dart puede compilarse a código nativo ARM/x64 para aplicaciones móviles y de escritorio, o a JavaScript para la web. Esto permite un alcance masivo con un solo lenguaje.
*   **Productividad del Desarrollador**: Ofrece características modernas como *hot reload*, que permite ver los cambios en el código casi instantáneamente sin reiniciar la aplicación. Su sintaxis es clara y concisa, resultando familiar para quienes vienen de lenguajes como Java, C# o JavaScript.
*   **Seguridad de Tipos (Type Safety)**: Dart es un lenguaje fuertemente tipado. Esto significa que las variables tienen tipos definidos que se verifican en tiempo de compilación, lo que ayuda a detectar errores de forma temprana y a mantener el código robusto y mantenible.
*   **Rendimiento**: Se compila "just-in-time" (JIT) durante el desarrollo para permitir el *hot reload* y se compila "ahead-of-time" (AOT) para producción, lo que garantiza un inicio rápido y un rendimiento predecible y fluido.

### Flutter: El Framework de UI

**Flutter** es un kit de herramientas de UI (interfaz de usuario) que utiliza Dart como lenguaje. No es un lenguaje en sí mismo, sino un framework completo para construir aplicaciones. Su principal ventaja es que permite crear interfaces nativas y compiladas para:

*   **Móvil** (iOS y Android)
*   **Web** (JavaScript)
*   **Escritorio** (Windows, macOS y Linux)

La gran pregunta: **¿Es Flutter adecuado para el desarrollo web?**

**Sí**. Aunque Flutter nació con un enfoque en el desarrollo móvil, su soporte para la web ha madurado significativamente y es una opción viable y potente. Flutter renderiza cada píxel en la pantalla, lo que garantiza que la interfaz de usuario se vea y se comporte de manera idéntica en todos los navegadores y plataformas. Esto lo hace ideal para aplicaciones web altamente interactivas, PWAs (Progressive Web Apps) y para portar aplicaciones móviles existentes a la web con un esfuerzo mínimo.

### El Propósito de Este Repositorio

Este no es un tutorial convencional. Es el diario de trabajo de un desarrollador que, sin experiencia previa en estas tecnologías, se embarca en un proceso de aprendizaje intensivo. La meta es adquirir las habilidades necesarias para actualizar y mantener una aplicación comercial.

El enfoque principal será el aprendizaje de **Dart** y **Flutter** para el **desarrollo de aplicaciones web**. En una segunda fase, se abordará el desarrollo **móvil para Android**. El contenido reflejará los desafíos, soluciones y descubrimientos de este viaje, convirtiéndose en un recurso práctico y en constante evolución.

## Conceptos Fundamentales: Las Cajas de Herramientas

Antes de instalar, es crucial entender las herramientas que se van a utilizar.

### ¿Qué es un SDK (Software Development Kit)?

Un **SDK** o "Kit de Desarrollo de Software" es una colección de herramientas que los desarrolladores utilizan para crear aplicaciones para una plataforma específica. Para un programador de Flutter, el SDK contiene:

*   **Compiladores**: Programas que traducen el código fuente (escrito en Dart) a un lenguaje que los dispositivos pueden ejecutar.
*   **Bibliotecas (Libraries)**: Conjuntos de código preescrito que ofrecen funcionalidades listas para usar.
*   **Herramientas de Depuración (Debugger)**: Utilidades que ayudan a encontrar y corregir errores en el código.

### SDK de Dart vs. SDK de Flutter

Es importante destacar que **el SDK de Flutter ya incluye el SDK de Dart en su interior**, además de todo lo necesario para la creación de interfaces de usuario: el motor gráfico, los widgets, y las herramientas para compilar y desplegar la aplicación en múltiples plataformas.

> **Conclusión Pedagógica**: Al instalar el **SDK de Flutter**, se obtiene automáticamente todo lo necesario. No se requiere una instalación separada del SDK de Dart.

## Configuración del Entorno de Desarrollo

A continuación, se detalla el proceso de instalación y configuración del entorno en diferentes sistemas operativos.

### Paso 1: Obtener el SDK de Flutter

La forma recomendada de obtener el SDK es clonando el repositorio oficial con Git, ya que facilita enormemente las futuras actualizaciones.

```bash
# Clona el repositorio de Flutter en su versión "stable" (la más probada)
git clone https://github.com/flutter/flutter.git -b stable
```

Al tener el repositorio localmente, actualizar Flutter a una nueva versión es tan simple como ejecutar el comando `flutter upgrade`.

Como alternativa, especialmente en Windows, se puede descargar el archivo ZIP directamente desde la [página oficial de descargas de Flutter](https://flutter.dev/docs/get-started/install/windows).

### Paso 2: Configurar la Variable de Entorno `PATH`

Este paso es fundamental para poder ejecutar los comandos de Flutter desde cualquier ubicación en la terminal.

#### En Windows

1.  Cree una carpeta en la raíz del disco, por ejemplo: `C:lutter`.
2.  Extraiga el contenido del SDK (ya sea del ZIP descargado o de la carpeta clonada con Git) dentro de `C:lutter`.
3.  En el menú de inicio, busque "Editar las variables de entorno del sistema" y ábralo.
4.  Haga clic en "Variables de entorno...".
5.  En la sección "Variables de usuario", seleccione la variable `Path` y haga clic en "Editar...".
6.  Haga clic en "Nuevo" y añada la ruta a la carpeta `bin` de Flutter: `C:lutterin`.
7.  Haga clic en "Aceptar" en todas las ventanas para guardar los cambios.

#### En Linux

1.  Determine qué intérprete de comandos (shell) está utilizando:
    ```bash
    echo $SHELL
    ```
2.  Abra el archivo de configuración correspondiente con un editor de texto como `nano`:
    *   Si usa Bash (`/bin/bash`), el archivo es `~/.bashrc`: `nano ~/.bashrc`
    *   Si usa Zsh (`/bin/zsh`), el archivo es `~/.zshrc`: `nano ~/.zshrc`
3.  Agregue la siguiente línea al **final** del archivo, reemplazando `/ruta/absoluta/a/flutter` con la ruta real donde clonó o descomprimió el SDK:
    ```bash
    export PATH="$PATH:/ruta/absoluta/a/flutter/bin"
    ```
4.  Guarde los cambios (`Ctrl+O`, `Enter`) y salga del editor (`Ctrl+X`).
5.  Aplique los cambios en la sesión actual de la terminal:
    *   Si usa Bash: `source ~/.bashrc`
    *   Si usa Zsh: `source ~/.zshrc`

> **Solución de Problemas en Linux**: Si el comando `flutter` sigue sin encontrarse, puede crear un enlace simbólico. Esto requiere permisos de administrador.
> ```bash
> # Reemplace /ruta/absoluta/a/flutter con la ruta real
> sudo ln -s /ruta/absoluta/a/flutter/bin/flutter /usr/local/bin/flutter
> ```

### Paso 3: Instalar y Configurar Android Studio

Aunque el objetivo principal sea el desarrollo web, la instalación de **Android Studio** es un paso muy recomendable, especialmente para la futura fase de desarrollo móvil. No se usará necesariamente para escribir código, sino como un **gestor de las herramientas de Android (SDK, emuladores, etc.)**.

**1. Descargar e Instalar Android Studio**

*   Obtenga el instalador adecuado para su sistema operativo desde el [sitio web oficial de Android Studio](https://developer.android.com/studio).
*   **En Windows**: Ejecute el instalador `.exe` y siga los pasos iniciales.
*   **En Linux**: Se recomienda realizar la instalación manual (descargando el `.tar.gz`) para evitar problemas de permisos. Una vez descomprimido, ejecute el script `studio.sh` desde la carpeta `bin`.

**2. Asistente de Configuración Inicial (Primera Ejecución)**

Al ejecutar Android Studio por primera vez (en cualquier sistema operativo), se iniciará un asistente de configuración. Este paso es crucial.

*   En la pantalla de bienvenida, seleccione siempre la opción **"Custom"** (Personalizada) en lugar de "Standard" para tener control sobre la instalación.
*   **Selección de Componentes**: A continuación, llegará a la pantalla "SDK Components Setup". Las opciones aquí pueden variar ligeramente entre Windows y Linux.
    *   **En Linux**: Verá una lista más detallada. Asegúrese de que las siguientes casillas estén **marcadas**:
        *   `Android SDK`
        *   `Android SDK Command-line Tools`
        *   `Android Virtual Device (AVD)`
    *   **En Windows**: La vista es más simplificada. `Android SDK` ya estará seleccionado. Asegúrese de marcar adicionalmente:
        *   `Android Virtual Device`
        *   `Performance (Android Emulator hypervisor driver)` (recomendado)
*   **Aceptación de Licencias**: Antes de finalizar, el asistente le presentará una pantalla para aceptar los términos y condiciones de varias licencias de componentes (como `android-sdk-license`, `Android Emulator`, etc.). Asegúrese de aceptar todas las licencias requeridas para continuar.
*   Finalmente, haga clic en "Finish" para que el asistente descargue e instale todos los componentes seleccionados.

**3. Configurar la Ruta del SDK de Android para Flutter**

Este es un paso fundamental. Aunque Android Studio esté instalado, Flutter necesita saber exactamente dónde se encuentra el SDK de Android. Si al ejecutar `flutter doctor --android-licenses` aparece el error `Unable to locate Android SDK`, siga estos pasos:

1.  Abra Android Studio.
2.  Vaya al menú **Tools > SDK Manager**.
3.  En la parte superior de la ventana, copie la ruta que aparece en **"Android SDK Location"**. (Ej: `C:\Users\SuUsuario\AppData\Local\Android\Sdk`).
4.  Abra una nueva terminal (PowerShell o CMD en Windows, Bash/Zsh en Linux) y ejecute el siguiente comando, reemplazando `"ruta\completa\al\sdk"` con la ruta que copió:
    ```bash
    flutter config --android-sdk "ruta\completa\al\sdk"
    ```
5.  Vuelva a ejecutar `flutter doctor`. El error del Android toolchain debería haber desaparecido.

**4. Verificación de Licencias (Paso Final)**

Aunque las licencias principales se aceptan en el asistente de Android Studio, es una buena práctica verificar que todo esté correctamente configurado para Flutter. En una terminal, ejecute:

```bash
flutter doctor --android-licenses
```

Si todas las licencias ya fueron aceptadas, lo confirmará. Si quedara alguna pendiente, le permitirá aceptarla aquí. 

### Paso 4: Verificación Final

`flutter doctor` es una herramienta de diagnóstico esencial. Al ejecutarla, analizará la configuración y mostrará un informe detallado de lo que está bien y lo que falta.

```bash
flutter doctor
```

Siga sus instrucciones para resolver cualquier problema pendiente. Cuando todas las secciones principales muestren un tic verde (`✓`), el entorno estará listo.

## Bitácora de Resolución de Problemas (Finalizada para Android)

Esta sección documenta los problemas encontrados durante la configuración real del entorno y sus soluciones, mostrando el estado de `flutter doctor` antes y después de cada corrección. La versión de Android Studio utilizada es **Build #AI-251.25410.109.2511.13752376 (2025.1.1)**, lanzada el 8 de Julio de 2025.

### 1. `cmdline-tools component is missing`

**Síntoma:**

Después de instalar Android Studio y configurar la ruta del SDK, `flutter doctor` arrojaba el error `cmdline-tools component is missing`.

**Solución:**

Se instaló el componente **"Android SDK Command-line Tools (latest)"** manualmente desde el SDK Manager de Android Studio (`File > Settings... > Languages & Frameworks > Android SDK > SDK Tools`).

**Resultado (Post-Solución):**

El error de `cmdline-tools` desapareció, dejando únicamente la advertencia sobre las licencias:

```text
[!] Android toolchain - develop for Android devices (Android SDK version 36.0.0)
    ! Some Android licenses not accepted. To resolve this, run: flutter doctor --android-licenses
```

### 2. `Some Android licenses not accepted`

**Síntoma:**

El siguiente paso, como lo indicaba el propio `flutter doctor`, era resolver el tema de las licencias.

**Solución:**

Se ejecutó el comando `flutter doctor --android-licenses` y se aceptaron todas las licencias propuestas.

**Resultado Final (Android Toolchain ✓):**

Tras aceptar las licencias, la sección `Android toolchain` finalmente aparece con el tic de verificación verde, indicando que la configuración para el desarrollo de Android está completa y es correcta.

```text
[✓] Flutter (Channel stable, 3.32.7, on Microsoft Windows [Versi¢n 10.0.22631.5549], locale es-CL)
[✓] Windows Version (11 Pro 64 bits, 23H2, 2009)
[✓] Android toolchain - develop for Android devices (Android SDK version 36.0.0)
[✗] Chrome - develop for the web (Cannot find Chrome executable at .\Google\Chrome\Application\chrome.exe)
    ! Cannot find Chrome. Try setting CHROME_EXECUTABLE to a Chrome executable.
[✗] Visual Studio - develop Windows apps
    (...)
[✓] Android Studio (version 2025.1.1)
[✓] VS Code (version 1.102.2)
[✓] Connected device (2 available)
[✓] Network resources

! Doctor found issues in 2 categories.
```

## Siguientes Pasos: Enfocándonos en el Desarrollo Web

¡Excelente! La configuración para el desarrollo de Android (`Android toolchain`) está completa. Ahora podemos enfocarnos en nuestro objetivo principal: **el desarrollo de aplicaciones web con Dart y Flutter**.

El diagnóstico de `flutter doctor` nos indica una advertencia sobre Chrome:

`[✗] Chrome - develop for the web (Cannot find Chrome executable ...)`

**Decisión sobre el Navegador:**

Aunque Flutter busca Google Chrome por defecto, no es un requisito indispensable. Se puede utilizar cualquier navegador moderno basado en Chromium (como Brave, Opera o Ecosia). Para que Flutter utilice un navegador alternativo, simplemente se debe configurar la variable de entorno `CHROME_EXECUTABLE` para que apunte a la ruta del ejecutable de dicho navegador.

Por decisión del proyecto, **no se instalará Google Chrome** y se utilizarán los navegadores existentes para mantener el entorno de desarrollo limpio. El error de `Visual Studio` puede ser ignorado, ya que es un requisito para compilar aplicaciones de escritorio para Windows, lo cual no es el foco actual.

## Herramientas de Desarrollo

### Editor de Código

Se recomienda **Visual Studio Code (VS Code)** por su ligereza, rapidez y su potente ecosistema de extensiones. La extensión oficial de **Flutter** (publicada por `Dart Code`) es indispensable.

Como alternativa, se estarán probando los siguientes editores:
* **JetBrains Fleet**: Un editor de nueva generación que también ofrece un excelente soporte para Dart y Flutter.
* **Trae 2.0**: (Se agregará más información sobre esta herramienta a medida que se explore).

### Experiencia con Editores

*   **JetBrains Fleet (Evaluación Inicial):**
    *   **Positivo:** La previsualización de archivos `.md` es excelente.
    *   **Negativo:** El consumo de memoria RAM es considerable. Para un proyecto en esta etapa inicial, no se perciben ventajas significativas que justifiquen el uso de recursos. La integración con IA es una característica de pago.
    *   **Conclusión Parcial:** Se siente como un editor de texto potente (similar a Sublime Text con más funcionalidades) pero, por ahora, no aporta un valor diferencial clave. Se procederá a probar **Trae 2.0** y se investigará la posibilidad de mejorar el visor de Markdown en otros editores si fuera necesario.

### Comparativa de Editores (en progreso)

| Característica | VS Code | JetBrains Fleet | Trae 2.0 |
| :--- | :---: | :---: | :---: |
| **Consumo de RAM** | Bajo | Alto | *Pendiente* |
| **Previsualización MD** | Buena (con extensiones) | Excelente | *Pendiente* |
| **Soporte Flutter** | Excelente | Bueno | *Pendiente* |
| **IA Integrada** | Sí (Copilot, etc.) | Sí (de pago) | *Pendiente* |

### Opciones para Probar la Aplicación

Para la fase de desarrollo móvil, existen varias formas de probar una aplicación:

1.  **Emulador Local**: Un dispositivo Android virtual que se ejecuta en el ordenador. Se crea y gestiona desde el AVD Manager de Android Studio. Es ideal para pruebas rápidas.
2.  **Dispositivo Físico**: Conectar un teléfono o tableta real vía USB. Es la forma más fiable de probar el rendimiento y comportamiento real de la aplicación. Requiere activar la "Depuración por USB" en las opciones de desarrollador del dispositivo.
3.  **Entorno en la Nube (Firebase)**: Servicios como Firebase Test Lab permiten probar la aplicación en una amplia gama de dispositivos virtuales en la nube, ahorrando recursos locales y facilitando las pruebas automatizadas.

## Proyectos

### flutter_grandparents_v??

Se ha iniciado un proyecto práctico para aplicar los conocimientos de Dart y Flutter. Toda la información, objetivos y metodología de este proyecto se encuentran detallados en la **[Bitácora del Proyecto](./BITACORA_DEL_PROYECTO.md)**.
