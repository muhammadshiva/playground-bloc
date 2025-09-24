import 'package:dartz/dartz.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<Either<String, Todo>> call(Todo todo) async {
    final updatedTodo = todo.copyWith(updatedAt: DateTime.now());
    return await repository.updateTodo(updatedTodo);
  }
}
