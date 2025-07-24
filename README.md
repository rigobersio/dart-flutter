# dart-flutter
apuntes

## Configuración de Entorno de Desarrollo en Linux para Android

Esta guía describe los pasos para configurar un entorno de desarrollo completo para crear aplicaciones Android con Flutter en un sistema operativo Linux.

### 1. Instalación del SDK de Flutter

Puedes instalar el SDK de Flutter clonando el repositorio oficial.

```bash
# Clona el repositorio de Flutter
git clone https://github.com/flutter/flutter.git -b stable

# Agrega el comando 'flutter' a tu PATH para poder ejecutarlo desde cualquier lugar
# Añade la siguiente línea a tu archivo ~/.bashrc o ~/.zshrc
export PATH="$PATH:`pwd`/flutter/bin"

# Recarga tu terminal o ejecuta el siguiente comando para aplicar los cambios
source ~/.bashrc
```

Después de la instalación, ejecuta el siguiente comando para verificar que todo esté correcto e instalar las dependencias necesarias.

```bash
flutter doctor
```

Este comando te guiará a través de los componentes que faltan.

### 2. Instalación de Android Studio

Aunque uses VSCode como tu editor principal, **Android Studio** es necesario porque instala y gestiona el SDK de Android, las herramientas de línea de comandos y el emulador.

1.  **Descarga Android Studio**: Ve al [sitio web oficial de Android Studio](https://developer.android.com/studio) y descarga el paquete para Linux.
2.  **Instala Android Studio**: Descomprime el archivo descargado y ejecuta el script de instalación.
    ```bash
    sudo tar -xzf android-studio-*.tar.gz -C /opt
    /opt/android-studio/bin/studio.sh
    ```
3.  **Configuración Inicial**: Sigue el asistente de instalación de Android Studio. Asegúrate de instalar los siguientes componentes:
    *   Android SDK
    *   Android SDK Command-line Tools
    *   Android SDK Build-Tools
    *   Android Emulator

Una vez instalado, ejecuta `flutter doctor` de nuevo para asegurarte de que Flutter reconozca la instalación de Android Studio.

### 3. Configuración de un Emulador de Android

Puedes crear un dispositivo virtual (emulador) para probar tus aplicaciones directamente en tu máquina.

1.  **Abre el AVD Manager**: En Android Studio, ve a `Tools > AVD Manager`.
2.  **Crea un Dispositivo Virtual**:
    *   Haz clic en `Create Virtual Device`.
    *   Elige un perfil de hardware (por ejemplo, un modelo de Pixel).
    *   Selecciona una imagen del sistema (se recomienda una de las versiones más recientes de Android).
    *   Verifica la configuración y haz clic en `Finish`.
3.  **Inicia el Emulador**: Inicia el emulador desde el AVD Manager. Flutter lo detectará automáticamente cuando ejecutes tu aplicación.

### 4. Configuración de un Dispositivo Físico (Tableta Android)

Probar en un dispositivo físico es fundamental. Sigue estos pasos para conectar tu tableta:

1.  **Habilita las Opciones de Desarrollador**:
    *   En tu tableta, ve a `Ajustes > Acerca del dispositivo`.
    *   Toca `Número de compilación` 7 veces hasta que aparezca un mensaje que diga "¡Ahora eres un desarrollador!".
2.  **Habilita la Depuración por USB**:
    *   Vuelve a `Ajustes`, busca `Opciones de desarrollador`.
    *   Activa la opción `Depuración por USB`.
3.  **Conecta la Tableta al Ordenador**:
    *   Usa un cable USB para conectar tu tableta.
    *   En la tableta, autoriza la conexión de depuración por USB si se te solicita.
4.  **Verifica la Conexión**:
    *   Ejecuta el siguiente comando en tu terminal. Deberías ver tu dispositivo en la lista.
    ```bash
    flutter devices
    ```

### 5. Configuración de VSCode

Para una mejor experiencia de desarrollo en VSCode, instala la extensión oficial de Flutter.

1.  Abre VSCode.
2.  Ve a la pestaña de `Extensiones` (Ctrl+Shift+X).
3.  Busca "Flutter" e instala la extensión publicada por `Dart Code`. Esta extensión también instalará automáticamente la extensión de `Dart`.

Con estos pasos, tendrás un entorno de desarrollo completamente funcional para crear, probar y depurar aplicaciones Flutter en Android.