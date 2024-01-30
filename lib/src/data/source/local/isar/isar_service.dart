import 'dart:developer';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';


class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }


  

 Future<List<T>> getAll<T>() async {
    final  isar = await db;
    return isar.collection<T>().where().findAll();
  }

  Future<T?> getItem<T>(int id) async {
    final isar = await db;
    return await isar.collection<T>().get(id);
  }

  Future<T?> getItemAsync<T>(int id) async {
    final isar = await db;
    return  isar.collection<T>().getSync(id);
  }

  Future<void> saveSync<T>(T item) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.collection<T>().putSync(item));
  }

  Future<void> save<T>(T item) async {
    final isar = await db;
    isar.writeTxn(() => isar.collection<T>().put(item));
  }

   Future<void> saveList<T>(List<T> item) async {
    final isar = await db;
   await isar.writeTxn(() async {
      await isar.collection<T>().putAll(item);
    });
  }

 Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([TodoIsarSchema], directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> delete<T>(int? id) async {
      final isar = await db;
      await isar.writeTxn(() async {
          final success = await isar.collection<T>().delete(id ?? 0);

          log('Delete $success $id');
      });
  }

  Future<void> deleteAll<T>(List<int> ids) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final success = await isar.collection<T>().deleteAll(ids);
      log('Delete all $success $ids');
    });
  }

Future<bool> hasData<T>() async {
    try {
      final itemsIsar = await getAll<T>();
      return itemsIsar.isNotEmpty;
    } catch (error) {
      rethrow;
    }

  }

//===================================>

// Future<void> saveCourse(Course newCourse) async {
//     final isar = await db;
//     isar.writeTxnSync<int>(() => isar.courses.putSync(newCourse));
//   }

//   Future<void> saveStudent(Student newStudent) async {
//     final isar = await db;
//     isar.writeTxnSync<int>(() => isar.students.putSync(newStudent));
//   }

//   Future<void> saveTeacher(Teacher newTeacher) async {
//     final isar = await db;
//     isar.writeTxnSync<int>(() => isar.teachers.putSync(newTeacher));
//   }
//   Future<List<Course>> getAllCourses() async {
//     final isar = await db;
//     return await isar.courses.where().findAll();
//   }

 

//   Stream<List<Course>> listenToCourses() async* {
//     final isar = await db;
//     yield* isar.courses.where().watch();
//   }

 

//   Future<List<Student>> getStudentsFor(Course course) async {
//     final isar = await db;
//     return await isar.students
//         .filter()
//         .courses((q) => q.idEqualTo(course.id))
//         .findAll();
//   }

//   Future<Teacher?> getTeacherFor(Course course) async {
//     final isar = await db;

//     final teacher = await isar.teachers
//         .filter()
//         .course((q) => q.idEqualTo(course.id))
//         .findFirst();

//     return teacher;
//   }

}