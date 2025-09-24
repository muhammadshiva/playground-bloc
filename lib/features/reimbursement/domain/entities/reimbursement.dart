import 'package:freezed_annotation/freezed_annotation.dart';

part 'reimbursement.freezed.dart';
part 'reimbursement.g.dart';

@freezed
abstract class Reimbursement with _$Reimbursement {
  const factory Reimbursement({
    required String id,
    required DateTime date,
    required String claimType,
    required String detail,
    String? name,
    @Default('pending') String status,
    DateTime? createdAt,
    DateTime? updatedAt,
    // Additional fields from bottom sheet
    String? nominal,
    String? description,
    String? imagePath,
    @Default([]) List<String> imagePaths,
  }) = _Reimbursement;

  factory Reimbursement.fromJson(Map<String, dynamic> json) => _$ReimbursementFromJson(json);
}
