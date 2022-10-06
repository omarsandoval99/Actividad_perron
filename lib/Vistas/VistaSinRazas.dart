import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bloc/Bloc.dart';
import 'package:flutter_application_1/model/Nick_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sinrazas extends StatelessWidget {
  final NickFormado raza;
  const Sinrazas(this.raza, {super.key});

  @override
  Widget build(BuildContext context) {
    final elbloc = context.read<BlocVerificacion>();
    return Center(
      child: Column(
        children: [
          Text("La Raza de perro " + raza.valor + " , no contiene subrazas"),
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
