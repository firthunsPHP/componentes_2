import 'package:flutter/material.dart';


class CardPage extends StatelessWidget{

  @override
  Widget build (BuildContext context){

    return Scaffold(
      appBar: AppBar(  title: const Text('Cards ....')    ),
      body:  ListView(
        padding:  EdgeInsets.all(15),
        // padding:  EdgeInsets.symmetric(horizontal: 10.0,  vertical: 10.0),
        children: <Widget>[
          _cardTipo1(),
          const SizedBox( height: 30.0,),
          _cardTipo2(),
          const SizedBox( height: 30.0,),
          _cardTipo3(),
          const SizedBox( height: 30.0,),
        ],
      ) ,
    );
  }

      // .circular(20.0)
  Widget _cardTipo1(){

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(25.0) ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue  ,),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),

      );
}
  // forma profe
  Widget _cardTipo2() {

    final card =  Container(
      // elevation: 40,
      // clipBehavior: Clip.antiAlias,

      child: Column(
        children: <Widget>[
          const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200),
            image: NetworkImage('https://p1.pxfuel.com/preview/408/106/337/north-landscape-park-duisburg-ruhr-area-factory-industry-steel-mill.jpg'),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          // const Image(
          //   image: NetworkImage('https://p1.pxfuel.com/preview/408/106/337/north-landscape-park-duisburg-ruhr-area-factory-industry-steel-mill.jpg'),
          // ),
          Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text('Hola paisaje bonito')
          )
        ],
      ),
    );

    return Container(
        decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.red,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, -10.0 )
            )
          ]
      ),
       child: ClipRRect(
        borderRadius:  BorderRadius.circular(30.0),
          child: card
      ),
    );
 }

// forma alumno
  Widget _cardTipo3() {
    return Card(
      elevation: 10.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
          child: Column(children: <Widget>[
            const FadeInImage(
                image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/000/246/312/original/mountain-lake-sunset-landscape-first-person-view-vector.jpg'),
                placeholder: AssetImage('assets/jar-loading.gif'),
                fadeInDuration: Duration(milliseconds: 200),
                height: 300.0,
                width: 400,
                fit: BoxFit.cover),
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Algo que se me acaba de ocurrir'))
          ])),
    );
  }

}