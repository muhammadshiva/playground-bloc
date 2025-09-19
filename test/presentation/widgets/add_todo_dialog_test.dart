import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:playground_bloc/presentation/bloc/todo_bloc.dart';
import 'package:playground_bloc/presentation/bloc/todo_event.dart';
import 'package:playground_bloc/presentation/widgets/add_todo_dialog.dart';

class MockTodoBloc extends Mock implements TodoBloc {}

void main() {
  group('AddTodoDialog Widget', () {
    late MockTodoBloc mockTodoBloc;

    setUp(() {
      mockTodoBloc = MockTodoBloc();
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        home: BlocProvider<TodoBloc>(
          create: (context) => mockTodoBloc,
          child: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context) => const AddTodoDialog());
                  },
                  child: const Text('Show Dialog'),
                );
              },
            ),
          ),
        ),
      );
    }

    testWidgets('should display dialog with title and form fields', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Add New Todo'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('should display cancel and add todo buttons', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Add Todo'), findsOneWidget);
    });

    testWidgets('should close dialog when cancel is tapped', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Add New Todo'), findsNothing);
    });

    testWidgets('should show validation errors for empty fields', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Todo'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Please enter a title'), findsOneWidget);
      expect(find.text('Please enter a description'), findsOneWidget);
    });

    testWidgets('should call CreateTodo when form is valid and add todo is tapped', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Fill in the form
      await tester.enterText(find.byType(TextFormField).first, 'Test Title');
      await tester.enterText(find.byType(TextFormField).last, 'Test Description');

      // Tap add todo button
      await tester.tap(find.text('Add Todo'));
      await tester.pumpAndSettle();

      // Assert
      verify(
        mockTodoBloc.add(const CreateTodo(title: 'Test Title', description: 'Test Description')),
      ).called(1);
    });

    testWidgets('should close dialog after successful submission', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Fill in the form
      await tester.enterText(find.byType(TextFormField).first, 'Test Title');
      await tester.enterText(find.byType(TextFormField).last, 'Test Description');

      // Tap add todo button
      await tester.tap(find.text('Add Todo'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Add New Todo'), findsNothing);
    });

    testWidgets('should not submit form when validation fails', (WidgetTester tester) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Fill only title field
      await tester.enterText(find.byType(TextFormField).first, 'Test Title');

      // Tap add todo button
      await tester.tap(find.text('Add Todo'));
      await tester.pumpAndSettle();

      // Assert
      verifyNever(mockTodoBloc.add(any));
      expect(find.text('Add New Todo'), findsOneWidget); // Dialog should still be open
    });

    testWidgets('should clear form fields when dialog is closed and reopened', (
      WidgetTester tester,
    ) async {
      // Arrange
      when(mockTodoBloc.state).thenReturn(const TodoState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Fill in the form
      await tester.enterText(find.byType(TextFormField).first, 'Test Title');
      await tester.enterText(find.byType(TextFormField).last, 'Test Description');

      // Close dialog
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Reopen dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Assert
      final titleField = tester.widget<TextFormField>(find.byType(TextFormField).first);
      final descriptionField = tester.widget<TextFormField>(find.byType(TextFormField).last);
      expect(titleField.controller?.text, isEmpty);
      expect(descriptionField.controller?.text, isEmpty);
    });
  });
}
