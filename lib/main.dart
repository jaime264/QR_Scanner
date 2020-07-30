import 'package:flutter/material.dart';
import 'package:qr_scanner/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/' : (BuildContext context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent
      )
    );
  }
}