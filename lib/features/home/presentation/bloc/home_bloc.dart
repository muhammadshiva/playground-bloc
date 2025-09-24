import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/usecases/get_all_home.dart';
import '../../domain/usecases/create_home.dart';
import '../../domain/usecases/update_home.dart';
import '../../domain/usecases/delete_home.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllHome getAllHome;
  final CreateHome createHome;
  final UpdateHome updateHome;
  final DeleteHome deleteHome;

  HomeBloc({
    required this.getAllHome,
    required this.createHome,
    required this.updateHome,
    required this.deleteHome,
  }) : super(const HomeState.initial()) {
    on<HomeStarted>((event, emit) async {
      emit(const HomeState.loading());
      final result = await getAllHome();
      result.fold(
        (failure) => emit(HomeState.error(failure)),
        (items) => emit(HomeState.loaded(items)),
      );
    });

    on<HomeCreate>((event, emit) async {
      emit(const HomeState.loading());
      final result = await createHome(event.item);
      result.fold(
        (failure) => emit(HomeState.error(failure)),
        (_) async {
          final refreshed = await getAllHome();
          refreshed.fold(
            (f) => emit(HomeState.error(f)),
            (items) => emit(HomeState.loaded(items)),
          );
        },
      );
    });

    on<HomeUpdate>((event, emit) async {
      emit(const HomeState.loading());
      final result = await updateHome(event.item);
      result.fold(
        (failure) => emit(HomeState.error(failure)),
        (_) async {
          final refreshed = await getAllHome();
          refreshed.fold(
            (f) => emit(HomeState.error(f)),
            (items) => emit(HomeState.loaded(items)),
          );
        },
      );
    });

    on<HomeDelete>((event, emit) async {
      emit(const HomeState.loading());
      final result = await deleteHome(event.id);
      result.fold(
        (failure) => emit(HomeState.error(failure)),
        (_) async {
          final refreshed = await getAllHome();
          refreshed.fold(
            (f) => emit(HomeState.error(f)),
            (items) => emit(HomeState.loaded(items)),
          );
        },
      );
    });
  }
}
