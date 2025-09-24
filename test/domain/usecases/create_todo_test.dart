import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:playground_bloc/features/todo/domain/entities/todo.dart';
import 'package:playground_bloc/features/todo/domain/repositories/todo_repository.dart';
import 'package:playground_bloc/features/todo/domain/usecases/create_todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late CreateTodo useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = CreateTodo(mockRepository);
  });

  group('CreateTodo', () {
    const testTitle = 'Test Todo';
    const testDescription = 'Test Description';

    test('should create a todo successfully', () async {
      // Arrange
      final testTodo = Todo(
        id: 1,
        title: testTitle,
        description: testDescription,
        isCompleted: false,
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
      );

      when(mockRepository.createTodo(any)).thenAnswer((_) async => Right(testTodo));

      // Act
      final result = await useCase(title: testTitle, description: testDescription);

      // Assert
      expect(result, Right(testTodo));
      verify(mockRepository.createTodo(any));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure when repository fails', () async {
      // Arrange
      const failureMessage = 'Failed to create todo';
      when(mockRepository.createTodo(any)).thenAnswer((_) async => const Left(failureMessage));

      // Act
      final result = await useCase(title: testTitle, description: testDescription);

      // Assert
      expect(result, const Left(failureMessage));
      verify(mockRepository.createTodo(any));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should create todo with current timestamp', () async {
      // Arrange
      final beforeCall = DateTime.now();
      when(mockRepository.createTodo(any)).thenAnswer((_) async {
        final todo = (await mockRepository.createTodo(any)) as Right<String, Todo>;
        return Right(todo.value);
      });

      // Act
      await useCase(title: testTitle, description: testDescription);
      final afterCall = DateTime.now();

      // Assert
      verify(mockRepository.createTodo(any));
      final capturedTodo = verify(mockRepository.createTodo(captureAny)).captured.first as Todo;
      expect(capturedTodo.title, testTitle);
      expect(capturedTodo.description, testDescription);
      expect(capturedTodo.isCompleted, false);
      expect(capturedTodo.createdAt.isAfter(beforeCall), true);
      expect(capturedTodo.createdAt.isBefore(afterCall), true);
      expect(capturedTodo.updatedAt.isAfter(beforeCall), true);
      expect(capturedTodo.updatedAt.isBefore(afterCall), true);
    });
  });
}
