import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String texto;

  const SecondPage({Key? key, this.texto = ''}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  TextEditingController textController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [Text(widget.texto),
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
            onPressed: ()=> _devolverDatos(context),


          )
        ],
        
      ),
    ),
    );
  }

  _devolverDatos(BuildContext context) {

    String text = textController.text;
    Navigator.pop(context, text); // si tuvbieramos 5 variables _> text, text2, text23......

  }
}
