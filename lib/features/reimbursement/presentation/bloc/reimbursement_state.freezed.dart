// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reimbursement_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReimbursementState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReimbursementState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReimbursementState()';
}


}

/// @nodoc
class $ReimbursementStateCopyWith<$Res>  {
$ReimbursementStateCopyWith(ReimbursementState _, $Res Function(ReimbursementState) __);
}


/// Adds pattern-matching-related methods to [ReimbursementState].
extension ReimbursementStatePatterns on ReimbursementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReimbursementInitial value)?  initial,TResult Function( ReimbursementLoading value)?  loading,TResult Function( ReimbursementLoaded value)?  loaded,TResult Function( ReimbursementError value)?  error,TResult Function( ReimbursementSuccess value)?  success,TResult Function( ReimbursementFormState value)?  formState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReimbursementInitial() when initial != null:
return initial(_that);case ReimbursementLoading() when loading != null:
return loading(_that);case ReimbursementLoaded() when loaded != null:
return loaded(_that);case ReimbursementError() when error != null:
return error(_that);case ReimbursementSuccess() when success != null:
return success(_that);case ReimbursementFormState() when formState != null:
return formState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReimbursementInitial value)  initial,required TResult Function( ReimbursementLoading value)  loading,required TResult Function( ReimbursementLoaded value)  loaded,required TResult Function( ReimbursementError value)  error,required TResult Function( ReimbursementSuccess value)  success,required TResult Function( ReimbursementFormState value)  formState,}){
final _that = this;
switch (_that) {
case ReimbursementInitial():
return initial(_that);case ReimbursementLoading():
return loading(_that);case ReimbursementLoaded():
return loaded(_that);case ReimbursementError():
return error(_that);case ReimbursementSuccess():
return success(_that);case ReimbursementFormState():
return formState(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReimbursementInitial value)?  initial,TResult? Function( ReimbursementLoading value)?  loading,TResult? Function( ReimbursementLoaded value)?  loaded,TResult? Function( ReimbursementError value)?  error,TResult? Function( ReimbursementSuccess value)?  success,TResult? Function( ReimbursementFormState value)?  formState,}){
final _that = this;
switch (_that) {
case ReimbursementInitial() when initial != null:
return initial(_that);case ReimbursementLoading() when loading != null:
return loading(_that);case ReimbursementLoaded() when loaded != null:
return loaded(_that);case ReimbursementError() when error != null:
return error(_that);case ReimbursementSuccess() when success != null:
return success(_that);case ReimbursementFormState() when formState != null:
return formState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Reimbursement> items)?  loaded,TResult Function( String message)?  error,TResult Function( String message)?  success,TResult Function( DateTime? selectedDate,  String? selectedClaimType,  String detail,  String nominal,  String description,  String? imagePath,  List<String> imagePaths,  Reimbursement? editingReimbursement,  bool isLoading,  List<Reimbursement> tempSubmittedList)?  formState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReimbursementInitial() when initial != null:
return initial();case ReimbursementLoading() when loading != null:
return loading();case ReimbursementLoaded() when loaded != null:
return loaded(_that.items);case ReimbursementError() when error != null:
return error(_that.message);case ReimbursementSuccess() when success != null:
return success(_that.message);case ReimbursementFormState() when formState != null:
return formState(_that.selectedDate,_that.selectedClaimType,_that.detail,_that.nominal,_that.description,_that.imagePath,_that.imagePaths,_that.editingReimbursement,_that.isLoading,_that.tempSubmittedList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Reimbursement> items)  loaded,required TResult Function( String message)  error,required TResult Function( String message)  success,required TResult Function( DateTime? selectedDate,  String? selectedClaimType,  String detail,  String nominal,  String description,  String? imagePath,  List<String> imagePaths,  Reimbursement? editingReimbursement,  bool isLoading,  List<Reimbursement> tempSubmittedList)  formState,}) {final _that = this;
switch (_that) {
case ReimbursementInitial():
return initial();case ReimbursementLoading():
return loading();case ReimbursementLoaded():
return loaded(_that.items);case ReimbursementError():
return error(_that.message);case ReimbursementSuccess():
return success(_that.message);case ReimbursementFormState():
return formState(_that.selectedDate,_that.selectedClaimType,_that.detail,_that.nominal,_that.description,_that.imagePath,_that.imagePaths,_that.editingReimbursement,_that.isLoading,_that.tempSubmittedList);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Reimbursement> items)?  loaded,TResult? Function( String message)?  error,TResult? Function( String message)?  success,TResult? Function( DateTime? selectedDate,  String? selectedClaimType,  String detail,  String nominal,  String description,  String? imagePath,  List<String> imagePaths,  Reimbursement? editingReimbursement,  bool isLoading,  List<Reimbursement> tempSubmittedList)?  formState,}) {final _that = this;
switch (_that) {
case ReimbursementInitial() when initial != null:
return initial();case ReimbursementLoading() when loading != null:
return loading();case ReimbursementLoaded() when loaded != null:
return loaded(_that.items);case ReimbursementError() when error != null:
return error(_that.message);case ReimbursementSuccess() when success != null:
return success(_that.message);case ReimbursementFormState() when formState != null:
return formState(_that.selectedDate,_that.selectedClaimType,_that.detail,_that.nominal,_that.description,_that.imagePath,_that.imagePaths,_that.editingReimbursement,_that.isLoading,_that.tempSubmittedList);case _:
  return null;

}
}

}

