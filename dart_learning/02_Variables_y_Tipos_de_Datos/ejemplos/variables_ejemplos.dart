void main() {
  // ====== Inferencia de Tipo con 'var' ======
  var nombre = 'Alice';
  print('Tipo de nombre: ${nombre.runtimeType}'); // String
  // nombre = 30; // Error: A value of type 'int' can't be assigned to a variable of type 'String'.

  // ====== Tipado Explícito ======
  String apellido = 'Wonderland';
  int edad = 25;
  bool esEstudiante = false;
  print('Apellido: $apellido, Edad: $edad, ¿Es estudiante?: $esEstudiante');

  // ====== final (Inmutable en tiempo de ejecución) ======
  final String pais = 'Chile';
  // pais = 'Argentina'; // Error: The final variable 'pais' can only be set once.
  print('País: $pais');

  final horaDeInicio = DateTime.now();
  print('Hora de inicio (final): $horaDeInicio');

  // ====== const (Constante de compilación) ======
  const double PI = 3.14159;
  print('Valor de PI: $PI');
  // const horaDeInicioConst = DateTime.now(); // Error: Const variables must be initialized with a constant value.

  // ====== dynamic (Tipado dinámico) ======
  dynamic miVariable = 'Esto es un texto';
  print('miVariable (String): $miVariable');
  miVariable = 100;
  print('miVariable (int): $miVariable');
  miVariable = true;
  print('miVariable (bool): $miVariable');

  // ====== Tipos de Datos Numéricos ======
  num numero = 10;    // Inicialmente int
  print('Número (num como int): $numero');
  numero = 10.5;  // Ahora double
  print('Número (num como double): $numero');

  int entero = 50;
  double decimal = 25.75;
  print('Entero: $entero, Decimal: $decimal');

  // ====== String y concatenación ======
  String saludo = 'Hola';
  String despedida = "Adiós";
  String frase = '$saludo, $nombre. Nos vemos, $despedida.';
  print(frase);

  // ====== Null Safety ======
  String mensaje = 'Este mensaje no puede ser nulo.';
  String? mensajeOpcional;

  print('Mensaje: $mensaje');
  print('Mensaje Opcional: $mensajeOpcional'); // Imprime: null

  // Para usar una variable nulable, hay que comprobar si es nula
  if (mensajeOpcional != null) {
    print(mensajeOpcional.length);
  } else {
    print('El mensaje opcional es nulo.');
  }

  // O usar el operador de acceso seguro (?.)
  print('Longitud del mensaje opcional: ${mensajeOpcional?.length}'); // Imprime: null

  // Asignamos un valor
  mensajeOpcional = 'Ahora sí tengo un valor';
  print('Longitud del mensaje opcional: ${mensajeOpcional?.length}'); // Imprime: 23
}
