// Función que puede lanzar una excepción
double dividir(int a, int b) {
  if (b == 0) {
    // Lanzamos una excepción específica para este caso
    throw IntegerDivisionByZeroException();
  }
  return a / b;
}

// Función que valida un email y puede lanzar una excepción personalizada
void validarEmail(String email) {
  if (!email.contains('@')) {
    throw FormatException('El email no es válido', email);
  }
}

void main() {
  print('====== Manejo de Excepciones: Caso 1 (División por cero) ======');
  try {
    // Intentamos ejecutar código que podría fallar
    var resultado = dividir(10, 0);
    print('El resultado es: $resultado');
  } on IntegerDivisionByZeroException {
    // Capturamos la excepción específica que esperamos
    print('Error: No se puede dividir por cero. La operación fue cancelada.');
  } catch (e) {
    // Capturamos cualquier otra excepción inesperada
    print('Ocurrió un error inesperado: $e');
  } finally {
    // Este bloque se ejecuta siempre, haya o no error
    print('Bloque finally del caso 1 ejecutado.');
  }

  print('\n====== Manejo de Excepciones: Caso 2 (Validación de formato) ======');
  try {
    validarEmail('correo-invalido.com');
    print('El email es válido.');
  } on FormatException catch (e) {
    // Capturamos la excepción y podemos acceder a sus propiedades
    print('Error de formato: ${e.message}');
    print('Valor inválido: ${e.source}');
  } finally {
    print('Bloque finally del caso 2 ejecutado.');
  }

  print('\n====== Caso sin errores ======');
  try {
    validarEmail('correo.valido@test.com');
    print('El email es válido.');
  } catch (e) {
    print('Esto no debería imprimirse: $e');
  } finally {
    print('Bloque finally del caso 3 ejecutado.');
  }

  print('\nEl programa continúa su ejecución después de manejar los errores.');
}