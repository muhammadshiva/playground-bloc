import 'package:dartz/dartz.dart';
import '../entities/todo.dart';

abstract class TodoRepository {
  Future<Either<String, List<Todo>>> getAllTodos();
  Future<Either<String, Todo>> getTodoById(int id);
  Future<Either<String, Todo>> createTodo(Todo todo);
  Future<Either<String, Todo>> updateTodo(Todo todo);
  Future<Either<String, void>> deleteTodo(int id);
  Future<Either<String, List<Todo>>> getCompletedTodos();
  Future<Either<String, List<Todo>>> getPendingTodos();
}
