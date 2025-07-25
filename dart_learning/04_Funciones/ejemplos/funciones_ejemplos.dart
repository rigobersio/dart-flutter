// Función con tipo de retorno, nombre y parámetros posicionales requeridos
int sumar(int a, int b) {
  return a + b;
}

// Función sin retorno (void) y con sintaxis de flecha
void saludar(String nombre) => print('Hola, $nombre');

// Función con parámetros con nombre (opcionales por defecto)
void configurarWidget({String? color, double? ancho}) {
  // Usamos el operador '??' para dar un valor por defecto si son nulos
  print('Color: ${color ?? 'Transparente'}, Ancho: ${ancho ?? 0.0}');
}

// Función con parámetros con nombre requeridos
void registrarUsuario({required String email, required String password}) {
  print('Registrando usuario con email: $email');
}

// Función con parámetros posicionales opcionales
void hacerPedido(String platoPrincipal, [String? bebida, String? postre]) {
  print('Pedido: $platoPrincipal');
  if (bebida != null) {
    print('  - Con bebida: $bebida');
  }
  if (postre != null) {
    print('  - Con postre: $postre');
  }
}

// Función con valores por defecto para sus parámetros
void crearBoton({String texto = 'Click aquí', String color = 'Azul'}) {
  print('Botón creado -> Texto: \'$texto\', Color: \'$color\''');
}

void main() {
  print('====== Funciones Básicas ======');
  saludar('Mundo');
  int resultado = sumar(10, 5);
  print('El resultado de la suma es: $resultado');

  print('\n====== Parámetros con Nombre ======');
  configurarWidget(color: 'Rojo');
  configurarWidget(ancho: 150.0);
  configurarWidget(ancho: 200.0, color: 'Verde');
  configurarWidget();

  print('\n====== Parámetros Requeridos ======');
  registrarUsuario(email: 'test@test.com', password: '123456');
  // registrarUsuario(email: 'test@test.com'); // Esto daría un error

  print('\n====== Parámetros Posicionales Opcionales ======');
  hacerPedido('Hamburguesa');
  hacerPedido('Hamburguesa', 'Gaseosa');
  hacerPedido('Hamburguesa', 'Gaseosa', 'Papas Fritas');

  print('\n====== Parámetros con Valores por Defecto ======');
  crearBoton();
  crearBoton(texto: 'Enviar Formulario');
  crearBoton(color: 'Rojo', texto: 'Cancelar');

  print('\n====== Funciones Anónimas (Lambdas) ======');
  List<String> nombres = ['Ana', 'Juan', 'Pedro'];
  print('Iterando sobre una lista con una función anónima:');
  nombres.forEach((nombre) {
    print('  - Saludo para $nombre');
  });

  // Asignar una función a una variable
  var operacion = (int a, int b) => a * b;
  print('Resultado de la operación (multiplicación): ${operacion(5, 4)}');
}