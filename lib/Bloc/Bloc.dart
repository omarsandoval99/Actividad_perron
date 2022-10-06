import 'package:flutter_application_1/Bloc/repositorio_verificacion.dart';
import 'package:flutter_application_1/dominio/problema.dart';
import 'package:flutter_application_1/dominio/registro_perros.dart';
import 'package:flutter_application_1/model/Nick_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Eventos {}

class Creado extends Eventos {}

class NombreRecibido extends Eventos {
  final NickFormado nick;
  NombreRecibido(this.nick);
}

class Estados {}

class Creandose extends Estados {}

class SolicitandoNombre extends Estados {}

class EsperandoConfirmarNombre extends Estados {}

class MostrandoNoEncontrado extends Estados {
  final NickFormado nick;
  MostrandoNoEncontrado(this.nick);
}

class MostrandoNombreConfirmado extends Estados {
  final RegistroRaza registroraza;
  final NickFormado nick;
  MostrandoNombreConfirmado(this.registroraza, this.nick);
}

class MonstrandoNombreSinSubraza extends Estados {
  final NickFormado nick;
  MonstrandoNombreSinSubraza(this.nick);
}

class BlocVerificacion extends Bloc<Eventos, Estados> {
  final repositorioVerificacion _repositorioVerificacion;
  BlocVerificacion(this._repositorioVerificacion) : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitandoNombre());
    });

    on<NombreRecibido>((event, emit) {
      emit(EsperandoConfirmarNombre());
      final resultado =
          _repositorioVerificacion.obtenerRegistroUsuario(event.nick);
      resultado.match((l) {
        /*     l is VersionIncorrectaJson
            ? emit(MostrandoNoEncontrado())
            : null; */

        l is sinSubRazas ? emit(MonstrandoNombreSinSubraza(event.nick)) : null;

        l is RazaNoRegistrada ? emit(MostrandoNoEncontrado(event.nick)) : null;
      }, (r) {
        emit(MostrandoNombreConfirmado(r, event.nick));
      });
    });
  }
}
