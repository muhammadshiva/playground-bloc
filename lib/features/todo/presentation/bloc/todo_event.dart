import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/todo.dart';

part 'todo_event.freezed.dart';

@freezed
sealed class TodoEvent with _$TodoEvent {
  const factory TodoEvent.loadTodos() = LoadTodos;
  const factory TodoEvent.createTodo({required String title, required String description}) =
      CreateTodo;
  const factory TodoEvent.updateTodo(Todo todo) = UpdateTodo;
  const factory TodoEvent.deleteTodo(int id) = DeleteTodo;
  const factory TodoEvent.toggleTodoCompletion(Todo todo) = ToggleTodoCompletion;
}
