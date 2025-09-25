import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/reimbursement.dart';
import '../../domain/usecases/get_all_reimbursement.dart';
import '../../domain/usecases/create_reimbursement.dart';
import '../../domain/usecases/update_reimbursement.dart';
import '../../domain/usecases/delete_reimbursement.dart';
import '../utils/functions/reimbursement_form_helper.dart';
import 'reimbursement_event.dart';
import 'reimbursement_state.dart';

class ReimbursementBloc extends Bloc<ReimbursementEvent, ReimbursementState> {
  final GetAllReimbursement getAllReimbursement;
  final CreateReimbursement createReimbursement;
  final UpdateReimbursement updateReimbursement;
  final DeleteReimbursement deleteReimbursement;

  ReimbursementBloc({
    required this.getAllReimbursement,
    required this.createReimbursement,
    required this.updateReimbursement,
    required this.deleteReimbursement,
  }) : super(const ReimbursementState.initial()) {
    on<ReimbursementStarted>((event, emit) async {
      emit(const ReimbursementState.loading());
      final result = await getAllReimbursement();
      result.fold(
        (failure) {
          emit(ReimbursementState.error(failure));
        },
        (items) {
          emit(ReimbursementState.loaded(items));
        },
      );
    });

    on<ReimbursementCreate>((event, emit) async {
      emit(const ReimbursementState.loading());
      final result = await createReimbursement(event.item);
      result.fold(
        (failure) => emit(ReimbursementState.error(failure)),
        (_) => emit(const ReimbursementState.success('Reimbursement berhasil dibuat!')),
      );
    });

    on<ReimbursementUpdate>((event, emit) async {
      emit(const ReimbursementState.loading());
      final result = await updateReimbursement(event.item);
      result.fold(
        (failure) => emit(ReimbursementState.error(failure)),
        (_) => emit(const ReimbursementState.success('Reimbursement berhasil diperbarui!')),
      );
    });

    on<ReimbursementDelete>((event, emit) async {
      final currentState = state;

      // If we have a loaded state, show loading while keeping the current list
      if (currentState is ReimbursementLoaded) {
        emit(ReimbursementState.loading());
      } else {
        emit(const ReimbursementState.loading());
      }

      final result = await deleteReimbursement(event.id);
      result.fold(
        (failure) {
          emit(ReimbursementState.error(failure));
        },
        (_) {
          // If we had a loaded state, remove the deleted item from the list
          if (currentState is ReimbursementLoaded) {
            final updatedItems = currentState.items.where((item) => item.id != event.id).toList();
            emit(ReimbursementState.loaded(updatedItems));
          } else {
            // If no loaded state, just show success and let user refresh
            emit(const ReimbursementState.success('Reimbursement berhasil dihapus!'));
          }
        },
      );
    });

    // Form state management
    on<ReimbursementInitializeForm>((event, emit) {
      final item = event.item;
      emit(
        ReimbursementState.formState(
          selectedDate: item?.date,
          selectedClaimType: item?.claimType,
          detail: item?.detail ?? '',
          nominal: item?.nominal ?? '',
          description: item?.description ?? '',
          imagePath: item?.imagePath,
          imagePaths: item?.imagePaths ?? [],
          editingReimbursement: item,
          isLoading: false,
        ),
      );
    });

    on<ReimbursementUpdateFormDate>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        emit(currentState.copyWith(selectedDate: event.date));
      }
    });

    on<ReimbursementUpdateFormClaimType>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        emit(currentState.copyWith(selectedClaimType: event.claimType));
      }
    });

    on<ReimbursementUpdateFormDetail>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        emit(currentState.copyWith(detail: event.detail));
      }
    });

    on<ReimbursementUpdateFormNominal>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        emit(currentState.copyWith(nominal: event.nominal));
      }
    });

    on<ReimbursementUpdateFormDescription>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        emit(currentState.copyWith(description: event.description));
      }
    });

    on<ReimbursementUpdateFormImagePath>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        emit(currentState.copyWith(imagePath: event.imagePath));
      }
    });

    on<ReimbursementAddFormImagePath>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        final updatedImagePaths = List<String>.from(currentState.imagePaths);
        if (!updatedImagePaths.contains(event.imagePath)) {
          updatedImagePaths.add(event.imagePath);
        }

        // Create a new state instead of using copyWith
        emit(
          ReimbursementState.formState(
            selectedDate: currentState.selectedDate,
            selectedClaimType: currentState.selectedClaimType,
            detail: currentState.detail,
            nominal: currentState.nominal,
            description: currentState.description,
            imagePath: currentState.imagePath,
            imagePaths: updatedImagePaths,
            editingReimbursement: currentState.editingReimbursement,
            isLoading: currentState.isLoading,
            tempSubmittedList: currentState.tempSubmittedList,
          ),
        );
      }
    });

    on<ReimbursementRemoveFormImagePath>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        final updatedImagePaths = currentState.imagePaths
            .where((path) => path != event.imagePath)
            .toList();

        // Create a new state instead of using copyWith
        emit(
          ReimbursementState.formState(
            selectedDate: currentState.selectedDate,
            selectedClaimType: currentState.selectedClaimType,
            detail: currentState.detail,
            nominal: currentState.nominal,
            description: currentState.description,
            imagePath: currentState.imagePath,
            imagePaths: updatedImagePaths,
            editingReimbursement: currentState.editingReimbursement,
            isLoading: currentState.isLoading,
            tempSubmittedList: currentState.tempSubmittedList,
          ),
        );
      }
    });

    on<ReimbursementUpdateFormImagePaths>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        emit(currentState.copyWith(imagePaths: event.imagePaths));
      }
    });

    on<ReimbursementResetForm>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        emit(
          currentState.copyWith(
            selectedDate: null,
            selectedClaimType: null,
            detail: '',
            nominal: '',
            description: '',
            imagePath: null,
            imagePaths: [],
            editingReimbursement: null,
            isLoading: false,
          ),
        );
      } else {
        emit(const ReimbursementState.formState());
      }
    });

    on<ReimbursementSubmitForm>((event, emit) async {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        // Validate form using helper
        if (!ReimbursementFormHelper.isFormValid(currentState)) {
          final errorMessage = ReimbursementFormHelper.getValidationErrorMessage(currentState);
          emit(ReimbursementState.error(errorMessage));
          return;
        }

        // Set loading state
        emit(currentState.copyWith(isLoading: true));

        try {
          // Collect form data using helper
          final reimbursement = ReimbursementFormHelper.collectFormData(currentState);

          if (reimbursement == null) {
            emit(ReimbursementState.error('Gagal mengumpulkan data form'));
            return;
          }

          if (currentState.editingReimbursement != null) {
            // Update existing reimbursement
            final result = await updateReimbursement(reimbursement);
            result.fold((failure) => emit(ReimbursementState.error(failure)), (_) {
              // Add to temp list and show success
              final updatedTempList = List<Reimbursement>.from(currentState.tempSubmittedList);
              updatedTempList.add(reimbursement);
              emit(currentState.copyWith(tempSubmittedList: updatedTempList, isLoading: false));
              emit(const ReimbursementState.success('Reimbursement berhasil diperbarui!'));
            });
          } else {
            // Create new reimbursement
            final result = await createReimbursement(reimbursement);
            result.fold((failure) => emit(ReimbursementState.error(failure)), (_) {
              // Add to temp list and show success
              final updatedTempList = List<Reimbursement>.from(currentState.tempSubmittedList);
              updatedTempList.add(reimbursement);
              emit(currentState.copyWith(tempSubmittedList: updatedTempList, isLoading: false));
              emit(const ReimbursementState.success('Reimbursement berhasil dibuat!'));
            });
          }
        } catch (e) {
          emit(ReimbursementState.error('Terjadi kesalahan: ${e.toString()}'));
        }
      }
    });

    // Temporary list management
    on<ReimbursementAddToTempList>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        final updatedTempList = List<Reimbursement>.from(currentState.tempSubmittedList);
        updatedTempList.add(event.item);
        emit(currentState.copyWith(tempSubmittedList: updatedTempList));
      }
    });

    on<ReimbursementRemoveFromTempList>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        final updatedTempList = currentState.tempSubmittedList
            .where((item) => item.id != event.id)
            .toList();
        emit(currentState.copyWith(tempSubmittedList: updatedTempList));
      }
    });

    on<ReimbursementClearTempList>((event, emit) {
      final currentState = state;
      if (currentState is ReimbursementFormState) {
        emit(currentState.copyWith(tempSubmittedList: []));
      }
    });
  }
}
