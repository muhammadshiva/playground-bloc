import 'package:dartz/dartz.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class CreateTodo {
  final TodoRepository repository;

  CreateTodo(this.repository);

  Future<Either<String, Todo>> call({required String title, required String description}) async {
    final now = DateTime.now();
    final todo = Todo(title: title, description: description, createdAt: now, updatedAt: now);
    return await repository.createTodo(todo);
  }
}
