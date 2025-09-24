import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursement/domain/entities/reimbursement.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_bloc.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_event.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_state.dart';

class TempSubmittedListWidget extends StatelessWidget {
  const TempSubmittedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReimbursementBloc, ReimbursementState>(
      builder: (context, state) {
        return state.maybeWhen(
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
                if (tempSubmittedList.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Temporary Submitted Forms',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            context.read<ReimbursementBloc>().add(
                              const ReimbursementEvent.clearTempList(),
                            );
                          },
                          icon: const Icon(Icons.clear_all, size: 16),
                          label: const Text('Clear All'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...tempSubmittedList.map((item) => _buildTempItem(context, item)),
                    const SizedBox(height: 16),
                  ],
                );
              },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildTempItem(BuildContext context, Reimbursement item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.claimType,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Date: ${_formatDate(item.date)}',
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      if (item.nominal != null && item.nominal!.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          'Amount: ${item.nominal}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<ReimbursementBloc>().add(
                      ReimbursementEvent.removeFromTempList(item.id),
                    );
                  },
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            if (item.detail.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                item.detail,
                style: const TextStyle(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (item.description != null && item.description!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                item.description!,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (item.imagePath != null && item.imagePath!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(item.imagePath!),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.image_not_supported, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
            ],
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.shade300),
              ),
              child: const Text(
                'Temporary',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
