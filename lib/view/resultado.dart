import 'package:flutter/material.dart';
import '../model/numero.dart';
import '../widgets/tarjeta_resultado.dart';
import '../widgets/boton.dart';

class Resultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    
    final Numero numeroA = argumentos['numeroA'];
    final Numero numeroB = argumentos['numeroB'];
    final bool sonAmigos = argumentos['sonAmigos'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: TarjetaResultado(
                  numeroA: numeroA,
                  numeroB: numeroB,
                  sonAmigos: sonAmigos,
                ),
              ),
            ),
            SizedBox(height: 16),
            Boton(
              texto: 'Verificar Otros Números',
              accion: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}