import '../model/numero.dart';

class Calculadora {
  Numero? numeroA;
  Numero? numeroB;
  bool sonAmigos = false;

  void verificarAmigos(int a, int b) {
    numeroA = Numero(a);
    numeroB = Numero(b);
    sonAmigos = numeroA!.esAmigoCon(numeroB!);
  }

  String validarNumero(String texto) {
    if (texto.isEmpty) {
      return 'Ingrese un número';
    }
    
    int? numero = int.tryParse(texto);
    if (numero == null) {
      return 'Solo números enteros';
    }
    
    if (numero <= 0) {
      return 'Solo números positivos';
    }
    
    if (numero > 100000) {
      return 'Número muy grande';
    }
    
    return '';
  }

  void limpiar() {
    numeroA = null;
    numeroB = null;
    sonAmigos = false;
  }
}