// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeStarted value)?  started,TResult Function( HomeCreate value)?  create,TResult Function( HomeUpdate value)?  update,TResult Function( HomeDelete value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started(_that);case HomeCreate() when create != null:
return create(_that);case HomeUpdate() when update != null:
return update(_that);case HomeDelete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeStarted value)  started,required TResult Function( HomeCreate value)  create,required TResult Function( HomeUpdate value)  update,required TResult Function( HomeDelete value)  delete,}){
final _that = this;
switch (_that) {
case HomeStarted():
return started(_that);case HomeCreate():
return create(_that);case HomeUpdate():
return update(_that);case HomeDelete():
return delete(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeStarted value)?  started,TResult? Function( HomeCreate value)?  create,TResult? Function( HomeUpdate value)?  update,TResult? Function( HomeDelete value)?  delete,}){
final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started(_that);case HomeCreate() when create != null:
return create(_that);case HomeUpdate() when update != null:
return update(_that);case HomeDelete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( Home item)?  create,TResult Function( Home item)?  update,TResult Function( String id)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started();case HomeCreate() when create != null:
return create(_that.item);case HomeUpdate() when update != null:
return update(_that.item);case HomeDelete() when delete != null:
return delete(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( Home item)  create,required TResult Function( Home item)  update,required TResult Function( String id)  delete,}) {final _that = this;
switch (_that) {
case HomeStarted():
return started();case HomeCreate():
return create(_that.item);case HomeUpdate():
return update(_that.item);case HomeDelete():
return delete(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( Home item)?  create,TResult? Function( Home item)?  update,TResult? Function( String id)?  delete,}) {final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started();case HomeCreate() when create != null:
return create(_that.item);case HomeUpdate() when update != null:
return update(_that.item);case HomeDelete() when delete != null:
return delete(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class HomeStarted implements HomeEvent {
  const HomeStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.started()';
}


}




/// @nodoc


class HomeCreate implements HomeEvent {
  const HomeCreate(this.item);
  

 final  Home item;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeCreateCopyWith<HomeCreate> get copyWith => _$HomeCreateCopyWithImpl<HomeCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeCreate&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'HomeEvent.create(item: $item)';
}


}

/// @nodoc
abstract mixin class $HomeCreateCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeCreateCopyWith(HomeCreate value, $Res Function(HomeCreate) _then) = _$HomeCreateCopyWithImpl;
@useResult
$Res call({
 Home item
});


$HomeCopyWith<$Res> get item;

}
/// @nodoc
class _$HomeCreateCopyWithImpl<$Res>
    implements $HomeCreateCopyWith<$Res> {
  _$HomeCreateCopyWithImpl(this._self, this._then);

  final HomeCreate _self;
  final $Res Function(HomeCreate) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(HomeCreate(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Home,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeCopyWith<$Res> get item {
  
  return $HomeCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class HomeUpdate implements HomeEvent {
  const HomeUpdate(this.item);
  

 final  Home item;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeUpdateCopyWith<HomeUpdate> get copyWith => _$HomeUpdateCopyWithImpl<HomeUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeUpdate&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'HomeEvent.update(item: $item)';
}


}

/// @nodoc
abstract mixin class $HomeUpdateCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeUpdateCopyWith(HomeUpdate value, $Res Function(HomeUpdate) _then) = _$HomeUpdateCopyWithImpl;
@useResult
$Res call({
 Home item
});


$HomeCopyWith<$Res> get item;

}
/// @nodoc
class _$HomeUpdateCopyWithImpl<$Res>
    implements $HomeUpdateCopyWith<$Res> {
  _$HomeUpdateCopyWithImpl(this._self, this._then);

  final HomeUpdate _self;
  final $Res Function(HomeUpdate) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(HomeUpdate(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as Home,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeCopyWith<$Res> get item {
  
  return $HomeCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class HomeDelete implements HomeEvent {
  const HomeDelete(this.id);
  

 final  String id;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDeleteCopyWith<HomeDelete> get copyWith => _$HomeDeleteCopyWithImpl<HomeDelete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDelete&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'HomeEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class $HomeDeleteCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeDeleteCopyWith(HomeDelete value, $Res Function(HomeDelete) _then) = _$HomeDeleteCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$HomeDeleteCopyWithImpl<$Res>
    implements $HomeDeleteCopyWith<$Res> {
  _$HomeDeleteCopyWithImpl(this._self, this._then);

  final HomeDelete _self;
  final $Res Function(HomeDelete) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(HomeDelete(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
