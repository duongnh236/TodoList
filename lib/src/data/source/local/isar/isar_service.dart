import 'dart:developer';
import 'package:fluttertemplate/src/data/source/local/isar/isar+sentry/sentry_isar.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  ISentrySpan getSentrySpan(String nameSpan) {
    final tr = Sentry.startTransaction(
      nameSpan,
      'db',
      bindToScope: true,
    );
    return tr;
  }

  Future<List<T?>> getAll<T>() async {
    final tr = getSentrySpan('getAll');
    try {
      final isar = await db;

      final List<T?> ids = await isar.collection<T>().where().findAll();
      tr.finish(status: const SpanStatus.ok());
      return ids;
    } catch (e) {
      Sentry.captureException(e);
      log('getAll error $e');
    }
    return [];
  }

  Future<T?> getItem<T>(int id) async {
    final tr = getSentrySpan('getItem');
    try {
      final isar = await db;
      final T? _id = await isar.collection<T>().get(id);
      tr.finish(status: const SpanStatus.ok());
      return _id;
    } catch (e) {
      Sentry.captureException(e);
      log('getItem error $e');
    }
    return null;
  }

  Future<T?> getItemAsync<T>(int id) async {
    final tr = getSentrySpan('getItemAsync');
    try {
      final isar = await db;
      final T? _id = isar.collection<T>().getSync(id);
      tr.finish(status: const SpanStatus.ok());
      return _id;
    } catch (e) {
      Sentry.captureException(e);
      log('getItemAsync error $e');
    }
    return null;
  }

  Future<void> saveSync<T>(T item) async {
    final tr = getSentrySpan('saveSync');
    try {
      final isar = await db;
      isar.writeTxnSync(() => isar.collection<T>().putSync(item));
      tr.finish(status: const SpanStatus.ok());
    } catch (e) {
      Sentry.captureException(e);
      log('saveSync error $e');
    }
  }

  Future<void> save<T>(T item) async {
    final tr = getSentrySpan('save');

    try {
      final isar = await db;
      isar.writeTxn(() => isar.collection<T>().put(item));
      tr.finish(status: const SpanStatus.ok());
    } catch (e) {
      Sentry.captureException(e);
      log('save error $e');
    }
  }

  Future<void> saveList<T>(List<T> item) async {
    final tr = getSentrySpan('saveList');

    try {
      final isar = await db;
      await isar.writeTxn(() async {
        await isar.collection<T>().putAll(item);
        tr.finish(status: const SpanStatus.ok());
      });
    } catch (e) {
      Sentry.captureException(e);
      log('saveList error $e');
    }
  }

  Future<void> cleanDb() async {
    final tr = getSentrySpan('cleanDb');
    try {
      final isar = await db;
      await isar.writeTxn(() => isar.clear());
      tr.finish(status: const SpanStatus.ok());
    } catch (e) {
      Sentry.captureException(e);
      log('cleanDb error $e');
    }
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final tr = Sentry.startTransaction('openIsar', 'db', bindToScope: true);
      final dir = await getApplicationDocumentsDirectory();
      final isar = await SentryIsar.open([TodoIsarSchema], directory: dir.path);
      await tr.finish(status: const SpanStatus.ok());
      return isar;
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> delete<T>(int? id) async {
    final tr = getSentrySpan('cleanDb');
    try {
      final isar = await db;
      await isar.writeTxn(() async {
        final success = await isar.collection<T>().delete(id ?? 0);
        log('Delete $success $id');
        tr.finish(status: const SpanStatus.ok());
      });
    } catch (e) {
      Sentry.captureException(e);
      log('delete error $e');
    }
  }

  Future<void> deleteAll<T>(List<int> ids) async {
    final tr = getSentrySpan('cleanDb');

    try {
      final isar = await db;
      await isar.writeTxn(() async {
        final success = await isar.collection<T>().deleteAll(ids);
        log('Delete all $success $ids');
        tr.finish(status: const SpanStatus.ok());
      });
    } catch (e) {
      Sentry.captureException(e);
      log('deleteAll error $e');
    }
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
