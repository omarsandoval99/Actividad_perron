import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bloc/Bloc.dart';
import 'package:flutter_application_1/Bloc/repositorio_verificacion.dart';
import 'package:flutter_application_1/Vistas/SolicitandoNombre.dart';
import 'package:flutter_application_1/Vistas/Solicitudactualizacion.dart';
import 'package:flutter_application_1/Vistas/vistaRazas.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Vistas/VistaSinRazas.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion =
            BlocVerificacion(VerificacionJson());

        blocVerificacion.add(Creado());

        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Builder(
            builder: ((context) {
              var estado = context.watch<BlocVerificacion>().state;

              if (estado is SolicitandoNombre) {
                return const VistaSolicitandoNombre();
              }
              if (estado is MonstrandoNombreSinSubraza) {
                return Sinrazas(estado.nick);
              }

              if (estado is MostrandoNombreConfirmado) {
                return VistaRaza(estado.nick, estado.registroraza);
              }
              if (estado is MostrandoNoEncontrado) {
                return SolicitudDeActualizacion(estado.nick);
              }

              return const Center(child: Text('HUYE'));
            }),
          ),
        ));
  }
}
