import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bloc/Bloc.dart';
import 'package:flutter_application_1/model/Nick_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaSolicitandoNombre extends StatefulWidget {
  const VistaSolicitandoNombre({Key? key}) : super(key: key);

  @override
  State<VistaSolicitandoNombre> createState() => _VistaSolicitandoNombreState();
}

class _VistaSolicitandoNombreState extends State<VistaSolicitandoNombre> {
  bool _usuarioValidado = false;
  late final TextEditingController controlador;

  @override
  void initState() {
    controlador = TextEditingController();
    controlador.addListener(escuchandoValidador);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elbloc = context.read<BlocVerificacion>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Usuario',
          ),
          controller: controlador,
        ),
        Container(
            child: TextButton(
                style: ButtonStyle(
                  foregroundColor: _usuarioValidado
                      ? MaterialStateProperty.all<Color>(Colors.black)
                      : MaterialStateProperty.all<Color>(Colors.grey),
                ),
                onPressed: _usuarioValidado
                    ? () {
                        elbloc.add(NombreRecibido(
                            NickFormado.constructor(controlador.text)));
                      }
                    : null,
                child: const Text('Ingresar'))),
      ]),
    );
  }

  void escuchandoValidador() {
    setState(() {
      try {
        Validador(controlador.text);
        _usuarioValidado = true;
      } catch (e) {
        _usuarioValidado = false;
      }
    });
  }
}

class Validador {
  late final String value;
  Validador(String propuesta) {
    if ((propuesta.trim().isEmpty)) {
      throw UsuarioError();
    }
    value = propuesta;
  }
}

class UsuarioError implements Exception {}
