import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:playground_bloc/features/todo/domain/entities/todo.dart';
import 'package:playground_bloc/features/todo/domain/repositories/todo_repository.dart';
import 'package:playground_bloc/features/todo/domain/usecases/get_all_todos.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late GetAllTodos useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = GetAllTodos(mockRepository);
  });

  group('GetAllTodos', () {
    final testTodos = [
      Todo(
        id: 1,
        title: 'Test Todo 1',
        description: 'Test Description 1',
        isCompleted: false,
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
      ),
      Todo(
        id: 2,
        title: 'Test Todo 2',
        description: 'Test Description 2',
        isCompleted: true,
        createdAt: DateTime(2024, 1, 2),
        updatedAt: DateTime(2024, 1, 2),
      ),
    ];

    test('should get all todos from the repository', () async {
      // Arrange
      when(mockRepository.getAllTodos()).thenAnswer((_) async => Right(testTodos));

      // Act
      final result = await useCase();

      // Assert
      expect(result, Right(testTodos));
      verify(mockRepository.getAllTodos());
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure when repository fails', () async {
      // Arrange
      const failureMessage = 'Failed to get todos';
      when(mockRepository.getAllTodos()).thenAnswer((_) async => const Left(failureMessage));

      // Act
      final result = await useCase();

      // Assert
      expect(result, const Left(failureMessage));
      verify(mockRepository.getAllTodos());
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return empty list when no todos exist', () async {
      // Arrange
      when(mockRepository.getAllTodos()).thenAnswer((_) async => const Right([]));

      // Act
      final result = await useCase();

      // Assert
      expect(result, const Right([]));
      verify(mockRepository.getAllTodos());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
