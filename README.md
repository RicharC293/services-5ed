# Services App

Aplicación Flutter que lista servicios obtenidos de una API y permite agendar uno mediante un formulario.

## ¿Qué hace?

- Obtiene un catálogo de servicios desde un API REST.
- Muestra detalles de cada servicio y su imagen.
- Permite programar un servicio completando un formulario.
- Cuenta con un interruptor para cambiar entre tema claro y oscuro.

## Requisitos

- Flutter 3.8 o superior instalado en tu entorno.

## Instrucciones para levantar el proyecto

1. Clona este repositorio.
2. Desde la raíz, instala las dependencias ejecutando:

   ```bash
   flutter pub get
   ```
3. Conecta un emulador o dispositivo y arranca la aplicación con:

   ```bash
   flutter run
   ```
4. (Opcional) Ejecuta las pruebas con:

   ```bash
   flutter test
   ```

## Estructura del proyecto

El código principal reside en `lib/` y se organiza de la siguiente manera:

- `models/`: clases de datos como `ServiceModel`.
- `services/`: llamadas al API y lógica de obtención de datos.
- `screens/`: pantallas que componen la interfaz de usuario.
- `notifiers/`: proveedores `ChangeNotifier` para manejar el estado.
- `utils/`: utilidades como el sistema de rutas.

Las pruebas se ubican en el directorio `test/` y los archivos específicos de cada plataforma se encuentran en `android/`, `ios/`, `linux/`, `macos/` y `windows/`.
