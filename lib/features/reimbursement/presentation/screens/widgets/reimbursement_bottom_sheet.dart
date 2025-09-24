import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../bloc/reimbursement_bloc.dart';
import '../../bloc/reimbursement_event.dart';
import '../../bloc/reimbursement_state.dart';
import '../../utils/reimbursement_form_helper.dart';

class ReimbursementBottomSheet extends StatelessWidget {
  const ReimbursementBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ReimbursementBottomSheetContent();
  }
}

class _ReimbursementBottomSheetContent extends StatefulWidget {
  const _ReimbursementBottomSheetContent();

  @override
  State<_ReimbursementBottomSheetContent> createState() => _ReimbursementBottomSheetContentState();
}

class _ReimbursementBottomSheetContentState extends State<_ReimbursementBottomSheetContent> {
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Only initialize the form if it's not already in form state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final currentState = context.read<ReimbursementBloc>().state;
        // Only initialize if we're not already in form state
        if (currentState is! ReimbursementFormState) {
          context.read<ReimbursementBloc>().add(const ReimbursementEvent.initializeForm());
        } else {
          // If we're already in form state, sync the controllers with existing data
          _nominalController.text = currentState.nominal;
          _descriptionController.text = currentState.description;
        }
      }
    });
  }

  @override
  void dispose() {
    _nominalController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReimbursementBloc, ReimbursementState>(
      builder: (context, state) {
        // Update controllers when state changes
        if (state is ReimbursementFormState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_nominalController.text != state.nominal) {
              _nominalController.text = state.nominal;
            }
            if (_descriptionController.text != state.description) {
              _descriptionController.text = state.description;
            }
          });
        }

        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with gradient background
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Bukti dan Nominal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.close, color: Colors.white, size: 24),
                    ),
                  ],
                ),
              ),

              // Content area
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Photo proof section
                    const Text(
                      'Bukti Foto',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF374151),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildImageGrid(state),

                    const SizedBox(height: 24),

                    // Nominal section
                    const Text(
                      'Nominal',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF374151),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _nominalController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        context.read<ReimbursementBloc>().add(
                          ReimbursementEvent.updateFormNominal(value),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Masukkan nominal disini',
                        hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Description section
                    const Text(
                      'Keterangan',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF374151),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 3,
                      onChanged: (value) {
                        context.read<ReimbursementBloc>().add(
                          ReimbursementEvent.updateFormDescription(value),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Masukkan keterangan pengajuan',
                        hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Save button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _saveReimbursement,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: const Center(
                            child: Text(
                              'Simpan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImagePlaceholder() {
    return const Center(child: Icon(Icons.add, size: 20, color: Color(0xFF6B7280)));
  }

  Widget _buildImageGrid(ReimbursementState state) {
    if (state is! ReimbursementFormState) {
      return _buildAddImageButton();
    }

    final imagePaths = state.imagePaths;
    final List<Widget> imageWidgets = [];

    // Add existing images
    for (int i = 0; i < imagePaths.length; i++) {
      imageWidgets.add(_buildImageItem(imagePaths[i], i));
    }

    // Add button if we haven't reached the limit (let's say max 5 images)
    if (imagePaths.length < 5) {
      imageWidgets.add(_buildAddImageButton());
    }

    return Wrap(spacing: 8, runSpacing: 8, children: imageWidgets);
  }

  Widget _buildImageItem(String imagePath, int index) {
    return GestureDetector(
      onTap: () => _showImageOptions(imagePath),
      child: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD1D5DB), width: 1),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(imagePath),
                width: 68,
                height: 68,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildImagePlaceholder();
                },
              ),
            ),
            // Remove button
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => _removeImage(imagePath),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: const Icon(Icons.close, size: 12, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddImageButton() {
    return GestureDetector(
      onTap: _showImageSourceBottomSheet,
      child: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD1D5DB), width: 1),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: _buildImagePlaceholder(),
      ),
    );
  }

  void _showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Pilih Sumber Gambar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Color(0xFF3B82F6)),
              title: const Text('Kamera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Color(0xFF3B82F6)),
              title: const Text('Galeri'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );

      if (image != null && mounted) {
        context.read<ReimbursementBloc>().add(ReimbursementEvent.addFormImagePath(image.path));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error picking image: $e')));
      }
    }
  }

  void _removeImage(String imagePath) {
    context.read<ReimbursementBloc>().add(ReimbursementEvent.removeFormImagePath(imagePath));
  }

  void _showImageOptions(String imagePath) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Opsi Gambar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.visibility, color: Color(0xFF3B82F6)),
              title: const Text('Lihat Gambar'),
              onTap: () {
                Navigator.pop(context);
                _showImagePreview(imagePath);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Hapus Gambar'),
              onTap: () {
                Navigator.pop(context);
                _removeImage(imagePath);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showImagePreview(String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                title: const Text('Preview Gambar'),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              Expanded(child: Image.file(File(imagePath), fit: BoxFit.contain)),
            ],
          ),
        ),
      ),
    );
  }

  void _saveReimbursement() {
    final state = context.read<ReimbursementBloc>().state;

    if (state is ReimbursementFormState) {
      // Validate form using helper
      if (!ReimbursementFormHelper.isFormValid(state)) {
        final errorMessage = ReimbursementFormHelper.getValidationErrorMessage(state);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
        return;
      }

      // Submit the complete form data
      context.read<ReimbursementBloc>().add(const ReimbursementEvent.submitForm());

      // Close the bottom sheet
      Navigator.of(context).pop();
    }
  }
}
