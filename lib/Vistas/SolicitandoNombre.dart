import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VistaSolicitandoNombre extends StatelessWidget {
  const VistaSolicitandoNombre({super.key});

  @override
  Widget build(BuildContext context) {
    final controlador = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Nombre de dogs"),
      ),
      body: Column(
        children: [
          Text("Escribe el nombre de un perro"),
          TextField(
            controller: controlador,
          ),
          TextButton(onPressed: () {}, child: const Text("Buscar"))
        ],
      ),
    );
  }
}
