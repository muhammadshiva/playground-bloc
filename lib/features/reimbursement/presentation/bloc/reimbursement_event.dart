import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/reimbursement.dart';

part 'reimbursement_event.freezed.dart';

@freezed
sealed class ReimbursementEvent with _$ReimbursementEvent {
  const factory ReimbursementEvent.started() = ReimbursementStarted;
  const factory ReimbursementEvent.create(Reimbursement item) = ReimbursementCreate;
  const factory ReimbursementEvent.update(Reimbursement item) = ReimbursementUpdate;
  const factory ReimbursementEvent.delete(String id) = ReimbursementDelete;

  // Form state management events
  const factory ReimbursementEvent.initializeForm([Reimbursement? item]) =
      ReimbursementInitializeForm;
  const factory ReimbursementEvent.updateFormDate(DateTime? date) = ReimbursementUpdateFormDate;
  const factory ReimbursementEvent.updateFormClaimType(String? claimType) =
      ReimbursementUpdateFormClaimType;
  const factory ReimbursementEvent.updateFormDetail(String detail) = ReimbursementUpdateFormDetail;
  const factory ReimbursementEvent.updateFormNominal(String nominal) =
      ReimbursementUpdateFormNominal;
  const factory ReimbursementEvent.updateFormDescription(String description) =
      ReimbursementUpdateFormDescription;
  const factory ReimbursementEvent.updateFormImagePath(String? imagePath) =
      ReimbursementUpdateFormImagePath;
  const factory ReimbursementEvent.addFormImagePath(String imagePath) =
      ReimbursementAddFormImagePath;
  const factory ReimbursementEvent.removeFormImagePath(String imagePath) =
      ReimbursementRemoveFormImagePath;
  const factory ReimbursementEvent.updateFormImagePaths(List<String> imagePaths) =
      ReimbursementUpdateFormImagePaths;
  const factory ReimbursementEvent.resetForm() = ReimbursementResetForm;

  // Submit complete form data
  const factory ReimbursementEvent.submitForm() = ReimbursementSubmitForm;

  // Temporary list management
  const factory ReimbursementEvent.addToTempList(Reimbursement item) = ReimbursementAddToTempList;
  const factory ReimbursementEvent.removeFromTempList(String id) = ReimbursementRemoveFromTempList;
  const factory ReimbursementEvent.clearTempList() = ReimbursementClearTempList;
}