/// @nodoc


class ReimbursementInitial implements ReimbursementState {
  const ReimbursementInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReimbursementInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReimbursementState.initial()';
}


}




/// @nodoc


class ReimbursementLoading implements ReimbursementState {
  const ReimbursementLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReimbursementLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReimbursementState.loading()';
}


}




/// @nodoc


class ReimbursementLoaded implements ReimbursementState {
  const ReimbursementLoaded(final  List<Reimbursement> items): _items = items;
  

 final  List<Reimbursement> _items;
 List<Reimbursement> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of ReimbursementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReimbursementLoadedCopyWith<ReimbursementLoaded> get copyWith => _$ReimbursementLoadedCopyWithImpl<ReimbursementLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReimbursementLoaded&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'ReimbursementState.loaded(items: $items)';
}


}

/// @nodoc
abstract mixin class $ReimbursementLoadedCopyWith<$Res> implements $ReimbursementStateCopyWith<$Res> {
  factory $ReimbursementLoadedCopyWith(ReimbursementLoaded value, $Res Function(ReimbursementLoaded) _then) = _$ReimbursementLoadedCopyWithImpl;
@useResult
$Res call({
 List<Reimbursement> items
});




}
/// @nodoc
class _$ReimbursementLoadedCopyWithImpl<$Res>
    implements $ReimbursementLoadedCopyWith<$Res> {
  _$ReimbursementLoadedCopyWithImpl(this._self, this._then);

  final ReimbursementLoaded _self;
  final $Res Function(ReimbursementLoaded) _then;

/// Create a copy of ReimbursementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(ReimbursementLoaded(
null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Reimbursement>,
  ));
}


}

/// @nodoc


class ReimbursementError implements ReimbursementState {
  const ReimbursementError(this.message);
  

