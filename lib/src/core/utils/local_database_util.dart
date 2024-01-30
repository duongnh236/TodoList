import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import 'package:hive/hive.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseUtil {
  static Future<void> initDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    // Hive.init(directory.path);
    await Isar.open([TodoIsarSchema], directory: directory.path);
  }

  

  ///  Register our auto generated Adapter to our Hive database
  static void registerAdapter<Type>(TypeAdapter<Type> adapter) {
    try {
      Hive.registerAdapter(adapter);
    } on HiveError catch (error) {
      debugPrint(error.toString());
    }
  }
}