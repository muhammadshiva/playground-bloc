import 'package:dartz/dartz.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/database_helper.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final DatabaseHelper databaseHelper;

  TodoRepositoryImpl(this.databaseHelper);

  @override
  Future<Either<String, List<Todo>>> getAllTodos() async {
    try {
      final db = await databaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query('todos', orderBy: 'createdAt DESC');

      final todos = maps.map((map) => TodoModel.fromMap(map).toEntity()).toList();
      return Right(todos);
    } catch (e) {
      return Left('Failed to get todos: $e');
    }
  }

  @override
  Future<Either<String, Todo>> getTodoById(int id) async {
    try {
      final db = await databaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'todos',
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isEmpty) {
        return Left('Todo not found');
      }

      final todo = TodoModel.fromMap(maps.first).toEntity();
      return Right(todo);
    } catch (e) {
      return Left('Failed to get todo: $e');
    }
  }

  @override
  Future<Either<String, Todo>> createTodo(Todo todo) async {
    try {
      final db = await databaseHelper.database;
      final todoModel = TodoModel.fromEntity(todo);
      final id = await db.insert('todos', todoModel.toMap());

      final createdTodo = todo.copyWith(id: id);
      return Right(createdTodo);
    } catch (e) {
      return Left('Failed to create todo: $e');
    }
  }

  @override
  Future<Either<String, Todo>> updateTodo(Todo todo) async {
    try {
      final db = await databaseHelper.database;
      final todoModel = TodoModel.fromEntity(todo);

      await db.update('todos', todoModel.toMap(), where: 'id = ?', whereArgs: [todo.id]);

      return Right(todo);
    } catch (e) {
      return Left('Failed to update todo: $e');
    }
  }

  @override
  Future<Either<String, void>> deleteTodo(int id) async {
    try {
      final db = await databaseHelper.database;
      await db.delete('todos', where: 'id = ?', whereArgs: [id]);

      return const Right(null);
    } catch (e) {
      return Left('Failed to delete todo: $e');
    }
  }

  @override
  Future<Either<String, List<Todo>>> getCompletedTodos() async {
    try {
      final db = await databaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'todos',
        where: 'isCompleted = ?',
        whereArgs: [1],
        orderBy: 'createdAt DESC',
      );

      final todos = maps.map((map) => TodoModel.fromMap(map).toEntity()).toList();
      return Right(todos);
    } catch (e) {
      return Left('Failed to get completed todos: $e');
    }
  }

  @override
  Future<Either<String, List<Todo>>> getPendingTodos() async {
    try {
      final db = await databaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'todos',
        where: 'isCompleted = ?',
        whereArgs: [0],
        orderBy: 'createdAt DESC',
      );

      final todos = maps.map((map) => TodoModel.fromMap(map).toEntity()).toList();
      return Right(todos);
    } catch (e) {
      return Left('Failed to get pending todos: $e');
    }
  }
}