 final  String message;

/// Create a copy of ReimbursementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReimbursementErrorCopyWith<ReimbursementError> get copyWith => _$ReimbursementErrorCopyWithImpl<ReimbursementError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReimbursementError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ReimbursementState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReimbursementErrorCopyWith<$Res> implements $ReimbursementStateCopyWith<$Res> {
  factory $ReimbursementErrorCopyWith(ReimbursementError value, $Res Function(ReimbursementError) _then) = _$ReimbursementErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ReimbursementErrorCopyWithImpl<$Res>
    implements $ReimbursementErrorCopyWith<$Res> {
  _$ReimbursementErrorCopyWithImpl(this._self, this._then);

  final ReimbursementError _self;
  final $Res Function(ReimbursementError) _then;

/// Create a copy of ReimbursementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReimbursementError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReimbursementSuccess implements ReimbursementState {
  const ReimbursementSuccess(this.message);
  

 final  String message;

/// Create a copy of ReimbursementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReimbursementSuccessCopyWith<ReimbursementSuccess> get copyWith => _$ReimbursementSuccessCopyWithImpl<ReimbursementSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReimbursementSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ReimbursementState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $ReimbursementSuccessCopyWith<$Res> implements $ReimbursementStateCopyWith<$Res> {
  factory $ReimbursementSuccessCopyWith(ReimbursementSuccess value, $Res Function(ReimbursementSuccess) _then) = _$ReimbursementSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ReimbursementSuccessCopyWithImpl<$Res>
    implements $ReimbursementSuccessCopyWith<$Res> {
  _$ReimbursementSuccessCopyWithImpl(this._self, this._then);

  final ReimbursementSuccess _self;
  final $Res Function(ReimbursementSuccess) _then;

/// Create a copy of ReimbursementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ReimbursementSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReimbursementFormState implements ReimbursementState {
  const ReimbursementFormState({this.selectedDate = null, this.selectedClaimType = null, this.detail = '', this.nominal = '', this.description = '', this.imagePath = null, final  List<String> imagePaths = const [], this.editingReimbursement = null, this.isLoading = false, final  List<Reimbursement> tempSubmittedList = const []}): _imagePaths = imagePaths,_tempSubmittedList = tempSubmittedList;
  

@JsonKey() final  DateTime? selectedDate;
@JsonKey() final  String? selectedClaimType;
@JsonKey() final  String detail;
@JsonKey() final  String nominal;
@JsonKey() final  String description;
@JsonKey() final  String? imagePath;
 final  List<String> _imagePaths;
@JsonKey() List<String> get imagePaths {
  if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imagePaths);
}

@JsonKey() final  Reimbursement? editingReimbursement;
@JsonKey() final  bool isLoading;
 final  List<Reimbursement> _tempSubmittedList;
@JsonKey() List<Reimbursement> get tempSubmittedList {
  if (_tempSubmittedList is EqualUnmodifiableListView) return _tempSubmittedList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tempSubmittedList);
}


/// Create a copy of ReimbursementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReimbursementFormStateCopyWith<ReimbursementFormState> get copyWith => _$ReimbursementFormStateCopyWithImpl<ReimbursementFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReimbursementFormState&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedClaimType, selectedClaimType) || other.selectedClaimType == selectedClaimType)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.nominal, nominal) || other.nominal == nominal)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&const DeepCollectionEquality().equals(other._imagePaths, _imagePaths)&&(identical(other.editingReimbursement, editingReimbursement) || other.editingReimbursement == editingReimbursement)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._tempSubmittedList, _tempSubmittedList));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,selectedClaimType,detail,nominal,description,imagePath,const DeepCollectionEquality().hash(_imagePaths),editingReimbursement,isLoading,const DeepCollectionEquality().hash(_tempSubmittedList));

@override
String toString() {
  return 'ReimbursementState.formState(selectedDate: $selectedDate, selectedClaimType: $selectedClaimType, detail: $detail, nominal: $nominal, description: $description, imagePath: $imagePath, imagePaths: $imagePaths, editingReimbursement: $editingReimbursement, isLoading: $isLoading, tempSubmittedList: $tempSubmittedList)';
}


}

/// @nodoc
abstract mixin class $ReimbursementFormStateCopyWith<$Res> implements $ReimbursementStateCopyWith<$Res> {
  factory $ReimbursementFormStateCopyWith(ReimbursementFormState value, $Res Function(ReimbursementFormState) _then) = _$ReimbursementFormStateCopyWithImpl;
@useResult
$Res call({
 DateTime? selectedDate, String? selectedClaimType, String detail, String nominal, String description, String? imagePath, List<String> imagePaths, Reimbursement? editingReimbursement, bool isLoading, List<Reimbursement> tempSubmittedList
});


$ReimbursementCopyWith<$Res>? get editingReimbursement;

}
/// @nodoc
class _$ReimbursementFormStateCopyWithImpl<$Res>
    implements $ReimbursementFormStateCopyWith<$Res> {
  _$ReimbursementFormStateCopyWithImpl(this._self, this._then);

  final ReimbursementFormState _self;
  final $Res Function(ReimbursementFormState) _then;

/// Create a copy of ReimbursementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedDate = freezed,Object? selectedClaimType = freezed,Object? detail = null,Object? nominal = null,Object? description = null,Object? imagePath = freezed,Object? imagePaths = null,Object? editingReimbursement = freezed,Object? isLoading = null,Object? tempSubmittedList = null,}) {
  return _then(ReimbursementFormState(
selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedClaimType: freezed == selectedClaimType ? _self.selectedClaimType : selectedClaimType // ignore: cast_nullable_to_non_nullable
as String?,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,nominal: null == nominal ? _self.nominal : nominal // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,imagePaths: null == imagePaths ? _self._imagePaths : imagePaths // ignore: cast_nullable_to_non_nullable
as List<String>,editingReimbursement: freezed == editingReimbursement ? _self.editingReimbursement : editingReimbursement // ignore: cast_nullable_to_non_nullable
as Reimbursement?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tempSubmittedList: null == tempSubmittedList ? _self._tempSubmittedList : tempSubmittedList // ignore: cast_nullable_to_non_nullable
as List<Reimbursement>,
  ));
}

/// Create a copy of ReimbursementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReimbursementCopyWith<$Res>? get editingReimbursement {
    if (_self.editingReimbursement == null) {
    return null;
  }

  return $ReimbursementCopyWith<$Res>(_self.editingReimbursement!, (value) {
    return _then(_self.copyWith(editingReimbursement: value));
  });
}
}

// dart format on
