# Tutorial de Configuración de Flutter en Linux

Este documento es una guía pedagógica diseñada para explicar, paso a paso, cómo se instala y configura un entorno de desarrollo profesional para Flutter en sistemas operativos Linux. El objetivo es construir aplicaciones para Android, entendiendo el propósito de cada herramienta.

## 1. Conceptos Fundamentales: Las Cajas de Herramientas

Antes de instalar, es crucial entender las herramientas que se van a utilizar.

### ¿Qué es un SDK (Software Development Kit)?

Un **SDK** o "Kit de Desarrollo de Software" es una colección de herramientas de software que los desarrolladores utilizan para crear aplicaciones para una plataforma específica. Piense en ello como una caja de herramientas especializada. Para un carpintero, la caja tendría martillos y sierras; para un programador de Flutter, la caja (el SDK) contiene:

*   **Compiladores**: Programas que traducen el código fuente (escrito en Dart) a un lenguaje que el sistema operativo Android puede ejecutar.
*   **Bibliotecas (Libraries)**: Conjuntos de código preescrito que ofrecen funcionalidades listas para usar, como acceder a la cámara, mostrar mapas o crear elementos visuales.
*   **Herramientas de Depuración (Debugger)**: Utilidades que ayudan a encontrar y corregir errores en el código.

### SDK de Dart vs. SDK de Flutter

En el ecosistema de Flutter, se habla de dos SDKs, pero para el desarrollo de aplicaciones solo se necesita uno.

*   **Dart SDK**: Es el kit fundamental que contiene lo esencial para trabajar con el lenguaje de programación Dart.
*   **Flutter SDK**: Es un kit de desarrollo de aplicaciones completo. Es importante destacar que **el SDK de Flutter ya incluye el SDK de Dart en su interior**, además de todo lo necesario para la creación de interfaces de usuario: el motor gráfico, los widgets, y las herramientas para compilar y desplegar la aplicación en Android, iOS y otras plataformas.

> **Conclusión Pedagógica**: Al instalar el **SDK de Flutter**, se obtiene automáticamente todo lo necesario. No se requiere una instalación separada del SDK de Dart.

## 2. Instalación del Entorno Local

A continuación, se detalla el proceso de instalación en el ordenador local.

### Paso 1: Obtener el SDK de Flutter con Git

El SDK se obtiene clonando el repositorio oficial desde GitHub.

```bash
# Clona el repositorio de Flutter en su versión "stable" (la más probada)
git clone https://github.com/flutter/flutter.git -b stable
```

**¿Por qué se utiliza el comando `git clone`?**
Al tener el repositorio localmente, actualizar Flutter a una nueva versión es tan simple como ejecutar el comando `flutter upgrade`. Git, el sistema de control de versiones, se encargará de descargar eficientemente solo los archivos que han cambiado, haciendo el proceso de actualización mucho más rápido y seguro.

### Paso 2: Configurar la Variable de Entorno `PATH`

Una vez descargado, es necesario indicarle al sistema operativo dónde encontrar los ejecutables de Flutter.

**Nota Previa: ¿Qué terminal (shell) se está usando?**

Linux utiliza un programa llamado "shell" o intérprete de comandos para interactuar con el usuario. Los más comunes son `Bash` y `Zsh`. Cada uno usa un archivo de configuración diferente. Para saber cuál está en uso, se puede ejecutar el siguiente comando:

```bash
echo $SHELL
```

*   Si la salida es `/bin/bash`, el archivo a modificar es `~/.bashrc`.
*   Si la salida es `/bin/zsh`, el archivo a modificar es `~/.zshrc`.

**Importante: Cómo modificar el archivo de configuración**

El archivo (`~/.bashrc` o `~/.zshrc`) es un fichero de texto, no un programa. **No debe ser ejecutado directamente en la terminal**, ya que eso causa el error `Permission denied` que observaste. Debe ser abierto con un editor de texto para añadirle una línea.

Se puede usar un editor simple de terminal como `nano`:

```bash
# Opción 1: Si usas Bash
nano ~/.bashrc

# Opción 2: Si usas Zsh
nano ~/.zshrc
```

Una vez abierto el editor, hay que agregar la siguiente línea al **final** del archivo:

```bash
export PATH="$PATH:/ruta/absoluta/a/su/carpeta/flutter/bin"
```
*(Nota: Reemplace `/ruta/absoluta/a/su/carpeta/flutter/bin` con la ruta real donde clonó el repositorio. Puede obtenerla navegando a la carpeta `flutter/bin` y ejecutando el comando `pwd`)*.

Para guardar los cambios en `nano`, presione `Ctrl+O`, `Enter`, y luego `Ctrl+X` para salir.

