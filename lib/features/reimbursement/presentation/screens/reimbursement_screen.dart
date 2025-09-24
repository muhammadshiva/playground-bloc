import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_bloc.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_event.dart';
import 'package:playground_bloc/features/reimbursement/presentation/bloc/reimbursement_state.dart';
import 'package:playground_bloc/features/reimbursement/domain/entities/reimbursement.dart';
import 'package:playground_bloc/features/reimbursement/presentation/screens/widgets/widgets.dart';
import 'package:playground_bloc/features/reimbursement/presentation/screens/reimbursement_form_screen.dart';

class ReimbursementScreen extends StatefulWidget {
  const ReimbursementScreen({super.key});

  @override
  State<ReimbursementScreen> createState() => _ReimbursementScreenState();
}

class _ReimbursementScreenState extends State<ReimbursementScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger data loading when screen is first displayed
    context.read<ReimbursementBloc>().add(const ReimbursementEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F2F5),
      appBar: const GradientAppBar(title: 'Daftar Reimbursement'),
      body: BlocBuilder<ReimbursementBloc, ReimbursementState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildEmptyState(context),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (items) => _buildReimbursementList(context, items),
            error: (message) => _buildErrorState(context, message),
            success: (message) => _buildEmptyState(context),
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
                ) => _buildEmptyState(context),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToFormScreen(context),
        backgroundColor: const Color(0xFF2C3E50),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF2C3E50).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.receipt_long_outlined,
                size: 64,
                color: const Color(0xFF2C3E50).withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Belum ada reimbursement',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Text(
              'Mulai dengan menambahkan reimbursement baru untuk melacak pengeluaran Anda',
              style: TextStyle(fontSize: 14, color: Colors.grey[500], height: 1.4),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReimbursementList(BuildContext context, List<Reimbursement> items) {
    if (items.isEmpty) {
      return _buildEmptyState(context);
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ReimbursementBloc>().add(const ReimbursementEvent.started());
      },
      child: Column(
        children: [
          _buildStatsHeader(items),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return _buildReimbursementCard(context, item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsHeader(List<Reimbursement> items) {
    final approved = items.where((item) => item.status == 'approved').length;
    final pending = items.where((item) => item.status == 'pending').length;
    final rejected = items.where((item) => item.status == 'rejected').length;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ringkasan Reimbursement',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Disetujui',
                  approved.toString(),
                  const Color(0xFF10B981),
                  Icons.check_circle_outline,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Menunggu',
                  pending.toString(),
                  const Color(0xFFF59E0B),
                  Icons.schedule_outlined,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Ditolak',
                  rejected.toString(),
                  const Color(0xFFEF4444),
                  Icons.cancel_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildReimbursementCard(BuildContext context, Reimbursement item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: SectionCard(
        child: InkWell(
          onTap: () => _navigateToFormScreen(context, item),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with status and actions
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getStatusColor(item.status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _getStatusColor(item.status).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: _getStatusColor(item.status),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _getStatusText(item.status),
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: _getStatusColor(item.status),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        switch (value) {
                          case 'edit':
                            _navigateToFormScreen(context, item);
                            break;
                          case 'delete':
                            _deleteReimbursement(context, item.id);
                            break;
                        }
                      },
                      icon: Icon(Icons.more_vert, color: Colors.grey[600], size: 20),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(Icons.edit_outlined, size: 18, color: Colors.blue),
                              SizedBox(width: 12),
                              Text('Edit'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete_outline, size: 18, color: Colors.red),
                              SizedBox(width: 12),
                              Text('Hapus'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Claim type with icon
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _getClaimTypeColor(item.claimType).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        _getClaimTypeIcon(item.claimType),
                        size: 16,
                        color: _getClaimTypeColor(item.claimType),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.claimType,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Detail description
                Text(
                  item.detail,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.4),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),

                // Footer with date and name
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 6),
                    Text(
                      _formatDate(item.date),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    if (item.name != null) ...[
                      Icon(Icons.person_outline, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        item.name!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),

                // Updated timestamp if available
                if (item.updatedAt != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.update_outlined, size: 12, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        'Diperbarui ${_formatDate(item.updatedAt!)}',
                        style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () =>
                context.read<ReimbursementBloc>().add(const ReimbursementEvent.started()),
            child: const Text('Coba Lagi'),
          ),
        ],
      ),
    );
  }

  void _navigateToFormScreen(BuildContext context, [Reimbursement? item]) {
    // Store reference to bloc before navigation to avoid accessing deactivated widget
    final bloc = context.read<ReimbursementBloc>();

    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => const ReimbursementFormScreen(),
            settings: RouteSettings(arguments: item),
          ),
        )
        .then((result) {
          // Always refresh the list when returning from form screen
          // This ensures the list is displayed even if user just navigates back without submitting
          if (mounted) {
            bloc.add(const ReimbursementEvent.started());
          }
        });
  }

  void _deleteReimbursement(BuildContext context, String id) {
    print('Delete dialog triggered for ID: $id');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: Text('Apakah Anda yakin ingin menghapus reimbursement dengan ID: $id?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Batal')),
          TextButton(
            onPressed: () {
              print('User confirmed deletion for ID: $id');
              Navigator.of(context).pop();
              context.read<ReimbursementBloc>().add(ReimbursementEvent.delete(id));
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return const Color(0xFF10B981); // Green
      case 'pending':
        return const Color(0xFFF59E0B); // Amber
      case 'rejected':
        return const Color(0xFFEF4444); // Red
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return 'Disetujui';
      case 'pending':
        return 'Menunggu';
      case 'rejected':
        return 'Ditolak';
      default:
        return status.toUpperCase();
    }
  }

  Color _getClaimTypeColor(String claimType) {
    switch (claimType) {
      case 'Transportasi':
        return const Color(0xFF3B82F6); // Blue
      case 'Makan & Minum':
        return const Color(0xFFEF4444); // Red
      case 'Akomodasi':
        return const Color(0xFF8B5CF6); // Purple
      case 'Komunikasi':
        return const Color(0xFF10B981); // Green
      case 'Lainnya':
        return const Color(0xFF6B7280); // Gray
      default:
        return const Color(0xFF6B7280);
    }
  }

  IconData _getClaimTypeIcon(String claimType) {
    switch (claimType) {
      case 'Transportasi':
        return Icons.directions_car_outlined;
      case 'Makan & Minum':
        return Icons.restaurant_outlined;
      case 'Akomodasi':
        return Icons.hotel_outlined;
      case 'Komunikasi':
        return Icons.phone_outlined;
      case 'Lainnya':
        return Icons.category_outlined;
      default:
        return Icons.category_outlined;
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
