import 'package:dartz/dartz.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

class GetAllTodos {
  final TodoRepository repository;

  GetAllTodos(this.repository);

  Future<Either<String, List<Todo>>> call() async {
    return await repository.getAllTodos();
  }
}
