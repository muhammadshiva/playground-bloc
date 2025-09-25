// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reimbursement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reimbursement _$ReimbursementFromJson(Map<String, dynamic> json) =>
    _Reimbursement(
      id: json['id'] as String,
      name: json['name'] as String?,
      nominal: json['nominal'] as String?,
      description: json['description'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      claimType: json['claimType'] as String?,
      detail: json['detail'] as String?,
      status: json['status'] as String? ?? 'pending',
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      imagePath: json['imagePath'] as String?,
      imagePaths:
          (json['imagePaths'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ReimbursementToJson(_Reimbursement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nominal': instance.nominal,
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'claimType': instance.claimType,
      'detail': instance.detail,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'imagePath': instance.imagePath,
      'imagePaths': instance.imagePaths,
    };
