import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:playground_bloc/features/todo/domain/repositories/todo_repository.dart';
import 'package:playground_bloc/features/todo/domain/usecases/delete_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late DeleteTodo useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = DeleteTodo(mockRepository);
  });

  group('DeleteTodo', () {
    const testId = 1;

    test('should delete a todo successfully', () async {
      // Arrange
      when(mockRepository.deleteTodo(testId)).thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase(testId);

      // Assert
      expect(result, const Right(null));
      verify(mockRepository.deleteTodo(testId));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure when repository fails', () async {
      // Arrange
      const failureMessage = 'Failed to delete todo';
      when(mockRepository.deleteTodo(testId)).thenAnswer((_) async => const Left(failureMessage));

      // Act
      final result = await useCase(testId);

      // Assert
      expect(result, const Left(failureMessage));
      verify(mockRepository.deleteTodo(testId));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should call repository with correct id', () async {
      // Arrange
      when(mockRepository.deleteTodo(any)).thenAnswer((_) async => const Right(null));

      // Act
      await useCase(testId);

      // Assert
      verify(mockRepository.deleteTodo(testId));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
