import 'package:flutter/material.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:qr_scanner/src/pages/direcciones_page.dart';
import 'package:qr_scanner/src/pages/mapas_page.dart';
import 'package:barcode_scan/barcode_scan.dart';
<<<<<<< HEAD
=======
import 'package:qr_scanner/src/providers/db_provider.dart';

>>>>>>> af00403122c7b19df6f672b2f2be9a5471476535

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
<<<<<<< HEAD
        child: Icon(Icons.filter_center_focus),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: printScan,
=======
        child: Icon(Icons.camera),
        onPressed: _scanQr,
>>>>>>> af00403122c7b19df6f672b2f2be9a5471476535
      ),
    );
  }

<<<<<<< HEAD
  void printScan() async {

  // https://www.google.com/
  // geo:40.68050676440129,-74.0045680089844
=======
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
>>>>>>> af00403122c7b19df6f672b2f2be9a5471476535

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
<<<<<<< HEAD
}
=======
} 
>>>>>>> af00403122c7b19df6f672b2f2be9a5471476535
