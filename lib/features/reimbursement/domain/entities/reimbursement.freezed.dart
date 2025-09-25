// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reimbursement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reimbursement {

 String get id; String? get name; String? get nominal; String? get description;// Additional fields for form functionality
 DateTime? get date; String? get claimType; String? get detail; String get status; DateTime? get createdAt; DateTime? get updatedAt; String? get imagePath; List<String> get imagePaths;
/// Create a copy of Reimbursement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReimbursementCopyWith<Reimbursement> get copyWith => _$ReimbursementCopyWithImpl<Reimbursement>(this as Reimbursement, _$identity);

  /// Serializes this Reimbursement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reimbursement&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nominal, nominal) || other.nominal == nominal)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.claimType, claimType) || other.claimType == claimType)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&const DeepCollectionEquality().equals(other.imagePaths, imagePaths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nominal,description,date,claimType,detail,status,createdAt,updatedAt,imagePath,const DeepCollectionEquality().hash(imagePaths));

@override
String toString() {
  return 'Reimbursement(id: $id, name: $name, nominal: $nominal, description: $description, date: $date, claimType: $claimType, detail: $detail, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, imagePath: $imagePath, imagePaths: $imagePaths)';
}


}

/// @nodoc
abstract mixin class $ReimbursementCopyWith<$Res>  {
  factory $ReimbursementCopyWith(Reimbursement value, $Res Function(Reimbursement) _then) = _$ReimbursementCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? nominal, String? description, DateTime? date, String? claimType, String? detail, String status, DateTime? createdAt, DateTime? updatedAt, String? imagePath, List<String> imagePaths
});




}
/// @nodoc
class _$ReimbursementCopyWithImpl<$Res>
    implements $ReimbursementCopyWith<$Res> {
  _$ReimbursementCopyWithImpl(this._self, this._then);

  final Reimbursement _self;
  final $Res Function(Reimbursement) _then;

/// Create a copy of Reimbursement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? nominal = freezed,Object? description = freezed,Object? date = freezed,Object? claimType = freezed,Object? detail = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? imagePath = freezed,Object? imagePaths = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,nominal: freezed == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,claimType: freezed == claimType ? _self.claimType : claimType // ignore: cast_nullable_to_non_nullable
as String?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,imagePaths: null == imagePaths ? _self.imagePaths : imagePaths // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Reimbursement].
extension ReimbursementPatterns on Reimbursement {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reimbursement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reimbursement() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reimbursement value)  $default,){
final _that = this;
switch (_that) {
case _Reimbursement():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reimbursement value)?  $default,){
final _that = this;
switch (_that) {
case _Reimbursement() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? nominal,  String? description,  DateTime? date,  String? claimType,  String? detail,  String status,  DateTime? createdAt,  DateTime? updatedAt,  String? imagePath,  List<String> imagePaths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reimbursement() when $default != null:
return $default(_that.id,_that.name,_that.nominal,_that.description,_that.date,_that.claimType,_that.detail,_that.status,_that.createdAt,_that.updatedAt,_that.imagePath,_that.imagePaths);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? nominal,  String? description,  DateTime? date,  String? claimType,  String? detail,  String status,  DateTime? createdAt,  DateTime? updatedAt,  String? imagePath,  List<String> imagePaths)  $default,) {final _that = this;
switch (_that) {
case _Reimbursement():
return $default(_that.id,_that.name,_that.nominal,_that.description,_that.date,_that.claimType,_that.detail,_that.status,_that.createdAt,_that.updatedAt,_that.imagePath,_that.imagePaths);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? nominal,  String? description,  DateTime? date,  String? claimType,  String? detail,  String status,  DateTime? createdAt,  DateTime? updatedAt,  String? imagePath,  List<String> imagePaths)?  $default,) {final _that = this;
switch (_that) {
case _Reimbursement() when $default != null:
return $default(_that.id,_that.name,_that.nominal,_that.description,_that.date,_that.claimType,_that.detail,_that.status,_that.createdAt,_that.updatedAt,_that.imagePath,_that.imagePaths);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reimbursement implements Reimbursement {
  const _Reimbursement({required this.id, this.name, this.nominal, this.description, this.date, this.claimType, this.detail, this.status = 'pending', this.createdAt, this.updatedAt, this.imagePath, final  List<String> imagePaths = const []}): _imagePaths = imagePaths;
  factory _Reimbursement.fromJson(Map<String, dynamic> json) => _$ReimbursementFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? nominal;
@override final  String? description;
// Additional fields for form functionality
@override final  DateTime? date;
@override final  String? claimType;
@override final  String? detail;
@override@JsonKey() final  String status;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  String? imagePath;
 final  List<String> _imagePaths;
@override@JsonKey() List<String> get imagePaths {
  if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imagePaths);
}


/// Create a copy of Reimbursement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReimbursementCopyWith<_Reimbursement> get copyWith => __$ReimbursementCopyWithImpl<_Reimbursement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReimbursementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reimbursement&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nominal, nominal) || other.nominal == nominal)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.claimType, claimType) || other.claimType == claimType)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&const DeepCollectionEquality().equals(other._imagePaths, _imagePaths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nominal,description,date,claimType,detail,status,createdAt,updatedAt,imagePath,const DeepCollectionEquality().hash(_imagePaths));

@override
String toString() {
  return 'Reimbursement(id: $id, name: $name, nominal: $nominal, description: $description, date: $date, claimType: $claimType, detail: $detail, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, imagePath: $imagePath, imagePaths: $imagePaths)';
}


}

/// @nodoc
abstract mixin class _$ReimbursementCopyWith<$Res> implements $ReimbursementCopyWith<$Res> {
  factory _$ReimbursementCopyWith(_Reimbursement value, $Res Function(_Reimbursement) _then) = __$ReimbursementCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? nominal, String? description, DateTime? date, String? claimType, String? detail, String status, DateTime? createdAt, DateTime? updatedAt, String? imagePath, List<String> imagePaths
});




}
/// @nodoc
class __$ReimbursementCopyWithImpl<$Res>
    implements _$ReimbursementCopyWith<$Res> {
  __$ReimbursementCopyWithImpl(this._self, this._then);

  final _Reimbursement _self;
  final $Res Function(_Reimbursement) _then;

/// Create a copy of Reimbursement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? nominal = freezed,Object? description = freezed,Object? date = freezed,Object? claimType = freezed,Object? detail = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? imagePath = freezed,Object? imagePaths = null,}) {
  return _then(_Reimbursement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,nominal: freezed == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,claimType: freezed == claimType ? _self.claimType : claimType // ignore: cast_nullable_to_non_nullable
as String?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,imagePaths: null == imagePaths ? _self._imagePaths : imagePaths // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
