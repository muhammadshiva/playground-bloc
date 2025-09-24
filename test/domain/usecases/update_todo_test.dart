import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:playground_bloc/features/todo/domain/entities/todo.dart';
import 'package:playground_bloc/features/todo/domain/repositories/todo_repository.dart';
import 'package:playground_bloc/features/todo/domain/usecases/update_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late UpdateTodo useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = UpdateTodo(mockRepository);
  });

  group('UpdateTodo', () {
    final testTodo = Todo(
      id: 1,
      title: 'Test Todo',
      description: 'Test Description',
      isCompleted: false,
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 1),
    );

    test('should update a todo successfully', () async {
      // Arrange
      when(mockRepository.updateTodo(any)).thenAnswer((_) async => Right(testTodo));

      // Act
      final result = await useCase(testTodo);

      // Assert
      expect(result, Right(testTodo));
      verify(mockRepository.updateTodo(any));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure when repository fails', () async {
      // Arrange
      const failureMessage = 'Failed to update todo';
      when(mockRepository.updateTodo(any)).thenAnswer((_) async => const Left(failureMessage));

      // Act
      final result = await useCase(testTodo);

      // Assert
      expect(result, const Left(failureMessage));
      verify(mockRepository.updateTodo(any));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should update todo with current timestamp', () async {
      // Arrange
      final beforeCall = DateTime.now();
      when(mockRepository.updateTodo(any)).thenAnswer((_) async => Right(testTodo));

      // Act
      await useCase(testTodo);
      final afterCall = DateTime.now();

      // Assert
      verify(mockRepository.updateTodo(any));
      final capturedTodo = verify(mockRepository.updateTodo(captureAny)).captured.first as Todo;
      expect(capturedTodo.id, testTodo.id);
      expect(capturedTodo.title, testTodo.title);
      expect(capturedTodo.description, testTodo.description);
      expect(capturedTodo.isCompleted, testTodo.isCompleted);
      expect(capturedTodo.createdAt, testTodo.createdAt);
      expect(capturedTodo.updatedAt.isAfter(beforeCall), true);
      expect(capturedTodo.updatedAt.isBefore(afterCall), true);
    });
  });
}
