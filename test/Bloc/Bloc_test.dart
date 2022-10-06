import 'package:flutter_application_1/Bloc/repositorio_verificacion.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_application_1/Bloc/Bloc.dart';

void main() {
  blocTest<BlocVerificacion, Estados>(
    'emits [MyState] when MyEvent is added.',
    build: () => BlocVerificacion(VerificacionJson()),
    act: (bloc) => bloc.add(Creado()),
    expect: () => [isA<SolicitandoNombre>()],
  );
}
