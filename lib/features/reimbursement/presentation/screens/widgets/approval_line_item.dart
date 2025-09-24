import 'package:flutter/material.dart';
import 'models/approval_line_model.dart';

class ApprovalLineItem extends StatelessWidget {
  final ApprovalLineModel approvalLine;

  const ApprovalLineItem({super.key, required this.approvalLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: const Color(0xffE5E5E5))),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.person, size: 32),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    approvalLine.name,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    approvalLine.position,
                    style: const TextStyle(fontSize: 10, color: Color(0xff898C92)),
                  ),
                ],
              ),
              const Spacer(),
              if (approvalLine.approvedDate != null) ...[
                if (approvalLine.isApproved)
                  Row(
                    children: [
                      const Icon(Icons.check, size: 14, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(
                        approvalLine.approvedDate!,
                        style: const TextStyle(fontSize: 9, color: Colors.green),
                      ),
                    ],
                  )
                else ...[
                  const Icon(Icons.access_time, size: 14, color: Color(0xff898C92)),
                  const SizedBox(width: 4),
                  Text('Menunggu', style: const TextStyle(fontSize: 9, color: Color(0xff898C92))),
                ],
              ],
            ],
          ),
        ],
      ),
    );
  }
}
