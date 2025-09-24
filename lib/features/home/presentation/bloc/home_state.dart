import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/home.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.loaded(List<Home> items) = HomeLoaded;
  const factory HomeState.error(String message) = HomeError;
  const factory HomeState.success(String message) = HomeSuccess;
}
