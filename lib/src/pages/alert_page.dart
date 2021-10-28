import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title:const Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Mostrar Alerta'),
          onPressed: () => _mostrarAlert(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: const StadiumBorder()
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: (){
            Navigator.pop(context);
        },
      ),
    );
  }

    void _mostrarAlert(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true ,
      builder: (context){
        // https://api.flutter.dev/flutter/material/AlertDialog-class.html
        return  AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0)),
            title: const Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo( size: 100.0),


            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },

            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },

            ),
          ],
        );

      }
    );

  }
}
