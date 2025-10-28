import 'package:flutter/material.dart';
import '../model/numero.dart';

class TarjetaResultado extends StatelessWidget {
  final Numero numeroA;
  final Numero numeroB;
  final bool sonAmigos;

  const TarjetaResultado({
    Key? key,
    required this.numeroA,
    required this.numeroB,
    required this.sonAmigos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: sonAmigos ? Colors.green[100] : Colors.red[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                sonAmigos 
                  ? '¡${numeroA.valor} y ${numeroB.valor} SÍ son amigos!'
                  : '${numeroA.valor} y ${numeroB.valor} NO son amigos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: sonAmigos ? Colors.green[800] : Colors.red[800],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            _construirDetalle(numeroA),
            SizedBox(height: 12),
            _construirDetalle(numeroB),
          ],
        ),
      ),
    );
  }

  Widget _construirDetalle(Numero numero) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Número: ${numero.valor}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Divisores: ${numero.divisores.join(', ')}'),
          SizedBox(height: 4),
          Text(
            'Suma: ${numero.suma}',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}