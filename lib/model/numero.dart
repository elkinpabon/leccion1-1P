class Numero {
  int valor;              
  List<int> divisores = [];     // lista de divisores propios
  int suma = 0;     

  Numero(this.valor) {
    calcularDivisores();   
    calcularSuma();     
  }

  // Encuentra todos los divisores propios del número
  void calcularDivisores() {
    divisores.clear();                 
    for (int i = 1; i < valor; i++) {     // Prueba números del 1 al valor-1
      if (valor % i == 0) {               // si divide exactamente residuo = 0
        divisores.add(i);                 // add a la lista
      }
    }
  }

  void calcularSuma() {
    suma = 0;                   
    for (int divisor in divisores) {      // recorre cada divisor
      suma = suma + divisor;            
    }
  }

  bool esAmigoCon(Numero otro) {
    return this.suma == otro.valor &&     
           otro.suma == this.valor;    
  }
}