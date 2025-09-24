import '../../domain/entities/reimbursement.dart';
import '../bloc/reimbursement_state.dart';

/// Helper class to collect and validate form data from ReimbursementFormScreen and ReimbursementBottomSheet
class ReimbursementFormHelper {
  /// Collects all form data from the current state and returns a complete Reimbursement object
  /// ready for API submission
  static Reimbursement? collectFormData(ReimbursementState state) {
    if (state is! ReimbursementFormState) {
      return null;
    }

    final formState = state;

    // Validate required fields
    if (formState.selectedDate == null ||
        formState.selectedClaimType == null ||
        formState.detail.trim().isEmpty ||
        formState.nominal.trim().isEmpty ||
        formState.description.trim().isEmpty) {
      return null;
    }

    return Reimbursement(
      id: formState.editingReimbursement?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      date: formState.selectedDate!,
      claimType: formState.selectedClaimType!,
      detail: formState.detail.trim(),
      nominal: formState.nominal.trim(),
      description: formState.description.trim(),
      imagePath: formState.imagePath,
      imagePaths: formState.imagePaths,
      status: formState.editingReimbursement?.status ?? 'pending',
      createdAt: formState.editingReimbursement?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Validates if all required form fields are filled
  static bool isFormValid(ReimbursementState state) {
    if (state is! ReimbursementFormState) {
      return false;
    }

    final formState = state;

    return formState.selectedDate != null &&
        formState.selectedClaimType != null &&
        formState.detail.trim().isNotEmpty &&
        formState.nominal.trim().isNotEmpty &&
        formState.description.trim().isNotEmpty &&
        (formState.imagePaths.isNotEmpty || formState.imagePath != null);
  }

  /// Returns a list of missing required fields
  static List<String> getMissingFields(ReimbursementState state) {
    if (state is! ReimbursementFormState) {
      return ['Form state not initialized'];
    }

    final formState = state;
    final List<String> missingFields = [];

    if (formState.selectedDate == null) {
      missingFields.add('Tanggal');
    }
    if (formState.selectedClaimType == null) {
      missingFields.add('Jenis Klaim');
    }
    if (formState.detail.trim().isEmpty) {
      missingFields.add('Detail');
    }
    if (formState.nominal.trim().isEmpty) {
      missingFields.add('Nominal');
    }
    if (formState.description.trim().isEmpty) {
      missingFields.add('Keterangan');
    }
    if (formState.imagePaths.isEmpty && formState.imagePath == null) {
      missingFields.add('Bukti Foto');
    }

    return missingFields;
  }

  /// Creates a formatted error message for missing fields
  static String getValidationErrorMessage(ReimbursementState state) {
    final missingFields = getMissingFields(state);

    if (missingFields.isEmpty) {
      return '';
    }

    if (missingFields.length == 1) {
      return 'Mohon isi field: ${missingFields.first}';
    }

    return 'Mohon isi field: ${missingFields.join(', ')}';
  }

  /// Converts form data to a Map for API submission
  static Map<String, dynamic> toApiPayload(Reimbursement reimbursement) {
    return {
      'id': reimbursement.id,
      'date': reimbursement.date.toIso8601String(),
      'claimType': reimbursement.claimType,
      'detail': reimbursement.detail,
      'nominal': reimbursement.nominal,
      'description': reimbursement.description,
      'imagePath': reimbursement.imagePath,
      'imagePaths': reimbursement.imagePaths,
      'status': reimbursement.status,
      'createdAt': reimbursement.createdAt?.toIso8601String(),
      'updatedAt': reimbursement.updatedAt?.toIso8601String(),
    };
  }
}
