import 'package:freezed_annotation/freezed_annotation.dart';

part 'reimbursement.freezed.dart';
part 'reimbursement.g.dart';

@freezed
abstract class Reimbursement with _$Reimbursement {
  const factory Reimbursement({
    required String id,
    String? name,
    String? nominal,
    String? description,
    // Additional fields for form functionality
    DateTime? date,
    String? claimType,
    String? detail,
    @Default('pending') String status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? imagePath,
    @Default([]) List<String> imagePaths,
  }) = _Reimbursement;

  factory Reimbursement.fromJson(Map<String, dynamic> json) => _$ReimbursementFromJson(json);
}
