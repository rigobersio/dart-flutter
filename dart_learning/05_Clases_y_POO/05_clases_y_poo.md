# 05: Clases y Programación Orientada a Objetos (POO)

La Programación Orientada a Objetos es el paradigma central de Dart. Todo en Dart es un objeto, que es una instancia de una **clase**. Las clases son como planos o plantillas para crear objetos. Definen las propiedades (datos) y los métodos (comportamientos) que tendrán sus instancias.

## Definiendo una Clase

Se usa la palabra clave `class`. Por convención, los nombres de las clases usan `UpperCamelCase`.

```dart
class Vehiculo {
  // Propiedades o variables de instancia
  String marca;
  int anio;
  bool encendido = false;

  // Métodos
  void encender() {
    encendido = true;
    print('El vehículo ha sido encendido.');
  }

  void apagar() {
    encendido = false;
    print('El vehículo ha sido apagado.');
  }

  void mostrarDetalles() {
    print('Marca: $marca, Año: $anio, Encendido: $encendido');
  }
}
```

## Constructores

Un constructor es un método especial que se llama al crear una nueva instancia de una clase. Su propósito es inicializar las propiedades del objeto.

### Constructor por Defecto y `this`

El uso de `this` se refiere a la instancia actual de la clase. Es necesario cuando los nombres de los parámetros del constructor chocan con los nombres de las propiedades.

```dart
class Vehiculo {
  String marca;
  int anio;

  // Constructor
  Vehiculo(String marca, int anio) {
    this.marca = marca;
    this.anio = anio;
  }
}
```

### Azúcar Sintáctico para Constructores

Dart ofrece una sintaxis mucho más limpia y común para lograr lo mismo:

```dart
class Vehiculo {
  String marca;
  int anio;

  // Constructor (forma idiomática en Dart)
  Vehiculo(this.marca, this.anio);
}
```

### Constructores con Nombre

Una clase puede tener múltiples constructores. Para ello, se usan los constructores con nombre, que permiten crear objetos con configuraciones específicas.

```dart
class Vehiculo {
  String marca;
  int anio;

  Vehiculo(this.marca, this.anio);

  // Constructor con nombre para vehículos antiguos
  Vehiculo.antiguo(this.marca) {
    anio = 1990;
  }
}

// Creando instancias
var miAuto = Vehiculo('Toyota', 2022);
var autoClasico = Vehiculo.antiguo('Ford');
```

## Pilares de la POO en Dart

### Herencia (`extends`)

La herencia permite a una clase (hija o subclase) adquirir las propiedades y métodos de otra clase (padre o superclase). Esto promueve la reutilización de código.

```dart
// La clase Coche hereda de Vehiculo
class Coche extends Vehiculo {
  int numeroDePuertas;

  // El constructor de la clase hija debe llamar al constructor de la superclase
  Coche(String marca, int anio, this.numeroDePuertas) : super(marca, anio);

  // Sobrescritura de un método
  @override
  void mostrarDetalles() {
    super.mostrarDetalles(); // Llama al método original del padre
    print('Puertas: $numeroDePuertas');
  }
}
```

### Encapsulamiento (Getters y Setters)

El encapsulamiento consiste en ocultar el estado interno de un objeto y exponerlo solo a través de métodos públicos. En Dart, todas las propiedades públicas tienen getters y setters implícitos. Para hacer una propiedad privada, su nombre debe comenzar con un guion bajo (`_`).

```dart
class CuentaBancaria {
  String _titular;
  double _saldo = 0;

  CuentaBancaria(this._titular);

  // Getter para el saldo (solo lectura pública)
  double get saldo => _saldo;

  // Setter para el titular
  set titular(String nuevoTitular) {
    _titular = nuevoTitular.trim();
  }

  void depositar(double monto) {
    if (monto > 0) _saldo += monto;
  }
}
```

### Clases Abstractas

Una clase abstracta no puede ser instanciada directamente. Sirve como una plantilla base para otras clases, definiendo métodos que las clases hijas deben implementar.

```dart
abstract class Figura {
  // Método abstracto (sin implementación)
  double calcularArea();

  void imprimirArea() {
    print('El área es: ${calcularArea()}');
  }
}

class Cuadrado extends Figura {
  double lado;
  Cuadrado(this.lado);

  @override
  double calcularArea() {
    return lado * lado;
  }
}
```
