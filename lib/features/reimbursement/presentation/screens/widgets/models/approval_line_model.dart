class ApprovalLineModel {
  final String name;
  final String position;
  final String? approvedDate;
  final bool isApproved;

  const ApprovalLineModel({
    required this.name,
    required this.position,
    this.approvedDate,
    this.isApproved = false,
  });

  factory ApprovalLineModel.fromJson(Map<String, dynamic> json) {
    return ApprovalLineModel(
      name: json['name'] as String,
      position: json['position'] as String,
      approvedDate: json['approvedDate'] as String?,
      isApproved: json['isApproved'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'position': position,
      'approvedDate': approvedDate,
      'isApproved': isApproved,
    };
  }
}
