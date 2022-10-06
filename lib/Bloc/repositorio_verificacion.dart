import 'dart:convert';

import 'package:flutter_application_1/Bloc/Bloc.dart';
import 'package:flutter_application_1/dominio/registro_perros.dart';
import 'package:flutter_application_1/model/Nick_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_application_1/dominio/problema.dart';

abstract class repositorioVerificacion {
  Either<Problema, RegistroRaza> obtenerRegistroUsuario(NickFormado nick);
}

List campos = ['message', 'status'];

class VerificacionJson extends repositorioVerificacion {
  final String _hound = """{
    "message": [
        "afghan",
        "basset",
        "blood",
        "english",
        "ibizan",
        "plott",
        "walker"
    ],
    "status": "success"
}""";

  final String _labrador = """{
  "message": [],
  "status": "success"
}""";

  final String _sinvalor = """{
  "status": "error",
  "message": "Breed not found (master breed does not exist)",
  "code": 404
}""";

  Either<Problema, RegistroRaza> obtenerRegistroRazadeJson(
      Map<String, dynamic> documento) {
    /*   Either<Problema, String> SubRazas = documento['message'].isEmpty
        ? left(sinSubRazas())
        : right(documento['message']); */

    if (documento['status'] == "error") {
      return left(RazaNoRegistrada());
    }

    if (documento['message'].isEmpty) {
      return left(sinSubRazas());
    }
    return right(RegistroRaza.constructor(
        subraza: documento['message'], status: documento['status']));
  }

  @override
  Either<Problema, RegistroRaza> obtenerRegistroUsuario(NickFormado nick) {
    if (nick.valor == 'hound') {
      Map<String, dynamic> nombre = jsonDecode(_hound);

      return obtenerRegistroRazadeJson(nombre);
    }

    if (nick.valor == "malo") {
      Map<String, dynamic> nombre = jsonDecode(_sinvalor);
      return obtenerRegistroRazadeJson(nombre);
    }

    if (nick.valor == "labrador") {
      Map<String, dynamic> nombre = jsonDecode(_labrador);
      return obtenerRegistroRazadeJson(nombre);
    }
    return left(RazaNoRegistrada());
  }
}
