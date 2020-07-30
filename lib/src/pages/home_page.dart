import 'package:flutter/material.dart';
import 'package:qr_scanner/src/pages/direcciones_page.dart';
import 'package:qr_scanner/src/pages/mapas_page.dart';
import 'package:barcode_scan/barcode_scan.dart';

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
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          )
        ],
      ),
      body: _seleccionarPage(currentIndex),
      bottomNavigationBar: _crearBotonNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: printScan,
      ),
    );
  }

  void printScan() async {

  // https://www.google.com/
  // geo:40.68050676440129,-74.0045680089844

    String value;
    try {
      value = await BarcodeScanner.scan();
      print(value);
    } catch (e) {
      print(e);
    }
  }

  Widget _crearBotonNavigationBar() {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapa')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Direcciones')),
        ]);
  }

  Widget _seleccionarPage(int index) {
    switch (index) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
        break;
      default:
        return MapasPage();
    }
  }
}
