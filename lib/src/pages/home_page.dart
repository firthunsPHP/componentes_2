import 'package:componentes_2/src/providers/menu_provider.dart';
import 'package:componentes_2/src/utils/icon_strings.dart';
import 'package:flutter/material.dart';

class HomePage  extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(context),
    );
  }


  /// 2 forma de hacer un list
 Widget _lista(BuildContext context) {
    return FutureBuilder(
 future:  menuProvider.cargarDatos(),

  initialData: [],
   builder: ( context,AsyncSnapshot<List> snapshot){
   return ListView(
     children:  _listaItems( snapshot.data , context),
   );
   }
    );
 }

 List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];

    if( data != null){

      data.forEach((element) {
        final widgetTemp = ListTile(
          title: Text(element['texto']),
          leading: getIcono(element['icon']),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.pushNamed(context, element['ruta']);
          },
        );
        opciones..add(widgetTemp)
                ..add( Divider());
      });


    }
  return opciones;
 }
}
