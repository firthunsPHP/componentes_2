import 'package:componentes_2/src/pages/alert_page.dart';
import 'package:componentes_2/src/pages/avatar_page.dart';
import 'package:componentes_2/src/pages/card_page.dart';
import 'package:componentes_2/src/pages/home_page.dart';
import 'package:componentes_2/src/pages/input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daw Flutter',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('es', ''), // Spanish, no country code
      ],
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
        'card': (BuildContext context) => CardPage(),
        'inputs': (BuildContext context) => InputPage()
      },
      // captura el nombre de la ruta y si no esta definido ,
      onGenerateRoute: ( RouteSettings settings ){

        print( 'Ruta llamda: ${ settings.name }' );

        return MaterialPageRoute(
            builder: ( BuildContext context ) => AlertPage()
        );


      },
    );
  }
}
