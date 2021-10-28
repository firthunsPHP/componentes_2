import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions:   <Widget>[
           Container(
             padding: EdgeInsets.all(3.0),
             child: const CircleAvatar(
              backgroundImage: NetworkImage('https://ichef.bbci.co.uk/news/640/cpsprodpb/A85B/production/_104299034_tv050571340.jpg'),
              radius: 30.0,
          ),
           ),
           Container(
             margin: const EdgeInsets.only(right: 10.0),
             child: const CircleAvatar(
              child:  Text('SL'),
               radius: 20.0,
              backgroundColor: Colors.brown,
          ),
           )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage('https://img.europapress.es/fotoweb/fotonoticia_20181129124535_420.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration( milliseconds: 200),
        ),
      ),
    );
  }
}
