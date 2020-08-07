import 'package:sqflite/sqlite_api.dart';
import 'class_penangkap.dart';
import 'access_database.dart';

class CRUD {
  static const todoTable = 'contact';
  static const id = 'id';
  static const name = 'name';
  static const phone = 'phone';
  AccessDatabase dbHelper = new AccessDatabase();


  Future<int> insert(ClassPenangkap todo) async {
    Database db = await dbHelper.initDb();
    final sql = '''INSERT INTO ${CRUD.todoTable}
    (
      ${CRUD.name},
      ${CRUD.phone}
    )
    VALUES (?,?)''';
    List<dynamic> params = [todo.name, todo.phone];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  Future<int> update (ClassPenangkap todo) async {
    Database db = await dbHelper.initDb();
    final sql = '''UPDATE ${CRUD.todoTable}
    SET ${CRUD.name} = ?, ${CRUD.phone}
    WHERE ${CRUD.id} = ?
    ''';
    List<dynamic> params = [todo.name, todo.phone, todo.id];
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
