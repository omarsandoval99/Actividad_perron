import 'package:flutter_application_1/dominio/registro_perros.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('registro perros ...', (tester) async {
    final RegistroRaza r = RegistroRaza.constructor(nombre: "blood");

    expect(r.nombre, equals("blood"));
  });
}
