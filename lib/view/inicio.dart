import 'package:flutter/material.dart';
import '../controller/calculadora.dart';
import '../widgets/campo_texto.dart';
import '../widgets/boton.dart';

class Inicio extends StatefulWidget {
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final _llave = GlobalKey<FormState>();
  final _numeroA = TextEditingController();
  final _numeroB = TextEditingController();
  final _calculadora = Calculadora();

  // ejemplos de numeros amigos
  final List<Map<String, int>> ejemplos = [
    {'a': 220, 'b': 284},
    {'a': 1184, 'b': 1210},
    {'a': 2620, 'b': 2924},
    {'a': 5020, 'b': 5564},
    {'a': 6232, 'b': 6368},
  ];

  void _verificar() {
    if (_llave.currentState!.validate()) {
      int a = int.parse(_numeroA.text);
      int b = int.parse(_numeroB.text);
      
      _calculadora.verificarAmigos(a, b);
      
      Navigator.pushNamed(
        context,
        '/resultado',
        arguments: {
          'numeroA': _calculadora.numeroA,
          'numeroB': _calculadora.numeroB,
          'sonAmigos': _calculadora.sonAmigos,
        },
      );
    }
  }

  void _limpiar() {
    _numeroA.clear();
    _numeroB.clear();
    _calculadora.limpiar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Números Amigos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _llave,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Verificar Números Amigos',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Ingrese dos números para verificar si son amigos',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CampoTexto(
                  controlador: _numeroA,
                  etiqueta: 'Primer Número',
                  validador: _calculadora.validarNumero,
                ),
                const SizedBox(height: 16),
                CampoTexto(
                  controlador: _numeroB,
                  etiqueta: 'Segundo Número',
                  validador: _calculadora.validarNumero,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Boton(
                        texto: 'Verificar',
                        accion: _verificar,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Boton(
                        texto: 'Limpiar',
                        accion: _limpiar,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.yellow.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ejemplos:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(height: 16),
                      ...ejemplos.map((ejemplo) => _mostrarEjemplo(ejemplo)).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mostrarEjemplo(Map<String, int> ejemplo) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.info_outline,
            color: Colors.blue,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            '${ejemplo['a']} y ${ejemplo['b']}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _numeroA.dispose();
    _numeroB.dispose();
    super.dispose();
  }
}