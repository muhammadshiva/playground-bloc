import 'package:dartz/dartz.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class ToggleTodoCompletion {
  final TodoRepository repository;

  ToggleTodoCompletion(this.repository);

  Future<Either<String, Todo>> call(Todo todo) async {
    final updatedTodo = todo.copyWith(isCompleted: !todo.isCompleted, updatedAt: DateTime.now());
    return await repository.updateTodo(updatedTodo);
  }
}
