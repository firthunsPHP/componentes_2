
import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProvider{
  List<dynamic> opciones = [];
  
  _MenuProvider(){
    cargarDatos();
  }

  Future<List> cargarDatos() async {
    //método async
       final resp = await  rootBundle.loadString('assets/data.json');
      Map dataMap = json.decode(resp);
      return opciones = dataMap['ruta'];//al home solo le enviaremos las rutas

  }
  
}

final menuProvider =  _MenuProvider();