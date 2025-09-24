import 'package:flutter_test/flutter_test.dart';
import 'package:playground_bloc/features/todo/data/models/todo_model.dart';
import 'package:playground_bloc/features/todo/domain/entities/todo.dart';

void main() {
  group('TodoModel', () {
    const testId = 1;
    const testTitle = 'Test Todo';
    const testDescription = 'Test Description';
    const testIsCompleted = true;
    final testCreatedAt = DateTime(2024, 1, 1);
    final testUpdatedAt = DateTime(2024, 1, 2);

    test('should create a TodoModel instance with all parameters', () {
      // Arrange & Act
      final todoModel = TodoModel(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      // Assert
      expect(todoModel.id, testId);
      expect(todoModel.title, testTitle);
      expect(todoModel.description, testDescription);
      expect(todoModel.isCompleted, testIsCompleted);
      expect(todoModel.createdAt, testCreatedAt);
      expect(todoModel.updatedAt, testUpdatedAt);
    });

    test('should create TodoModel from entity', () {
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
      final todoModel = TodoModel.fromEntity(todo);

      // Assert
      expect(todoModel.id, testId);
      expect(todoModel.title, testTitle);
      expect(todoModel.description, testDescription);
      expect(todoModel.isCompleted, testIsCompleted);
      expect(todoModel.createdAt, testCreatedAt);
      expect(todoModel.updatedAt, testUpdatedAt);
    });

    test('should create TodoModel from map', () {
      // Arrange
      final map = {
        'id': testId,
        'title': testTitle,
        'description': testDescription,
        'isCompleted': 1,
        'createdAt': testCreatedAt.toIso8601String(),
        'updatedAt': testUpdatedAt.toIso8601String(),
      };

      // Act
      final todoModel = TodoModel.fromMap(map);

      // Assert
      expect(todoModel.id, testId);
      expect(todoModel.title, testTitle);
      expect(todoModel.description, testDescription);
      expect(todoModel.isCompleted, true);
      expect(todoModel.createdAt, testCreatedAt);
      expect(todoModel.updatedAt, testUpdatedAt);
    });

    test('should create TodoModel from map with false isCompleted', () {
      // Arrange
      final map = {
        'id': testId,
        'title': testTitle,
        'description': testDescription,
        'isCompleted': 0,
        'createdAt': testCreatedAt.toIso8601String(),
        'updatedAt': testUpdatedAt.toIso8601String(),
      };

      // Act
      final todoModel = TodoModel.fromMap(map);

      // Assert
      expect(todoModel.isCompleted, false);
    });

    test('should convert to map', () {
      // Arrange
      final todoModel = TodoModel(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      // Act
      final map = todoModel.toMap();

      // Assert
      expect(map['id'], testId);
      expect(map['title'], testTitle);
      expect(map['description'], testDescription);
      expect(map['isCompleted'], 1);
      expect(map['createdAt'], testCreatedAt.toIso8601String());
      expect(map['updatedAt'], testUpdatedAt.toIso8601String());
    });

    test('should convert to entity', () {
      // Arrange
      final todoModel = TodoModel(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      // Act
      final todo = todoModel.toEntity();

      // Assert
      expect(todo.id, testId);
      expect(todo.title, testTitle);
      expect(todo.description, testDescription);
      expect(todo.isCompleted, testIsCompleted);
      expect(todo.createdAt, testCreatedAt);
      expect(todo.updatedAt, testUpdatedAt);
    });

    test('should support equality comparison', () {
      // Arrange
      final todoModel1 = TodoModel(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      final todoModel2 = TodoModel(
        id: testId,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      final todoModel3 = TodoModel(
        id: 2,
        title: testTitle,
        description: testDescription,
        isCompleted: testIsCompleted,
        createdAt: testCreatedAt,
        updatedAt: testUpdatedAt,
      );

      // Assert
      expect(todoModel1, equals(todoModel2));
      expect(todoModel1, isNot(equals(todoModel3)));
    });

    test('should handle null id in map', () {
      // Arrange
      final map = {
        'id': null,
        'title': testTitle,
        'description': testDescription,
        'isCompleted': 1,
        'createdAt': testCreatedAt.toIso8601String(),
        'updatedAt': testUpdatedAt.toIso8601String(),
      };

      // Act
      final todoModel = TodoModel.fromMap(map);

      // Assert
      expect(todoModel.id, null);
    });
  });
}
