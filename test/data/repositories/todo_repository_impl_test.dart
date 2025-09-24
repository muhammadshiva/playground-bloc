import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:playground_bloc/features/todo/data/datasources/database_helper.dart';
import 'package:playground_bloc/features/todo/data/models/todo_model.dart';
import 'package:playground_bloc/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:playground_bloc/features/todo/domain/entities/todo.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

class MockDatabase extends Mock implements Database {}

void main() {
  late TodoRepositoryImpl repository;
  late MockDatabaseHelper mockDatabaseHelper;
  late MockDatabase mockDatabase;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    mockDatabase = MockDatabase();
    repository = TodoRepositoryImpl(mockDatabaseHelper);
  });

  group('TodoRepositoryImpl', () {
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

    final testTodoMaps = [
      {
        'id': 1,
        'title': 'Test Todo 1',
        'description': 'Test Description 1',
        'isCompleted': 0,
        'createdAt': '2024-01-01T00:00:00.000',
        'updatedAt': '2024-01-01T00:00:00.000',
      },
      {
        'id': 2,
        'title': 'Test Todo 2',
        'description': 'Test Description 2',
        'isCompleted': 1,
        'createdAt': '2024-01-02T00:00:00.000',
        'updatedAt': '2024-01-02T00:00:00.000',
      },
    ];

    group('getAllTodos', () {
      test('should return todos when database query succeeds', () async {
        // Arrange
        when(mockDatabaseHelper.database).thenAnswer((_) async => mockDatabase);
        when(
          mockDatabase.query('todos', orderBy: 'createdAt DESC'),
        ).thenAnswer((_) async => testTodoMaps);

        // Act
        final result = await repository.getAllTodos();

        // Assert
        expect(result, isA<Right<String, List<Todo>>>());
        result.fold((failure) => fail('Expected success but got failure: $failure'), (todos) {
          expect(todos.length, 2);
          expect(todos[0].id, 1);
          expect(todos[0].title, 'Test Todo 1');
          expect(todos[1].id, 2);
          expect(todos[1].title, 'Test Todo 2');
        });
        verify(mockDatabaseHelper.database);
        verify(mockDatabase.query('todos', orderBy: 'createdAt DESC'));
      });

      test('should return failure when database query fails', () async {
        // Arrange
        when(mockDatabaseHelper.database).thenAnswer((_) async => mockDatabase);
        when(
          mockDatabase.query('todos', orderBy: 'createdAt DESC'),
        ).thenThrow(Exception('Database error'));

        // Act
        final result = await repository.getAllTodos();

        // Assert
        expect(result, isA<Left<String, List<Todo>>>());
        result.fold(
          (failure) => expect(failure, contains('Failed to get todos')),
          (todos) => fail('Expected failure but got success'),
        );
      });
    });

    group('getTodoById', () {
      test('should return todo when found', () async {
        // Arrange
        const testId = 1;
        when(mockDatabaseHelper.database).thenAnswer((_) async => mockDatabase);
        when(
          mockDatabase.query('todos', where: 'id = ?', whereArgs: [testId]),
        ).thenAnswer((_) async => [testTodoMaps[0]]);

        // Act
        final result = await repository.getTodoById(testId);

        // Assert
        expect(result, isA<Right<String, Todo>>());
        result.fold((failure) => fail('Expected success but got failure: $failure'), (todo) {
          expect(todo.id, 1);
          expect(todo.title, 'Test Todo 1');
        });
      });

      test('should return failure when todo not found', () async {
        // Arrange
        const testId = 999;
        when(mockDatabaseHelper.database).thenAnswer((_) async => mockDatabase);
        when(
          mockDatabase.query('todos', where: 'id = ?', whereArgs: [testId]),
        ).thenAnswer((_) async => []);

        // Act
        final result = await repository.getTodoById(testId);

        // Assert
        expect(result, isA<Left<String, Todo>>());
        result.fold(
          (failure) => expect(failure, 'Todo not found'),
          (todo) => fail('Expected failure but got success'),
        );
      });
    });

    group('createTodo', () {
      test('should create todo successfully', () async {
        // Arrange
        final testTodo = testTodos[0];
        when(mockDatabaseHelper.database).thenAnswer((_) async => mockDatabase);
        when(mockDatabase.insert('todos', any)).thenAnswer((_) async => 1);

        // Act
        final result = await repository.createTodo(testTodo);

        // Assert
        expect(result, isA<Right<String, Todo>>());
        result.fold((failure) => fail('Expected success but got failure: $failure'), (todo) {
          expect(todo.id, 1);
          expect(todo.title, testTodo.title);
        });
        verify(mockDatabase.insert('todos', any));
      });

      test('should return failure when database insert fails', () async {
        // Arrange
        final testTodo = testTodos[0];
        when(mockDatabaseHelper.database).thenAnswer((_) async => mockDatabase);
        when(mockDatabase.insert('todos', any)).thenThrow(Exception('Insert error'));

        // Act
        final result = await repository.createTodo(testTodo);

        // Assert
        expect(result, isA<Left<String, Todo>>());
        result.fold(
          (failure) => expect(failure, contains('Failed to create todo')),
          (todo) => fail('Expected failure but got success'),
        );
      });
    });

    group('updateTodo', () {
      test('should update todo successfully', () async {
        // Arrange
        final testTodo = testTodos[0];
        when(mockDatabaseHelper.database).thenAnswer((_) async => mockDatabase);
        when(
          mockDatabase.update('todos', any, where: 'id = ?', whereArgs: [testTodo.id]),
        ).thenAnswer((_) async => 1);

        // Act
        final result = await repository.updateTodo(testTodo);

        // Assert
        expect(result, isA<Right<String, Todo>>());
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (todo) => expect(todo, testTodo),
        );
        verify(mockDatabase.update('todos', any, where: 'id = ?', whereArgs: [testTodo.id]));
      });
    });

    group('deleteTodo', () {
      test('should delete todo successfully', () async {
        // Arrange
        const testId = 1;
        when(mockDatabaseHelper.database).thenAnswer((_) async => mockDatabase);
        when(
          mockDatabase.delete('todos', where: 'id = ?', whereArgs: [testId]),
        ).thenAnswer((_) async => 1);

        // Act
        final result = await repository.deleteTodo(testId);

        // Assert
        expect(result, isA<Right<String, void>>());
        verify(mockDatabase.delete('todos', where: 'id = ?', whereArgs: [testId]));
      });
    });

    group('getCompletedTodos', () {
      test('should return completed todos', () async {
        // Arrange
        when(mockDatabaseHelper.database).thenAnswer((_) async => mockDatabase);
        when(
          mockDatabase.query(
            'todos',
            where: 'isCompleted = ?',
            whereArgs: [1],
            orderBy: 'createdAt DESC',
          ),
        ).thenAnswer((_) async => [testTodoMaps[1]]);

        // Act
        final result = await repository.getCompletedTodos();

        // Assert
        expect(result, isA<Right<String, List<Todo>>>());
        result.fold((failure) => fail('Expected success but got failure: $failure'), (todos) {
          expect(todos.length, 1);
          expect(todos[0].isCompleted, true);
        });
      });
    });

    group('getPendingTodos', () {
      test('should return pending todos', () async {
        // Arrange
        when(mockDatabaseHelper.database).thenAnswer((_) async => mockDatabase);
        when(
          mockDatabase.query(
            'todos',
            where: 'isCompleted = ?',
            whereArgs: [0],
            orderBy: 'createdAt DESC',
          ),
        ).thenAnswer((_) async => [testTodoMaps[0]]);

        // Act
        final result = await repository.getPendingTodos();

        // Assert
        expect(result, isA<Right<String, List<Todo>>>());
        result.fold((failure) => fail('Expected success but got failure: $failure'), (todos) {
          expect(todos.length, 1);
          expect(todos[0].isCompleted, false);
        });
      });
    });
  });
}
