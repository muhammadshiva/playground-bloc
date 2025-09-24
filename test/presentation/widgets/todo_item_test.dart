import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:playground_bloc/features/todo/domain/entities/todo.dart';
import 'package:playground_bloc/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:playground_bloc/features/todo/presentation/bloc/todo_event.dart';
import 'package:playground_bloc/features/todo/presentation/widgets/todo_item.dart';

class MockTodoBloc extends Mock implements TodoBloc {}

void main() {
  group('TodoItem Widget', () {
    late MockTodoBloc mockTodoBloc;
    late Todo testTodo;

    setUp(() {
      mockTodoBloc = MockTodoBloc();
      testTodo = Todo(
        id: 1,
        title: 'Test Todo',
        description: 'Test Description',
        isCompleted: false,
        createdAt: DateTime(2024, 1, 1),
        updatedAt: DateTime(2024, 1, 1),
      );
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: BlocProvider<TodoBloc>(
          create: (context) => mockTodoBloc,
          child: Scaffold(body: TodoItem(todo: testTodo)),
        ),
      );
    }

    testWidgets('should display todo title and description', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(TodoInitial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Test Todo'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
    });

    testWidgets('should display checkbox with correct value', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(TodoInitial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, false);
    });

    testWidgets('should display completed todo with strikethrough text', (
      WidgetTester tester,
    ) async {
      // Arrange
      final completedTodo = testTodo.copyWith(isCompleted: true);
      when(mockTodoBloc.state).thenReturn(TodoInitial());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<TodoBloc>(
            create: (context) => mockTodoBloc,
            child: Scaffold(body: TodoItem(todo: completedTodo)),
          ),
        ),
      );

      // Assert
      final titleText = tester.widget<Text>(find.text('Test Todo'));
      expect(titleText.style?.decoration, TextDecoration.lineThrough);
    });

    testWidgets('should display created date', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(TodoInitial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.textContaining('Created:'), findsOneWidget);
    });

    testWidgets('should show popup menu when trailing button is tapped', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(TodoInitial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
    });

    testWidgets('should call ToggleTodoCompletion when checkbox is tapped', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(TodoInitial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.byType(Checkbox));

      // Assert
      verify(mockTodoBloc.add(ToggleTodoCompletion(testTodo))).called(1);
    });

    testWidgets('should show edit dialog when edit is selected', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(TodoInitial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Edit Todo'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
    });

    testWidgets('should show delete confirmation when delete is selected', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(TodoInitial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Delete Todo'), findsOneWidget);
      expect(find.text('Are you sure you want to delete this todo?'), findsOneWidget);
    });

    testWidgets('should call UpdateTodo when edit form is submitted', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(TodoInitial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      // Update the title field
      await tester.enterText(find.byType(TextField).first, 'Updated Title');
      await tester.enterText(find.byType(TextField).last, 'Updated Description');

      // Tap update button
      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();

      // Assert
      verify(mockTodoBloc.add(any)).called(1);
    });

    testWidgets('should call DeleteTodo when delete is confirmed', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(TodoInitial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      // Assert
      verify(mockTodoBloc.add(DeleteTodo(testTodo.id!))).called(1);
    });
  });
}
