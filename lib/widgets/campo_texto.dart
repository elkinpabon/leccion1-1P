import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controlador;
  final String etiqueta;
  final String Function(String) validador;

  const CampoTexto({
    Key? key,
    required this.controlador,
    required this.etiqueta,
    required this.validador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: etiqueta,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.blue[50],
      ),
      validator: (valor) {
        String error = validador(valor ?? '');
        return error.isEmpty ? null : error;
      },
    );
  }
}