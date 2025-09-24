import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:playground_bloc/features/todo/domain/entities/todo.dart';
import 'package:playground_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:playground_bloc/features/todo/presentation/bloc/todo_state.dart';

/// Mock classes for testing
class MockTodoBloc extends Mock implements TodoBloc {}

/// Test data factories
class TestDataFactory {
  static Todo createTodo({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Todo(
      id: id ?? 1,
      title: title ?? 'Test Todo',
      description: description ?? 'Test Description',
      isCompleted: isCompleted ?? false,
      createdAt: createdAt ?? DateTime(2024, 1, 1),
      updatedAt: updatedAt ?? DateTime(2024, 1, 1),
    );
  }

  static List<Todo> createTodoList({int count = 3}) {
    return List.generate(
      count,
      (index) => createTodo(
        id: index + 1,
        title: 'Test Todo ${index + 1}',
        description: 'Test Description ${index + 1}',
        isCompleted: index % 2 == 0,
      ),
    );
  }
}

/// Widget test helpers
class WidgetTestHelpers {
  static Widget createTestApp({required Widget child, TodoBloc? todoBloc}) {
    return MaterialApp(
      home: todoBloc != null
          ? BlocProvider<TodoBloc>(create: (context) => todoBloc, child: child)
          : child,
    );
  }

  static Widget createTestScaffold({required Widget child, TodoBloc? todoBloc}) {
    return createTestApp(
      todoBloc: todoBloc,
      child: Scaffold(body: child),
    );
  }
}

/// State test helpers
class StateTestHelpers {
  static TodoState createLoadingState() => TodoLoading();

  static TodoState createLoadedState({List<Todo>? todos}) =>
      TodoLoaded(todos ?? TestDataFactory.createTodoList());

  static TodoState createErrorState({String? message}) => TodoError(message ?? 'Test Error');

  static TodoState createSuccessState({String? message}) => TodoSuccess(message ?? 'Test Success');
}

/// Mock setup helpers
class MockSetupHelpers {
  static void setupMockTodoBloc(
    MockTodoBloc mockBloc, {
    TodoState? initialState,
    List<Todo>? todos,
  }) {
    when(mockBloc.state).thenReturn(initialState ?? TodoInitial());

    if (todos != null) {
      when(mockBloc.stream).thenAnswer((_) => Stream.value(TodoLoaded(todos)));
    }
  }
}

/// Test constants
class TestConstants {
  static const String testTitle = 'Test Todo';
  static const String testDescription = 'Test Description';
  static const String testError = 'Test Error';
  static const String testSuccess = 'Test Success';

  static final DateTime testDate = DateTime(2024, 1, 1);
  static final DateTime testDate2 = DateTime(2024, 1, 2);
}
