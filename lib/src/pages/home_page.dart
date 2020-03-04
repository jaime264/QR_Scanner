import 'package:flutter/material.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:qr_scanner/src/pages/direcciones_page.dart';
import 'package:qr_scanner/src/pages/mapas_page.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_scanner/src/providers/db_provider.dart';


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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: _scanQr,
      ),
    );
  }

  void _scanQr() async{

    //https://www.facebook.com/
    //geo:40.71278370000001,-73.97572889765628


    String value = 'https://www.facebook.com/';

    // try{
    // value = await BarcodeScanner.scan();
    // }catch(e){
    //   value = e.toString();
    // }

    if (value != null) {
      final scan = new ScanModel(valor: value);
      DBProvider.db.nuevoScan(scan);

       print(value);
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
