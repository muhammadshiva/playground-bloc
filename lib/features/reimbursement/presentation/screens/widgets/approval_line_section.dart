import 'package:flutter/material.dart';
import 'models/approval_line_model.dart';
import 'approval_line_item.dart';
import 'section_card.dart';

class ApprovalLineSection extends StatelessWidget {
  final List<ApprovalLineModel> approvalLines;

  const ApprovalLineSection({super.key, required this.approvalLines});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Approval Line', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: approvalLines.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return ApprovalLineItem(approvalLine: approvalLines[index]);
            },
          ),
        ],
      ),
    );
  }
}
