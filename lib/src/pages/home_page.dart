import 'package:flutter/material.dart';
import 'package:qr_scanner/src/pages/direcciones_page.dart';
import 'package:qr_scanner/src/pages/mapas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _seleccionarPage(currentIndex),
      bottomNavigationBar: _crearBotonNavigationBar(),
    );
  }

  Widget _crearBotonNavigationBar() {

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
        currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapa')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Direcciones')
        ),
      ]
      );

  }

  Widget _seleccionarPage(int index) {

    switch (index) {
      case 0: return MapasPage();
      case 1: return DireccionesPage();
        break;
      default: return MapasPage();
    }

  }
}