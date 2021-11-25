
import 'package:componentes_2/src/pages/second_page.dart';
import 'package:flutter/material.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {

  TextEditingController textController = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pasar datos'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: textController,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black
              ),
            ),
            ),
            ElevatedButton(
                child: Text('Enviar'),
                onPressed: ()=> _enviarDatos(context),


            ),

            Text(text)
          ],
        ),
      ),
    );
  }

  _enviarDatos(BuildContext context) async {
    String texto = textController.text;
    // pasamos el texto a la sguiente pantalla
    final result = await   Navigator.push(  context,   MaterialPageRoute(
        builder: (context)=> SecondPage(texto: texto)   )   );

    setState(() {
      text = result;
    });
    // Navigator.push(  context,   MaterialPageRoute(
    //       builder: (context)=> SecondPage(texto: texto)      )
    // );

  }


}
