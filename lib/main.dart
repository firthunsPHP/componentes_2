import 'package:componentes_2/src/pages/alert_page.dart';
import 'package:componentes_2/src/pages/avatar_page.dart';
import 'package:componentes_2/src/pages/card_page.dart';
import 'package:componentes_2/src/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daw Flutter',
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
        '/':(BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
      'avatar': (BuildContext context) => AvatarPage(),
      'card': (BuildContext context) => CardPage(),
    },
    );
  }
}
