import 'package:get_it/get_it.dart';
import 'package:playground_bloc/features/home/data/datasources/home_data_source.dart';
import 'package:playground_bloc/features/home/domain/usecases/get_all_home.dart';
import 'package:playground_bloc/features/home/domain/usecases/create_home.dart';
import 'package:playground_bloc/features/home/domain/usecases/update_home.dart';
import 'package:playground_bloc/features/home/domain/usecases/delete_home.dart';
import 'package:playground_bloc/features/home/domain/repositories/home_repository.dart';
import 'package:playground_bloc/features/home/data/repositories/home_repository_impl.dart';
import 'package:playground_bloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:playground_bloc/features/reimbursement/data/datasources/reimbursement_data_source.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_bloc.dart';
import 'package:playground_bloc/features/reimbursement/data/repositories/reimbursement_repository_impl.dart';
import 'package:playground_bloc/features/reimbursement/domain/repositories/reimbursement_repository.dart';
import 'package:playground_bloc/features/reimbursement/domain/usecases/get_all_reimbursement.dart';
import 'package:playground_bloc/features/reimbursement/domain/usecases/create_reimbursement.dart';
import 'package:playground_bloc/features/reimbursement/domain/usecases/update_reimbursement.dart';
import 'package:playground_bloc/features/reimbursement/domain/usecases/delete_reimbursement.dart';
import '../../../features/todo/data/datasources/database_helper.dart';
import '../../../features/todo/data/repositories/todo_repository_impl.dart';
import '../../../features/todo/domain/repositories/todo_repository.dart';
import '../../../features/todo/domain/usecases/create_todo.dart';
import '../../../features/todo/domain/usecases/delete_todo.dart';
import '../../../features/todo/domain/usecases/get_all_todos.dart';
import '../../../features/todo/domain/usecases/toggle_todo_completion.dart';
import '../../../features/todo/domain/usecases/update_todo.dart';
import '../../../features/todo/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //* EXTERNAL DEPENDENCIES
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSource());
  sl.registerLazySingleton<ReimbursementDataSource>(() => ReimbursementDataSource());

  //* REPOSITORIES
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));
  sl.registerLazySingleton<ReimbursementRepository>(() => ReimbursementRepositoryImpl(sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  //* USE CASES
  //^ Todo
  sl.registerLazySingleton(() => GetAllTodos(sl()));
  sl.registerLazySingleton(() => CreateTodo(sl()));
  sl.registerLazySingleton(() => UpdateTodo(sl()));
  sl.registerLazySingleton(() => DeleteTodo(sl()));
  sl.registerLazySingleton(() => ToggleTodoCompletion(sl()));

  //^ Reimbursement
  sl.registerLazySingleton(() => GetAllReimbursement(sl()));
  sl.registerLazySingleton(() => CreateReimbursement(sl()));
  sl.registerLazySingleton(() => UpdateReimbursement(sl()));
  sl.registerLazySingleton(() => DeleteReimbursement(sl()));

  //^ Home
  sl.registerLazySingleton(() => GetAllHome(sl()));
  sl.registerLazySingleton(() => CreateHome(sl()));
  sl.registerLazySingleton(() => UpdateHome(sl()));
  sl.registerLazySingleton(() => DeleteHome(sl()));

  //* BLOCS
  sl.registerFactory(
    () => TodoBloc(
      getAllTodos: sl(),
      createTodo: sl(),
      updateTodo: sl(),
      deleteTodo: sl(),
      toggleTodoCompletion: sl(),
    ),
  );

  sl.registerFactory(
    () => ReimbursementBloc(
      getAllReimbursement: sl(),
      createReimbursement: sl(),
      updateReimbursement: sl(),
      deleteReimbursement: sl(),
    ),
  );

  sl.registerFactory(
    () => HomeBloc(getAllHome: sl(), createHome: sl(), updateHome: sl(), deleteHome: sl()),
  );
}
