import 'dart:async';

const List<String> PRODUCTOS = [
  'Lunes',
  'Martes',
  'Miercoles',
  'Jueves',
  'Viernes',
  'Sabado',
  'Domingo'
];

class ProductosBlock {
  Stream<List<String>> get getproductos async* {
    final List<String> producto = [];

    for (String item in PRODUCTOS) {
      await Future.delayed(Duration(seconds: 2));

      producto.add(item);
      yield producto;
    }
  }

  StreamController<int> _contadordiasContgroler = StreamController<int>();
  //declaro streamcontroler stream controlado, va dentro del constructor
  Stream<int> get contadordias => _contadordiasContgroler
      .stream; //futuro puente para acceder a la cantidad de dias

  dispose() {
    _contadordiasContgroler.close();
  }

//constructor que escucha getproducto y agrega a _contador que es privado y es retransmitido por contadordias
  ProductosBlock() {
    this.getproductos.listen((event) {
      return this._contadordiasContgroler.add(event.length);
    });
  }
}
