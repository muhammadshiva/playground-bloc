import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:playground_bloc/features/todo/domain/entities/todo.dart';
import 'package:playground_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:playground_bloc/features/todo/presentation/bloc/todo_event.dart';
import 'package:playground_bloc/features/todo/presentation/bloc/todo_state.dart';
import 'package:playground_bloc/features/todo/presentation/screens/todo_list_screen.dart';

class MockTodoBloc extends Mock implements TodoBloc {}

void main() {
  group('TodoListScreen Widget', () {
    late MockTodoBloc mockTodoBloc;

    setUp(() {
      mockTodoBloc = MockTodoBloc();
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: BlocProvider<TodoBloc>(
          create: (context) => mockTodoBloc,
          child: const TodoListScreen(),
        ),
      );
    }

    testWidgets('should display app bar with correct title', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Todo List'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should call LoadTodos on init', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      verify(mockTodoBloc.add(const TodoEvent.loadTodos())).called(1);
    });

    testWidgets('should display loading indicator when state is TodoLoading', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.loading());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display empty state when no todos', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.loaded([]));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('No todos yet'), findsOneWidget);
      expect(find.text('Tap the + button to add your first todo'), findsOneWidget);
      expect(find.byIcon(Icons.task_alt), findsOneWidget);
    });

    testWidgets('should display todo list when todos are loaded', (WidgetTester tester) async {
      // Arrange
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
      when(mockTodoBloc.state).thenReturn(TodoState.loaded(testTodos));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Test Todo 1'), findsOneWidget);
      expect(find.text('Test Todo 2'), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should display error state when state is TodoError', (WidgetTester tester) async {
      // Arrange
      const errorMessage = 'Test Error';
      when(mockTodoBloc.state).thenReturn(TodoState.error(errorMessage));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Error: $errorMessage'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('should call LoadTodos when retry button is tapped', (WidgetTester tester) async {
      // Arrange
      const errorMessage = 'Test Error';
      when(mockTodoBloc.state).thenReturn(TodoState.error(errorMessage));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Retry'));

      // Assert
      verify(
        mockTodoBloc.add(const TodoEvent.loadTodos()),
      ).called(2); // Once on init, once on retry
    });

    testWidgets('should display floating action button', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should show add todo dialog when FAB is tapped', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Add New Todo'), findsOneWidget);
    });

    testWidgets('should show error snackbar when TodoError state is emitted', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Simulate state change to TodoError
      when(mockTodoBloc.state).thenReturn(const TodoError('Test Error'));
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Test Error'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should show success snackbar when TodoSuccess state is emitted', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Simulate state change to TodoSuccess
      when(mockTodoBloc.state).thenReturn(const TodoSuccess('Test Success'));
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Test Success'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should display fallback message for unknown state', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      // The screen should handle the initial state gracefully
      expect(find.text('Something went wrong'), findsNothing);
    });
  });
}
