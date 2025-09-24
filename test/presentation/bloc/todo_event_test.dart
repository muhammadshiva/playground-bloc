import 'package:flutter_test/flutter_test.dart';
import 'package:playground_bloc/features/todo/domain/entities/todo.dart';
import 'package:playground_bloc/features/todo/presentation/bloc/todo_event.dart';

void main() {
  group('TodoEvent', () {
    group('LoadTodos', () {
      test('should be a TodoEvent', () {
        expect(const TodoEvent.loadTodos(), isA<TodoEvent>());
      });

      test('should support equality', () {
        expect(const TodoEvent.loadTodos(), equals(const TodoEvent.loadTodos()));
      });
    });

    group('CreateTodo', () {
      const testTitle = 'Test Todo';
      const testDescription = 'Test Description';

      test('should be a TodoEvent', () {
        expect(
          const TodoEvent.createTodo(title: testTitle, description: testDescription),
          isA<TodoEvent>(),
        );
      });

      test('should support equality', () {
        const event1 = TodoEvent.createTodo(title: testTitle, description: testDescription);
        const event2 = TodoEvent.createTodo(title: testTitle, description: testDescription);
        const event3 = TodoEvent.createTodo(title: 'Different', description: testDescription);

        expect(event1, equals(event2));
        expect(event1, isNot(equals(event3)));
      });
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

      test('should be a TodoEvent', () {
        expect(TodoEvent.updateTodo(testTodo), isA<TodoEvent>());
      });

      test('should support equality', () {
        final event1 = TodoEvent.updateTodo(testTodo);
        final event2 = TodoEvent.updateTodo(testTodo);
        final differentTodo = testTodo.copyWith(title: 'Different');
        final event3 = TodoEvent.updateTodo(differentTodo);

        expect(event1, equals(event2));
        expect(event1, isNot(equals(event3)));
      });
    });

    group('DeleteTodo', () {
      const testId = 1;

      test('should be a TodoEvent', () {
        expect(const TodoEvent.deleteTodo(testId), isA<TodoEvent>());
      });

      test('should support equality', () {
        const event1 = TodoEvent.deleteTodo(testId);
        const event2 = TodoEvent.deleteTodo(testId);
        const event3 = TodoEvent.deleteTodo(2);

        expect(event1, equals(event2));
        expect(event1, isNot(equals(event3)));
      });
    });

    group('ToggleTodoCompletion', () {
      final testTodo = Todo(
        id: 1,
        title: 'Test Todo',
        description: 'Test Description',
        isCompleted: false,
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
      );

      test('should be a TodoEvent', () {
        expect(TodoEvent.toggleTodoCompletion(testTodo), isA<TodoEvent>());
      });

      test('should support equality', () {
        final event1 = TodoEvent.toggleTodoCompletion(testTodo);
        final event2 = TodoEvent.toggleTodoCompletion(testTodo);
        final differentTodo = testTodo.copyWith(title: 'Different');
        final event3 = TodoEvent.toggleTodoCompletion(differentTodo);

        expect(event1, equals(event2));
        expect(event1, isNot(equals(event3)));
      });
    });
  });
}
