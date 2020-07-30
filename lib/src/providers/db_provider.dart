import 'dart:io';

<<<<<<< HEAD
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
=======

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:path/path.dart';
>>>>>>> af00403122c7b19df6f672b2f2be9a5471476535

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

<<<<<<< HEAD
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
=======
  Future get database async {
    if (_database != null) return _database;

    _database = await iniDB();
>>>>>>> af00403122c7b19df6f672b2f2be9a5471476535

    return _database;
  }

<<<<<<< HEAD
  Future initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentDirectory.path, 'ScansDB.db');
=======
  Future iniDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'ScansDB.db');
>>>>>>> af00403122c7b19df6f672b2f2be9a5471476535

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Scans ('
<<<<<<< HEAD
          'id INTEGER PRIMARY KEY,'
          'tipo TEXT,'
          'valor TEXT'
          ')');
    });
  }
=======
          ' id INTEGER PRIMARY KEY,'
          ' tipo TEXT,'
          ' valor TEXT'
          ' )');
    });
  }

  //Crear registros BD

  Future nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;

    final res = await db.rawInsert("INSERT INTO Scans (id, tipo, valor) "
        "VALUES ( ${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}' ) ");

    return res;
  }

  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    return res;
  }

  Future<ScanModel> getScan(String id) async{
    final db = await database;
    final res = await db.query( 'Scans', where: 'id=?', whereArgs:[id] );
    
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<ScanModel> getAllScan() async{
    final db = await database;
    final res = await db.query( 'Scans' );
    
    return res.isNotEmpty ? res.map((s) =>  ScanModel.fromJson(res.first) ).toList() : [];
  }

  Future<ScanModel> getScanTipo(String tipo) async{
    final db = await database;
    final res = await db.query( 'Scans', where: 'tipo=?', whereArgs:[tipo] );
    
    return res.isNotEmpty ?  res.map((s) =>  ScanModel.fromJson(res.first) ).toList() : [];
  }

  Future deleteScan(String id) async{
    final db = await database;
    final res = await db.delete( 'Scans', where: 'id=?', whereArgs:[id] );
    
    return res.isNotEmpty ? res : null;
  }

  Future updateScan(ScanModel nuevoScan) async{
    final db = await database;
    final res = await db.update( 'Scans', nuevoScan.toJson() ,where: 'id=?', whereArgs:[nuevoScan.id] );
    
    return res.isNotEmpty ? res : null;
  }


>>>>>>> af00403122c7b19df6f672b2f2be9a5471476535
}
