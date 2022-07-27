

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/src/data/source/local/local_datasource.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_item.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';

import 'local_datasource_test.mocks.dart';

class MockHive extends Mock implements HiveInterface {}

@GenerateMocks([MockHive])
void main() {
  late MockMockHive mockHive;
  late LocalDataSource localDataSource;

 setUp(() {
   mockHive = MockMockHive();
   localDataSource = LocalDataSource(mockHive);
   localDataSource.initialize();
 });

  tearDown(() {
    mockHive.close();
  });

  group('', () {


    expect(mockHive.isBoxOpen, true);
  });
}