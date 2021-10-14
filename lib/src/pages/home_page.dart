import 'package:flutter/material.dart';

class HomePage  extends StatelessWidget {

  static const opciones =  ['uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView( children:   _crearItems()  )  );
  }

  // Primera Forma
  // List<Widget> _crearItems() {
  //     List<Widget> lista = [];
  //
  //     for( String op in opciones){
  //       final temp = ListTile(
  //         title: Text(op),
  //       );
  //       lista.add(temp);
  //       lista.add(Divider());
  //     }
  //
  //
  //   return lista;
  // }
  /// 2 forma de hacer un list
  List<Widget> _crearItems() {
    var widgets = opciones.map((String o) {
      return ListTile(
        title: Text(o),
      );
    }).toList();
      return widgets;
  }
}