Finalmente, para aplicar los cambios en la terminal actual sin necesidad de reiniciarla, se usa el comando `source`:

```bash
# Opción 1: Si usas Bash
source ~/.bashrc

# Opción 2: Si usas Zsh
source ~/.zshrc
```

**¿Qué es la variable `PATH` y por qué se modifica?**
La variable `PATH` es una lista de directorios que la terminal de comandos revisa cada vez que se introduce un comando (como `ls`, `git` o, en este caso, `flutter`). Si el sistema no encuentra el ejecutable en ninguna de las carpetas de esa lista, devuelve un error de "comando no encontrado".

Al añadir la ruta de la carpeta `bin` de Flutter al `PATH`, se está registrando esa ubicación como un lugar de confianza para buscar comandos. Esto permite ejecutar comandos como `flutter doctor` desde cualquier directorio en la terminal, lo cual es fundamental para un flujo de trabajo eficiente.

**Solución de Problemas Avanzada: El comando `flutter` sigue sin encontrarse**

En algunas configuraciones de sistema (como en KDE Neon, entre otros), la terminal puede ser muy estricta y no cargar las variables de entorno de los archivos `.bashrc` o `.profile` como se espera. Si después de intentar los pasos anteriores el comando `flutter` sigue sin funcionar, existe una solución más directa y robusta: crear un enlace simbólico (un "acceso directo").

Se creará un enlace desde el ejecutable de Flutter a un directorio que el sistema siempre revisa, como `/usr/local/bin`. Para ello, se debe ejecutar el siguiente comando en la terminal. Es importante destacar que este comando requiere privilegios de administrador (`sudo`), por lo que pedirá la contraseña del usuario:

```bash
# Reemplace /ruta/absoluta/a/su/carpeta/flutter/bin con la ruta real
sudo ln -s /ruta/absoluta/a/su/carpeta/flutter/bin/flutter /usr/local/bin/flutter
```

---

