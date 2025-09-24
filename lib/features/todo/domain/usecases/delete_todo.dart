import 'package:dartz/dartz.dart';
import '../repositories/todo_repository.dart';

class DeleteTodo {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  Future<Either<String, void>> call(int id) async {
    return await repository.deleteTodo(id);
  }
}
