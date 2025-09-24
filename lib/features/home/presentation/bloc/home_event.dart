import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/home.dart';

part 'home_event.freezed.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = HomeStarted;
  const factory HomeEvent.create(Home item) = HomeCreate;
  const factory HomeEvent.update(Home item) = HomeUpdate;
  const factory HomeEvent.delete(String id) = HomeDelete;
}
