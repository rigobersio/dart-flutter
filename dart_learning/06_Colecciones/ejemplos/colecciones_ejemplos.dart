void main() {
  print('====== List ======');
  List<String> frutas = ['Manzana', 'Banana', 'Cereza', 'Manzana'];
  print('Lista de frutas: $frutas');
  print('Primera fruta: ${frutas[0]}');
  frutas.add('Naranja');
  print('Lista después de añadir Naranja: $frutas');
  print('Cantidad de frutas: ${frutas.length}');

  print('\n====== Set ======');
  Set<String> paises = {'Chile', 'Argentina', 'Perú'};
  print('Set de países inicial: $paises');
  paises.add('Brasil');
  paises.add('Chile'); // Este duplicado será ignorado
  print('Set después de añadir duplicado: $paises');
  print('¿El set contiene a Chile? ${paises.contains('Chile')}');

  print('\n====== Map ======');
  Map<String, String> capitales = {
    'Chile': 'Santiago',
    'Argentina': 'Buenos Aires',
    'Perú': 'Lima'
  };
  print('Mapa de capitales: $capitales');
  print('Capital de Chile: ${capitales['Chile']}');
  capitales['Brasil'] = 'Brasilia';
  print('Mapa después de añadir Brasil: $capitales');

  print('\nIterando el mapa:');
  capitales.forEach((pais, capital) {
    print('  - La capital de $pais es $capital');
  });

  print('\n====== Operadores de Colección ======');
  var lista1 = [1, 2, 3];
  var lista2 = [4, 5, 6];
  var listaCombinada = [...lista1, ...lista2, 7, 8];
  print('Lista combinada con operador de propagación: $listaCombinada');

  List<int>? listaNula;
  var listaSegura = [...lista1, ...?listaNula];
  print('Combinación segura con lista nula: $listaSegura');

  bool agregarColor = true;
  var colores = [
    'Rojo',
    'Verde',
    if (agregarColor) 'Azul',
    if (!agregarColor) 'Amarillo'
  ];
  print('Colores con collection if: $colores');

  var numerosPares = [
    for (int i = 1; i <= 10; i++)
      if (i % 2 == 0) i
  ];
  print('Números pares con collection for: $numerosPares');
}