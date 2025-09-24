import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/reimbursement.dart';

part 'reimbursement_state.freezed.dart';

@freezed
sealed class ReimbursementState with _$ReimbursementState {
  const factory ReimbursementState.initial() = ReimbursementInitial;
  const factory ReimbursementState.loading() = ReimbursementLoading;
  const factory ReimbursementState.loaded(List<Reimbursement> items) = ReimbursementLoaded;
  const factory ReimbursementState.error(String message) = ReimbursementError;
  const factory ReimbursementState.success(String message) = ReimbursementSuccess;

  // Form state
  const factory ReimbursementState.formState({
    @Default(null) DateTime? selectedDate,
    @Default(null) String? selectedClaimType,
    @Default('') String detail,
    @Default('') String nominal,
    @Default('') String description,
    @Default(null) String? imagePath,
    @Default([]) List<String> imagePaths,
    @Default(null) Reimbursement? editingReimbursement,
    @Default(false) bool isLoading,
    @Default([]) List<Reimbursement> tempSubmittedList,
  }) = ReimbursementFormState;
}
