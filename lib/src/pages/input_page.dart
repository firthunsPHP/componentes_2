import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email  = '';
  String _fecha  = '';

  String _opcionSeleccionada = 'vacio';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );

  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon( Icons.alternate_email ),
        icon: Icon( Icons.email )
      ),
      onChanged: (valor) =>setState(() {
        _email = valor;
      })
    );

  }

  Widget _crearPassword(){

     return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon( Icons.lock_open ),
        icon: Icon( Icons.lock )
      ),
      onChanged: (valor) =>setState(() {
        _email = valor;
      })
    );

  }


  Widget _crearFecha( BuildContext context ) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today )
      ),
      onTap: (){

        FocusScope.of(context).requestFocus( FocusNode());
        _selectDate( context );

      },
    );

  }

  _selectDate(BuildContext context) async {

    DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate:  DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2040),
      locale: const Locale('es', 'ES')
    );

    if ( fechaSeleccionada != null ) {
      setState(() {
          // _fecha = fechaSeleccionada.toString();
            _fecha = DateFormat('dd-MM-yyyy').format(fechaSeleccionada);
          _inputFieldDateController.text = _fecha;
      });
    }

  }



  /// 7. https://api.flutter.dev/flutter/material/DropdownButton-class.html
  // Widget _crearDropdown() {
  //
  //
  //   return DropdownButton<dynamic>(
  //     items:getOpcionesDrop(),
  //     icon: const Icon(Icons.arrow_downward),
  //     iconSize: 24,
  //     elevation: 16,
  //     style: const TextStyle(color: Colors.deepPurple),
  //     underline: Container(
  //       height: 2,
  //       color: Colors.deepPurpleAccent,
  //     ),
  //     onChanged:  (opt){
  //       print(opt);
  //     },
  //
  //   );
  //
  // }

  Widget _crearDropdown() {

    return DropdownButtonFormField(
     decoration: InputDecoration(
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(20.0),
       ),
       label: const Text('poderes'),
       icon: const Icon(Icons.person),
     ),
      hint: const Text('Escoge tu superPoder'),
      items: getOpcionesDrop(),
      onChanged: (opt){
      print(opt);
      // _onDropDownChanged(opt?);
      },
    );

  }


  List<DropdownMenuItem<String>> getOpcionesDrop() {

    //si usan = new List(); dara error, reeemplazenlo solo por un arreglo vació
    //y eso debería de solucionar su problema
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder){

      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,

      ));
    });
    return lista;
  }

  // void _onDropDownChanged(String? opt) {
  //   setState( (){
  //     this._opcionSeleccionada = opt!;
  //   });
  // }



  Widget _crearPersona() {

    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(  _opcionSeleccionada),
    );

  }

}


