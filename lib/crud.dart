import 'package:sqflite/sqlite_api.dart';
import 'class_penangkap.dart';
import 'access_database.dart';

class CRUD {
  static const todoTable = 'contact';
  static const id = 'id';
  static const date = 'date';
  static const detail = 'detail';
  static const location = 'location';
  static const status = 'status';
  static const remark = 'remark';
  AccessDatabase dbHelper = new AccessDatabase();


  Future<int> insert(ClassPenangkap todo) async {
    Database db = await dbHelper.initDb();
    final sql = '''INSERT INTO ${CRUD.todoTable}
    (
      ${CRUD.date},
      ${CRUD.detail},
      ${CRUD.location},
      ${CRUD.status},
      ${CRUD.remark}
    )
    VALUES (?,?,?,?,?)''';
    List<dynamic> params = [todo.date, todo.detail, todo.location, todo.status, todo.remark];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  Future<int> update (ClassPenangkap todo) async {
    Database db = await dbHelper.initDb();
    final sql = '''UPDATE ${CRUD.todoTable}
    SET ${CRUD.date} = ?, ${CRUD.detail} = ?, ${CRUD.location} = ?, ${CRUD.status} = ?, ${CRUD.remark} = ?
    WHERE ${CRUD.id} = ?
    ''';
    List<dynamic> params = [todo.date, todo.detail, todo.location, todo.status, todo.remark, todo.id];
    final result = await db.rawUpdate(sql, params);
    return result;

  }

  Future<int> delete(ClassPenangkap todo) async {
    Database db = await dbHelper.initDb();
    final sql = '''DELETE FROM ${CRUD.todoTable}
    WHERE ${CRUD.id} = ?
    ''';

    List<dynamic> params = [todo.id];
    final result = await db.rawDelete(sql,params);
    return result;
  }

  Future<List<ClassPenangkap>> getContactList() async {
    Database db = await dbHelper.initDb();
    final sql = '''SELECT * FROM ${CRUD.todoTable} ''';
    final data = await db.rawQuery(sql);
    List<ClassPenangkap> todos = List();

    for (final node in data) {
      final todo = ClassPenangkap.fromMap(node);
      todos.add(todo);
    }

    return todos;

  }

}
