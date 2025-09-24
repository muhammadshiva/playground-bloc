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

 String get id; DateTime get date; String get claimType; String get detail; String? get name; String get status; DateTime? get createdAt; DateTime? get updatedAt;// Additional fields from bottom sheet
 String? get nominal; String? get description; String? get imagePath; List<String> get imagePaths;
/// Create a copy of Reimbursement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReimbursementCopyWith<Reimbursement> get copyWith => _$ReimbursementCopyWithImpl<Reimbursement>(this as Reimbursement, _$identity);

  /// Serializes this Reimbursement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reimbursement&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.claimType, claimType) || other.claimType == claimType)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.nominal, nominal) || other.nominal == nominal)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&const DeepCollectionEquality().equals(other.imagePaths, imagePaths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,claimType,detail,name,status,createdAt,updatedAt,nominal,description,imagePath,const DeepCollectionEquality().hash(imagePaths));

@override
String toString() {
  return 'Reimbursement(id: $id, date: $date, claimType: $claimType, detail: $detail, name: $name, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, nominal: $nominal, description: $description, imagePath: $imagePath, imagePaths: $imagePaths)';
}


}

/// @nodoc
abstract mixin class $ReimbursementCopyWith<$Res>  {
  factory $ReimbursementCopyWith(Reimbursement value, $Res Function(Reimbursement) _then) = _$ReimbursementCopyWithImpl;
@useResult
$Res call({
 String id, DateTime date, String claimType, String detail, String? name, String status, DateTime? createdAt, DateTime? updatedAt, String? nominal, String? description, String? imagePath, List<String> imagePaths
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? claimType = null,Object? detail = null,Object? name = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? nominal = freezed,Object? description = freezed,Object? imagePath = freezed,Object? imagePaths = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,claimType: null == claimType ? _self.claimType : claimType // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nominal: freezed == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime date,  String claimType,  String detail,  String? name,  String status,  DateTime? createdAt,  DateTime? updatedAt,  String? nominal,  String? description,  String? imagePath,  List<String> imagePaths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reimbursement() when $default != null:
return $default(_that.id,_that.date,_that.claimType,_that.detail,_that.name,_that.status,_that.createdAt,_that.updatedAt,_that.nominal,_that.description,_that.imagePath,_that.imagePaths);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime date,  String claimType,  String detail,  String? name,  String status,  DateTime? createdAt,  DateTime? updatedAt,  String? nominal,  String? description,  String? imagePath,  List<String> imagePaths)  $default,) {final _that = this;
switch (_that) {
case _Reimbursement():
return $default(_that.id,_that.date,_that.claimType,_that.detail,_that.name,_that.status,_that.createdAt,_that.updatedAt,_that.nominal,_that.description,_that.imagePath,_that.imagePaths);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime date,  String claimType,  String detail,  String? name,  String status,  DateTime? createdAt,  DateTime? updatedAt,  String? nominal,  String? description,  String? imagePath,  List<String> imagePaths)?  $default,) {final _that = this;
switch (_that) {
case _Reimbursement() when $default != null:
return $default(_that.id,_that.date,_that.claimType,_that.detail,_that.name,_that.status,_that.createdAt,_that.updatedAt,_that.nominal,_that.description,_that.imagePath,_that.imagePaths);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reimbursement implements Reimbursement {
  const _Reimbursement({required this.id, required this.date, required this.claimType, required this.detail, this.name, this.status = 'pending', this.createdAt, this.updatedAt, this.nominal, this.description, this.imagePath, final  List<String> imagePaths = const []}): _imagePaths = imagePaths;
  factory _Reimbursement.fromJson(Map<String, dynamic> json) => _$ReimbursementFromJson(json);

@override final  String id;
@override final  DateTime date;
@override final  String claimType;
@override final  String detail;
@override final  String? name;
@override@JsonKey() final  String status;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
// Additional fields from bottom sheet
@override final  String? nominal;
@override final  String? description;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reimbursement&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.claimType, claimType) || other.claimType == claimType)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.nominal, nominal) || other.nominal == nominal)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&const DeepCollectionEquality().equals(other._imagePaths, _imagePaths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,claimType,detail,name,status,createdAt,updatedAt,nominal,description,imagePath,const DeepCollectionEquality().hash(_imagePaths));

@override
String toString() {
  return 'Reimbursement(id: $id, date: $date, claimType: $claimType, detail: $detail, name: $name, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, nominal: $nominal, description: $description, imagePath: $imagePath, imagePaths: $imagePaths)';
}


}

/// @nodoc
abstract mixin class _$ReimbursementCopyWith<$Res> implements $ReimbursementCopyWith<$Res> {
  factory _$ReimbursementCopyWith(_Reimbursement value, $Res Function(_Reimbursement) _then) = __$ReimbursementCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime date, String claimType, String detail, String? name, String status, DateTime? createdAt, DateTime? updatedAt, String? nominal, String? description, String? imagePath, List<String> imagePaths
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? claimType = null,Object? detail = null,Object? name = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? nominal = freezed,Object? description = freezed,Object? imagePath = freezed,Object? imagePaths = null,}) {
  return _then(_Reimbursement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,claimType: null == claimType ? _self.claimType : claimType // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nominal: freezed == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,imagePaths: null == imagePaths ? _self._imagePaths : imagePaths // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
