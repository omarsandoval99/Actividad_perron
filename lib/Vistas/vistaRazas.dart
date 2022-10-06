import 'package:flutter_application_1/Bloc/Bloc.dart';
import 'package:flutter_application_1/dominio/registro_perros.dart';
import 'package:flutter_application_1/model/Nick_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaRaza extends StatelessWidget {
  final NickFormado raza;
  final RegistroRaza subrazas;
  const VistaRaza(this.raza, this.subrazas, {super.key});

  @override
  Widget build(BuildContext context) {
    final elbloc = context.read<BlocVerificacion>();
    return Center(
      child: Column(
        children: [
          Text("LA RAZA " + raza.valor + " tiene los siguientes subrazas:"),
          Text(_subrazas(subrazas)),
          TextButton(
              onPressed: () {
                elbloc.add(Creado());
              },
              child: const Text("REGRESAR"))
        ],
      ),
    );
  }
}

String _subrazas(RegistroRaza subrazas) {
  String x = "";

  for (var i = 0; i < subrazas.subraza.length; i++) {
    x = x + "\n" + subrazas.subraza[i];
  }

  return x;
}
