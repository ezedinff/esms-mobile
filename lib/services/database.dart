import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:esms/services/services.dart';

class MyDatabase {
  static final String dbName = 'esms';

  MyDatabase._privateConstructor();

  static final MyDatabase instance = MyDatabase._privateConstructor();

  getConnection() async {
    return openDatabase(
        join(await getDatabasesPath(), '${MyDatabase.dbName}.db'),
        onCreate: (db, version) => db.execute(''),
        version: 1);
  }
}

class Table<T> {
  final MyDatabase _db = MyDatabase.instance;
  final String table;

  Table({this.table});

  Future<void> create(Map values) async {
    Database conn = await _db.getConnection();
    return conn.insert(table, values);
  }

  Future<List<T>> getList() async {
    Database conn = await _db.getConnection();
    final List<Map<String, dynamic>> maps = await conn.query(table);
    return maps.map((doc) => Global.models[T](doc) as T).toList();
  }

  Future<void> update(Map values) async {
    Database conn = await _db.getConnection();
    return conn.update(
      table,
      values,
      where: "id = ?",
      whereArgs: [values['id']],
    );
  }

  Future<void> delete(Map values) async {
    Database conn = await _db.getConnection();
    return conn.delete(table,  where: "id = ?",  whereArgs: [values['id']]);
  }
}
