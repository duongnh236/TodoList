import 'package:fluttertemplate/src/core/exception/exception.dart';
import 'package:fluttertemplate/src/core/helper/failure.dart';
import 'package:fluttertemplate/src/data/source/local/isar/isar_service.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import 'package:fluttertemplate/src/data/source/remote/home_service.dart';
import 'package:fluttertemplate/src/domain/entities/activity_entity.dart';
import 'package:fluttertemplate/src/domain/repositories/home_repository/home_repository.dart';
import 'package:fpdart/src/either.dart';
import '../source/local/hive/hive_datasource.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this.hiveDataSource, this.homeService, this.isarService);
  final HiveDataSource hiveDataSource;
  final HomeService homeService;
  final IsarService isarService;
  @override
  Future<List<TodoIsar>> getTodoItemsLocal() async {
    final List<TodoIsar> todoItems = await isarService.getAll<TodoIsar>();
    final List<TodoIsar> todoEntities = todoItems.map((e) => TodoIsar(name: e.name, isChecked: e.isChecked)).toList();
    return todoEntities;
  }

  @override
  Future<bool> saveTodoItemsLocal(List<TodoIsar> items) async  {
    final List<TodoIsar> _items = items.map((e) => TodoIsar()..isChecked = e.isChecked
                                                                        ..name = e.name).toList();
    await isarService.saveList<TodoIsar>(_items);
    return Future.value(true);
  }

  @override
  Future<bool> isHasData() async {
    return await isarService.hasData<TodoIsar>();
  }

  @override
  Future<Either<Failure, Activity>> testApi() async {
    try {
      final data = await homeService.testApi();
      return Either.right(data);
    } on RestApiException catch (e) {
      return Either.left(ConnectionFailure(e.status ?? 0, e.message ?? '', e.typeEx ?? ''));
    } catch (e) {
      return Either.left(const ParsingFailure(400,'',''));
    }
  }
  

  //https://www.boredapi.com/api/activity

}