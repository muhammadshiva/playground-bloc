import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/todo.dart';

part 'todo_state.freezed.dart';

@freezed
sealed class TodoState with _$TodoState {
  const factory TodoState.initial() = TodoInitial;
  const factory TodoState.loading() = TodoLoading;
  const factory TodoState.loaded(List<Todo> todos) = TodoLoaded;
  const factory TodoState.error(String message) = TodoError;
  const factory TodoState.success(String message) = TodoSuccess;
}
