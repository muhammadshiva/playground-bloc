import 'package:flutter_test/flutter_test.dart';
import 'package:playground_bloc/domain/entities/todo.dart';
import 'package:playground_bloc/presentation/bloc/todo_state.dart';

void main() {
  group('TodoState', () {
    group('TodoInitial', () {
      test('should be a TodoState', () {
        expect(const TodoState.initial(), isA<TodoState>());
      });

      test('should support equality', () {
        expect(const TodoState.initial(), equals(const TodoState.initial()));
      });
    });

    group('TodoLoading', () {
      test('should be a TodoState', () {
        expect(const TodoState.loading(), isA<TodoState>());
      });

      test('should support equality', () {
        expect(const TodoState.loading(), equals(const TodoState.loading()));
      });
    });

    group('TodoLoaded', () {
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

      test('should be a TodoState', () {
        expect(TodoState.loaded(testTodos), isA<TodoState>());
      });

      test('should support equality', () {
        final state1 = TodoState.loaded(testTodos);
        final state2 = TodoState.loaded(testTodos);
        final differentTodos = [testTodos[0]];
        final state3 = TodoState.loaded(differentTodos);

        expect(state1, equals(state2));
        expect(state1, isNot(equals(state3)));
      });

      test('should handle empty todos list', () {
        final state = TodoState.loaded([]);
        state.when(
          initial: () => fail('Should not be initial'),
          loading: () => fail('Should not be loading'),
          loaded: (todos) => expect(todos, []),
          error: (message) => fail('Should not be error'),
          success: (message) => fail('Should not be success'),
        );
      });
    });

    group('TodoError', () {
      const testMessage = 'Test Error Message';

      test('should be a TodoState', () {
        expect(const TodoState.error(testMessage), isA<TodoState>());
      });

      test('should support equality', () {
        const state1 = TodoState.error(testMessage);
        const state2 = TodoState.error(testMessage);
        const state3 = TodoState.error('Different Message');

        expect(state1, equals(state2));
        expect(state1, isNot(equals(state3)));
      });

      test('should store error message', () {
        const state = TodoState.error(testMessage);
        state.when(
          initial: () => fail('Should not be initial'),
          loading: () => fail('Should not be loading'),
          loaded: (todos) => fail('Should not be loaded'),
          error: (message) => expect(message, testMessage),
          success: (message) => fail('Should not be success'),
        );
      });
    });

    group('TodoSuccess', () {
      const testMessage = 'Test Success Message';

      test('should be a TodoState', () {
        expect(const TodoState.success(testMessage), isA<TodoState>());
      });

      test('should support equality', () {
        const state1 = TodoState.success(testMessage);
        const state2 = TodoState.success(testMessage);
        const state3 = TodoState.success('Different Message');

        expect(state1, equals(state2));
        expect(state1, isNot(equals(state3)));
      });

      test('should store success message', () {
        const state = TodoState.success(testMessage);
        state.when(
          initial: () => fail('Should not be initial'),
          loading: () => fail('Should not be loading'),
          loaded: (todos) => fail('Should not be loaded'),
          error: (message) => fail('Should not be error'),
          success: (message) => expect(message, testMessage),
        );
      });
    });
  });
}
