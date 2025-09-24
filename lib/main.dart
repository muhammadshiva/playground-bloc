import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/todo/presentation/bloc/todo_bloc.dart';
import 'features/reimbursement/presentation/bloc/reimbursement_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeBloc>()),
        BlocProvider(create: (context) => sl<TodoBloc>()),
        BlocProvider(create: (context) => sl<ReimbursementBloc>()),
      ],
      child: MaterialApp(
        title: 'Todo List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
          cardTheme: const CardThemeData(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 4),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
