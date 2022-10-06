import 'package:flutter_application_1/Bloc/repositorio_verificacion.dart';
import 'package:flutter_application_1/dominio/problema.dart';
import 'package:flutter_application_1/model/Nick_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pruebas verificacion offline', () {
    test('Obtener registro blood', () {
      VerificacionJson repositorio = VerificacionJson();

      var resultado =
          repositorio.obtenerRegistroUsuario(NickFormado.constructor('hound'));

      resultado.match((l) {
        expect(false, equals(true));
      }, (r) {
        expect(r.status, equals("success"));
        expect(r.subraza[0], equals("afghan"));
        expect(r.subraza[2], equals("blood"));
      });
    });

    test('Obtener registro incorrecto', () {
      VerificacionJson repositorio = VerificacionJson();

      var resultado =
          repositorio.obtenerRegistroUsuario(NickFormado.constructor('malo'));

      resultado.match((l) {
        expect(l, isA<RazaNoRegistrada>());
      }, (r) {
        expect(false, equals(true));
      });
    });

    test('Obtener registro SIN SUBRAZA', () {
      VerificacionJson repositorio = VerificacionJson();

      var resultado = repositorio
          .obtenerRegistroUsuario(NickFormado.constructor('labrador'));

      resultado.match((l) {
        expect(l, isA<sinSubRazas>());
      }, (r) {});
    });
  });
}