Básicamente hay que agregar un enlace simbólico del ejecutable flutter en **local/bin/**

---

Una vez ejecutado este comando, el sistema siempre sabrá dónde encontrar `flutter`, solucionando el problema de forma permanente.

### Paso 3: El Rol de Android Studio (Instalación Convencional)

Aunque el editor de código principal será VSCode, la instalación de **Android Studio** es un paso necesario. No se usará para escribir código, sino como un **gestor de las herramientas de Android**.

**Nota Importante: El Problema con la Instalación vía Flatpak (Tienda Discover)**

Si se instala Android Studio desde una tienda de software como *Discover*, lo más probable es que se instale una versión *Flatpak*. Las aplicaciones Flatpak se ejecutan en un entorno aislado (sandbox), lo que impide que Flutter encuentre el SDK de Android, causando el error `Unable to locate Android SDK`. Por esta razón, **se recomienda desinstalar la versión de Flatpak y seguir el método de instalación manual que se describe a continuación.**

**Proceso de Instalación Manual (Recomendado)**

1.  **Descargar y Descomprimir**: Descargue el archivo `.tar.gz` desde el [sitio web oficial de Android Studio](https://developer.android.com/studio). una vez descomprimido:

2.  **Mover la Carpeta a un Directorio Permanente (Método Seguro)**: Para mantener el sistema de archivos organizado, es una buena práctica mover la carpeta `android-studio` descomprimida a un directorio permanente. Un lugar estándar para software de terceros en Linux es `/opt/`.

    **Nota de Permisos (¡Muy Importante!)**: Para evitar problemas de permisos, el proceso correcto es:
    *   **Primero**, descomprimir el archivo `.tar.gz` en una carpeta normal (ej. `~/Descargas`) como usuario regular. Esto asegura que todos los archivos le pertenecen a usted (`neon:neon`).
    *   **Segundo**, usar `sudo mv` para mover la carpeta ya descomprimida a `/opt/`. A diferencia de otros comandos, `mv` preserva los permisos del propietario original.

    ```bash
    # 1. Asegúrese de estar en la carpeta donde descargó el archivo
    # cd ~/Descargas

    # 2. Descomprima el archivo como usuario regular
    tar -xzf android-studio-*.tar.gz

    # 3. Mueva la carpeta a /opt/ usando sudo. Los permisos se mantendrán.
    sudo mv android-studio /opt/
    ```
    Este método garantiza que, aunque la aplicación resida en un directorio del sistema (`/opt/`), todos sus archivos internos siguen siendo propiedad de su usuario, evitando cualquier problema de lectura o escritura.

3.  **Ejecutar el Asistente de Configuración**: Navegue a la carpeta `bin` dentro del directorio de Android Studio y ejecute el script `studio.sh`.
    ```bash
    # Si lo movió a /opt/
    /opt/android-studio/bin/studio.sh

    # Si no, desde la carpeta donde lo descomprimió
    ./android-studio/bin/studio.sh
    ```

4.  **Pasos Dentro del Asistente (¡Esta es la parte clave!)**:
    *   En la pantalla de bienvenida, seleccione **"Custom"** en lugar de "Standard". Esto le dará control sobre los componentes a instalar.
    *   En la pantalla "SDK Components Setup", asegúrese de que las siguientes casillas estén **marcadas**:
        *   **`Android SDK`** (marcado por defecto)
        *   **`Android SDK Command-line Tools`** (a veces no está marcado por defecto, ¡márquelo!)
        *   **`Android Virtual Device (AVD)`** (para poder crear emuladores)
    *   Haga clic en "Next" y "Finish". El asistente descargará e instalará todos los componentes necesarios. Este proceso puede tardar varios minutos.

5.  **Aceptar las Licencias de Android**: Una vez que el asistente termine, cierre Android Studio. Abra una terminal y ejecute `flutter doctor` de nuevo. Ahora, el doctor debería encontrar el SDK, pero se quejará de las licencias. Ejecute el comando que el propio doctor le sugiere:
    ```bash
    flutter doctor --android-licenses
    ```
    Presione la tecla `y` y `Enter` repetidamente hasta que todas las licencias hayan sido aceptadas.

Después de estos pasos, si ejecuta `flutter doctor` una vez más, la sección del `Android toolchain` debería aparecer con un tic de color verde (`✓`).

---

### Nota Final sobre la Instalación en Linux (Caso Práctico)

En este punto, las instrucciones para la configuración del entorno de desarrollo en Linux finalizan. Durante el proceso de instalación de los componentes del SDK de Android a través del asistente de Android Studio, se ha determinado que el espacio en disco disponible en el equipo es insuficiente para completar la descarga e instalación.

El desarrollo de aplicaciones móviles, especialmente con Android, es intensivo en cuanto a espacio de almacenamiento. El SDK de Android, las imágenes de sistema para los emuladores y las propias herramientas de desarrollo pueden ocupar varias decenas de gigabytes.

Esta situación sirve como una lección práctica importante: **antes de comenzar, es crucial verificar que se cumplen los requisitos del sistema, incluyendo tener suficiente espacio libre en disco.**

Las próximas secciones del tutorial continuarán con la configuración en otros sistemas operativos o explorarán alternativas de desarrollo que no dependan de una instalación local completa, como los entornos en la nube.

---

### Paso 4: Verificación con `flutter doctor`

Esta herramienta de diagnóstico es esencial. Al ejecutarla, analizará la configuración y mostrará un informe detallado de lo que está bien y lo que falta.

```bash
flutter doctor
```
Siga sus instrucciones, especialmente para instalar las "Command-line tools" y aceptar las licencias de Android (`flutter doctor --android-licenses`).

## 3. Entornos de Prueba y Desarrollo

### Editor Principal: Visual Studio Code (VSCode)

Para desarrollar, se recomienda VSCode por su ligereza y su potente ecosistema de extensiones. La extensión oficial de **Flutter** (publicada por `Dart Code`) es indispensable, ya que ofrece autocompletado, depuración integrada y mucho más.

### Opciones para Probar la Aplicación

#### A. Emulador Local

Creado con el AVD Manager de Android Studio. Es un dispositivo Android completo que se ejecuta en el ordenador. Es ideal para pruebas rápidas.

#### B. Dispositivo Físico (Tableta/Teléfono)

Conectar un dispositivo real vía USB es la forma más fiable de probar el rendimiento y comportamiento de la aplicación. Requiere activar la "Depuración por USB" en las opciones de desarrollador del dispositivo.

#### C. Entorno en la Nube: Firebase Studio

**Firebase Studio** es una alternativa muy interesante que se encuentra en fase *preview*. Es un editor de código completo que se ejecuta en el navegador. Su gran ventaja es que proporciona un **entorno de desarrollo listo para usar, con un emulador de Android ya configurado**.

**Beneficios de Firebase Studio:**
*   **Cero Configuración**: Evita todo el proceso de instalación local del SDK de Android y la creación de emuladores.
*   **Bajo Consumo de Recursos**: Como todo se ejecuta en los servidores de Google, es una solución ideal para ordenadores con hardware limitado.
*   **Integración con Firebase**: Facilita enormemente la conexión de la aplicación con los servicios de backend de Firebase.

Es una opción excelente para complementar el desarrollo local o para empezar a programar de inmediato sin una configuración compleja.