import 'package:flutter_bloc/flutter_bloc.dart';

class Eventos {}

class Creado extends Eventos {}

class Estados {}

class Creandose extends Estados {}

class SolicitandoNombre extends Estados{}

class BlocVerificacion extends Bloc<Eventos, Estados> {
  BlocVerificacion() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitandoNombre());
    });
  }
}
