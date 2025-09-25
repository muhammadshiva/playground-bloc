import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:venturo_api_manager/venturo_api_manager.dart';
import 'constants/core/di/injection_container.dart';
import 'constants/common/api.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/todo/presentation/bloc/todo_bloc.dart';
import 'features/reimbursement/presentation/bloc/reimbursement_bloc.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await _initializeServices();
      runApp(const MainApp());
    },
    (error, stack) {
      log('App initialization failed: $error', name: 'ERROR');
      log(stack.toString(), name: 'STACK_TRACE');
    },
  );
}

Future<void> _initializeServices() async {
  try {
    await _initializeApiManager();
    await initializeDependencies();
    log('All services initialized successfully', name: 'INIT');
  } catch (e, s) {
    log('Service initialization failed: $e', name: 'ERROR');
    log(s.toString(), name: 'STACK_TRACE');
    rethrow;
  }
}

Future<void> _initializeApiManager() async {
  await VenturoApiManager.initialize(
    baseUrl: ApiConstant.baseUrl,
    config: VenturoApiConfig(
      configureInterceptor: VenturoApiInterceptor(onResponseSecurityValid: () {}),
      security: VenturoApiSecurity(PRIVATE_KEY: "", PUBLIC_KEY: ""),
    ),
  );
  log('VenturoApiManager initialized successfully', name: 'API_INIT');
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
