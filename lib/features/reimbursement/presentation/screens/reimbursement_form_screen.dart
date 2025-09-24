import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_bloc.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_event.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_state.dart';
import 'package:playground_bloc/features/reimbursement/domain/entities/reimbursement.dart';
import 'package:playground_bloc/features/reimbursement/presentation/screens/widgets/widgets.dart';
import 'package:playground_bloc/shared/widgets/widgets.dart';

class ReimbursementFormScreen extends StatefulWidget {
  const ReimbursementFormScreen({super.key});

  @override
  State<ReimbursementFormScreen> createState() => _ReimbursementFormScreenState();
}

class _ReimbursementFormScreenState extends State<ReimbursementFormScreen> {
  late TextEditingController _detailController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<ApprovalLineModel> approvalLines = [];

  static const List<String> claimTypes = [
    'Transportasi',
    'Makan & Minum',
    'Akomodasi',
    'Komunikasi',
    'Lainnya',
  ];

  @override
  void initState() {
    super.initState();
    _detailController = TextEditingController();
    _loadApprovalLines();

    // Initialize form state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Reimbursement) {
        context.read<ReimbursementBloc>().add(ReimbursementEvent.initializeForm(args));
      } else {
        context.read<ReimbursementBloc>().add(const ReimbursementEvent.initializeForm());
      }
    });
  }

  Future<void> _loadApprovalLines() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/approval_lines.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> approvalLinesJson = jsonData['approvalLines'] as List<dynamic>;

      setState(() {
        approvalLines = approvalLinesJson
            .map((json) => ApprovalLineModel.fromJson(json as Map<String, dynamic>))
            .toList();
      });
    } catch (e) {
      log('Error loading approval lines: $e');
      // Fallback to default data if JSON loading fails
      setState(() {
        approvalLines = [
          const ApprovalLineModel(
            name: 'Yokevin Mayer Van Persie',
            position: 'Big Boss',
            approvedDate: 'Mon, 1 Jan 2025',
            isApproved: true,
          ),
          const ApprovalLineModel(
            name: 'John Doe',
            position: 'Manager',
            approvedDate: 'Mon, 1 Jan 2025',
            isApproved: false,
          ),
        ];
      });
    }
  }

  @override
  void dispose() {
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F2F5),
      appBar: GradientAppBar(title: 'Tambah Reimbursement'),
      body: BlocConsumer<ReimbursementBloc, ReimbursementState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            loaded: (items) {},
            error: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
            },
            success: (message) {
              // Show success message and return result to main screen
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.green));
              // Return true to indicate successful operation
              Navigator.of(context).pop(true);
            },
            formState:
                (
                  selectedDate,
                  selectedClaimType,
                  detail,
                  nominal,
                  description,
                  imagePath,
                  imagePaths,
                  editingReimbursement,
                  isLoading,
                  tempSubmittedList,
                ) {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (items) => const Center(child: CircularProgressIndicator()),
            error: (message) => const Center(child: CircularProgressIndicator()),
            success: (message) => const Center(child: CircularProgressIndicator()),
            formState:
                (
                  selectedDate,
                  selectedClaimType,
                  detail,
                  nominal,
                  description,
                  imagePath,
                  imagePaths,
                  editingReimbursement,
                  isLoading,
                  tempSubmittedList,
                ) {
                  if (isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return _buildFormBody(
                    context,
                    selectedDate,
                    selectedClaimType,
                    detail,
                    editingReimbursement,
                  );
                },
          );
        },
      ),
    );
  }

  Widget _buildFormBody(
    BuildContext context,
    DateTime? selectedDate,
    String? selectedClaimType,
    String detail,
    Reimbursement? editingReimbursement,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 16),
          const TempSubmittedListWidget(),
          _buildFormSubmission(
            context,
            selectedDate,
            selectedClaimType,
            detail,
            editingReimbursement,
          ),
          const SizedBox(height: 8),
          EvidenceAttachmentSection(),
          const SizedBox(height: 8),
          ApprovalLineSection(approvalLines: approvalLines),
          const SizedBox(height: 16),
          _submitFormButton(context, selectedDate, selectedClaimType, detail, editingReimbursement),
        ],
      ),
    );
  }

  Widget _buildFormSubmission(
    BuildContext context,
    DateTime? selectedDate,
    String? selectedClaimType,
    String detail,
    Reimbursement? editingReimbursement,
  ) {
    // Update controller text if detail has changed
    if (_detailController.text != detail) {
      _detailController.text = detail;
    }

    return SectionCard(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detail Pengajuan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50)),
            ),
            const SizedBox(height: 20),
            CustomDatePicker(
              label: 'Tanggal',
              placeholder: 'Pilih tanggal',
              selectedDate: selectedDate,
              onDateSelected: (date) {
                context.read<ReimbursementBloc>().add(ReimbursementEvent.updateFormDate(date));
              },
              validator: (date) {
                if (date == null) {
                  return 'Tanggal harus dipilih';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomDropDownPicker<String>(
              label: 'Jenis Klaim',
              placeholder: 'Pilih jenis klaim',
              selectedValue: selectedClaimType,
              items: claimTypes.map((type) => type.toDropdownItem()).toList(),
              onChanged: (value) {
                context.read<ReimbursementBloc>().add(
                  ReimbursementEvent.updateFormClaimType(value),
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Jenis klaim harus dipilih';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'Detail',
              placeholder: 'Masukkan detail pengajuan',
              controller: _detailController,
              maxLines: 4,
              onChanged: (value) {
                context.read<ReimbursementBloc>().add(ReimbursementEvent.updateFormDetail(value));
              },
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Detail pengajuan harus diisi';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitFormButton(
    BuildContext context,
    DateTime? selectedDate,
    String? selectedClaimType,
    String detail,
    Reimbursement? editingReimbursement,
  ) {
    return BlocBuilder<ReimbursementBloc, ReimbursementState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

        final buttonText = editingReimbursement != null
            ? (isLoading ? 'Updating...' : 'Update Request')
            : (isLoading ? 'Submitting...' : 'Submit Request');

        return GradientButton(
          text: buttonText,
          onPressed: isLoading
              ? null
              : () => _submitForm(
                  context,
                  selectedDate,
                  selectedClaimType,
                  detail,
                  editingReimbursement,
                ),
        );
      },
    );
  }

  void _submitForm(
    BuildContext context,
    DateTime? selectedDate,
    String? selectedClaimType,
    String detail,
    Reimbursement? editingReimbursement,
  ) {
    log('selectedDate: $selectedDate');
    log('selectedClaimType: $selectedClaimType');
    log('detail: $detail');
    log('editingReimbursement: $editingReimbursement');

    final currentDetail = _detailController.text.trim();

    // Update the form state with the current detail
    context.read<ReimbursementBloc>().add(ReimbursementEvent.updateFormDetail(currentDetail));

    // Submit the complete form data
    context.read<ReimbursementBloc>().add(const ReimbursementEvent.submitForm());
  }
}
