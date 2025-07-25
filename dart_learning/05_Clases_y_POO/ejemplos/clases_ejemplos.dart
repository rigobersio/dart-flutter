class Vehiculo {
  String marca;
  int anio;
  bool _encendido = false;

  // Constructor idiomático de Dart
  Vehiculo(this.marca, this.anio);

  // Constructor con nombre
  Vehiculo.deLujo(this.marca) : anio = DateTime.now().year;

  // Getter para la propiedad privada _encendido
  bool get estaEncendido => _encendido;

  void encender() {
    _encendido = true;
    print('El $marca ha sido encendido.');
  }

  void apagar() {
    _encendido = false;
    print('El $marca ha sido apagado.');
  }

  void mostrarDetalles() {
    print('Marca: $marca, Año: $anio, Encendido: $_encendido');
  }
}

// Herencia: Coche hereda de Vehiculo
class Coche extends Vehiculo {
  int numeroDePuertas;

  // Llama al constructor del padre (super) para inicializar marca y anio
  Coche(String marca, int anio, this.numeroDePuertas) : super(marca, anio);

  // Sobrescritura de un método
  @override
  void mostrarDetalles() {
    super.mostrarDetalles(); // Ejecuta el método original del padre
    print('Puertas: $numeroDePuertas');
  }
}

// Clase abstracta
abstract class Figura {
  // Método abstracto que las clases hijas DEBEN implementar
  double calcularArea();

  void imprimirArea() {
    print('El área de la figura es: ${calcularArea().toStringAsFixed(2)}');
  }
}

// Implementación de una clase abstracta
class Circulo extends Figura {
  double radio;

  Circulo(this.radio);

  @override
  double calcularArea() {
    return 3.14159 * radio * radio;
  }
}

void main() {
  print('====== Creación de Objetos ======');
  final miCoche = Coche('Toyota', 2023, 4);
  miCoche.mostrarDetalles();
  miCoche.encender();
  print('¿El coche está encendido? ${miCoche.estaEncendido}\n');

  final cocheDeLujo = Vehiculo.deLujo('Mercedes');
  cocheDeLujo.mostrarDetalles();

  print('\n====== Clases Abstractas e Implementación ======');
  // final figura = Figura(); // Error: Abstract classes can't be instantiated.
  final miCirculo = Circulo(10.0);
  miCirculo.imprimirArea();
}