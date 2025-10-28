class Numero {
  int valor;
  List<int> divisores = [];
  int suma = 0;

  Numero(this.valor) {
    calcularDivisores();
    calcularSuma();
  }

  void calcularDivisores() {
    divisores.clear();
    for (int i = 1; i < valor; i++) {
      if (valor % i == 0) {
        divisores.add(i);
      }
    }
  }

  void calcularSuma() {
    suma = 0;
    for (int divisor in divisores) {
      suma = suma + divisor;
    }
  }

  bool esAmigoCon(Numero otro) {
    return this.suma == otro.valor && otro.suma == this.valor;
  }
}