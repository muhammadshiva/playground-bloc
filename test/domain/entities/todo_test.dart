import 'package:flutter_test/flutter_test.dart';
import 'package:playground_bloc/features/todo/domain/entities/todo.dart';

void main() {
  group('Todo Entity', () {
    const testId = 1;
    const testTitle = 'Test Todo';
    const testDescription = 'Test Description';
    const testIsCompleted = false;
    final testCreatedAt = DateTime(2024, 1, 1);
    final testUpdatedAt = DateTime(2024, 1, 2);

    test('should create a Todo instance with all required parameters', () {
      // Arrange & Act
      final todo = Todo(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      // Assert
      expect(todo.id, testId);
      expect(todo.title, testTitle);
      expect(todo.description, testDescription);
      expect(todo.isCompleted, testIsCompleted);
      expect(todo.createdAt, testCreatedAt);
      expect(todo.updatedAt, testUpdatedAt);
    });

    test('should create a Todo instance with default values', () {
      // Arrange & Act
      final todo = Todo(
        title: testTitle,
        description: testDescription,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      // Assert
      expect(todo.id, null);
      expect(todo.title, testTitle);
      expect(todo.description, testDescription);
      expect(todo.isCompleted, false);
      expect(todo.createdAt, testCreatedAt);
      expect(todo.updatedAt, testUpdatedAt);
    });

    test('should support equality comparison', () {
      // Arrange
      final todo1 = Todo(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      final todo2 = Todo(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      final todo3 = Todo(
        id: 2,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      // Assert
      expect(todo1, equals(todo2));
      expect(todo1, isNot(equals(todo3)));
    });

    test('should support copyWith method', () {
      // Arrange
      final originalTodo = Todo(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      // Act
      final updatedTodo = originalTodo.copyWith(title: 'Updated Title', isCompleted: true);

      // Assert
      expect(updatedTodo.id, testId);
      expect(updatedTodo.title, 'Updated Title');
      expect(updatedTodo.description, testDescription);
      expect(updatedTodo.isCompleted, true);
      expect(updatedTodo.createdAt, testCreatedAt);
      expect(updatedTodo.updatedAt, testUpdatedAt);
    });

    test('should return same instance when copyWith with no parameters', () {
      // Arrange
      final originalTodo = Todo(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      // Act
      final copiedTodo = originalTodo.copyWith();

      // Assert
      expect(copiedTodo, equals(originalTodo));
    });

    test('should have correct props for equality', () {
      // Arrange
      final todo = Todo(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      // Act
      final props = todo.props;

      // Assert
      expect(props, [
        testId,
        testTitle,
        testDescription,
        testIsCompleted,
        testCreatedAt,
        testUpdatedAt,
      ]);
    });
  });
}
