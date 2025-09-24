import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'section_card.dart';
import 'reimbursement_bottom_sheet.dart';
import '../../bloc/reimbursement_bloc.dart';
import '../../bloc/reimbursement_state.dart';

class EvidenceAttachmentSection extends StatelessWidget {
  final VoidCallback? onTap;
  final String? fileName;
  final double? fileSize;
  final bool isLoading;
  final String? errorMessage;

  const EvidenceAttachmentSection({
    super.key,
    this.onTap,
    this.fileName,
    this.fileSize,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReimbursementBloc, ReimbursementState>(
      builder: (context, state) {
        return SectionCard(
          child: InkWell(
            onTap: onTap ?? () => _showBottomSheet(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lampiran Bukti',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildAttachmentArea(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAttachmentArea(BuildContext context, ReimbursementState state) {
    // Check if we have images from the bloc state
    if (state is ReimbursementFormState && state.imagePaths.isNotEmpty) {
      return _buildMultipleImagesPreviewState(context, state.imagePaths);
    }

    // Fallback to single image for backward compatibility
    if (state is ReimbursementFormState && state.imagePath != null && state.imagePath!.isNotEmpty) {
      return _buildImagePreviewState(state.imagePath!);
    }

    if (isLoading) {
      return _buildLoadingState();
    }

    if (errorMessage != null) {
      return _buildErrorState();
    }

    if (fileName != null) {
      return _buildFilePreviewState();
    }

    return _buildEmptyState();
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE5E5E5)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xffEDF6FF),
            child: Icon(Icons.attach_file, size: 24, color: Color(0xff0D4E91)),
          ),
          SizedBox(height: 8),
          Text(
            'Klik untuk upload file dan isi nominal',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4),
          Text('PNG, JPG hingga 5MB', style: TextStyle(fontSize: 10, color: Color(0xff898C92))),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE5E5E5)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 8),
          Text('Uploading...', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 32, color: Colors.red),
          const SizedBox(height: 8),
          Text(
            errorMessage!,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFilePreviewState() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, size: 32, color: Colors.green),
          const SizedBox(height: 8),
          Text(
            fileName!,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          if (fileSize != null) ...[
            const SizedBox(height: 4),
            Text(
              '${(fileSize! / 1024 / 1024).toStringAsFixed(2)} MB',
              style: const TextStyle(fontSize: 10, color: Color(0xff898C92)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildImagePreviewState(String imagePath) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Stack(
        children: [
          // Image preview
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              File(imagePath),
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey.shade200,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 32, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        'Error loading image',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Success indicator overlay
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              child: const Icon(Icons.check, color: Colors.white, size: 16),
            ),
          ),
          // Tap to edit overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: const Text(
                'Tap to edit',
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMultipleImagesPreviewState(BuildContext context, List<String> imagePaths) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with count
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  '${imagePaths.length} gambar terupload',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          // Images grid
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: _buildImagesGrid(context, imagePaths),
          ),
          // Tap to edit overlay
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: const Text(
              'Tap to edit',
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesGrid(BuildContext context, List<String> imagePaths) {
    const int maxVisibleImages = 4;
    final visibleImages = imagePaths.take(maxVisibleImages).toList();
    final remainingCount = imagePaths.length - maxVisibleImages;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...visibleImages.map((imagePath) => _buildGridImageItem(context, imagePath)),
        if (remainingCount > 0) _buildMoreImagesIndicator(remainingCount),
      ],
    );
  }

  Widget _buildGridImageItem(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () => _showImagePreview(context, imagePath),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.file(
            File(imagePath),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade200,
                child: const Icon(Icons.error_outline, size: 20, color: Colors.grey),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMoreImagesIndicator(int remainingCount) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          '+$remainingCount',
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showImagePreview(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
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
                    onPressed: () => Navigator.pop(dialogContext),
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

  void _showBottomSheet(BuildContext context) {
    showBottomSheet(context: context, builder: (context) => const ReimbursementBottomSheet());
  }
}
