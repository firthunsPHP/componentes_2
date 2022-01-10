import 'package:componentes_2/src/pages/form_modal.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formularios'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()=> _registro(context),
          child: Text('Registrarse')
        )
      ),
    );
  }

  _registro(BuildContext context) {

    showCupertinoModalBottomSheet(
        expand: true,
        context: context,
        builder: (context)=> FormModaL()).then((value) =>{
       // var datos = value;
       // print(datos);
    }

    );

  }


}
