void main() {
  print('====== if-else ======');
  int edad = 20;
  if (edad >= 18) {
    print('Eres mayor de edad.');
  } else if (edad >= 13) {
    print('Eres un adolescente.');
  } else {
    print('Eres un niño.');
  }

  print('\n====== switch ======');
  String estado = 'pendiente';
  switch (estado) {
    case 'aprobado':
      print('El estado es aprobado.');
      break;
    case 'rechazado':
      print('El estado es rechazado.');
      break;
    case 'pendiente':
      print('El estado está pendiente de revisión.');
      break;
    default:
      print('Estado desconocido.');
  }

  print('\n====== Bucle for ======');
  for (int i = 1; i <= 5; i++) {
    print('Repetición número: $i');
  }

  print('\n====== Bucle for-in ======');
  List<String> frutas = ['Manzana', 'Banana', 'Cereza'];
  for (String fruta in frutas) {
    print('Fruta actual: $fruta');
  }

  print('\n====== Bucle while ======');
  int contador = 5;
  while (contador > 0) {
    print('El contador está en: $contador');
    contador--;
  }

  print('\n====== Bucle do-while ======');
  int numero = 10;
  do {
    // Este bloque se ejecuta una vez porque la condición se revisa después.
    print('Ejecución de do-while. Número es: $numero');
    numero--;
  } while (numero > 10);

  print('\n====== break y continue ======');
  for (int i = 1; i <= 10; i++) {
    if (i % 2 != 0) {
      continue; // Salta la iteración actual si el número es impar
    }
    if (i > 8) {
      break; // Termina el bucle completamente si el número es mayor que 8
    }
    print('Número par procesado: $i');
  }
}