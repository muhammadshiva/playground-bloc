// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoEvent()';
}


}

/// @nodoc
class $TodoEventCopyWith<$Res>  {
$TodoEventCopyWith(TodoEvent _, $Res Function(TodoEvent) __);
}


/// Adds pattern-matching-related methods to [TodoEvent].
extension TodoEventPatterns on TodoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTodos value)?  loadTodos,TResult Function( CreateTodo value)?  createTodo,TResult Function( UpdateTodo value)?  updateTodo,TResult Function( DeleteTodo value)?  deleteTodo,TResult Function( ToggleTodoCompletion value)?  toggleTodoCompletion,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTodos() when loadTodos != null:
return loadTodos(_that);case CreateTodo() when createTodo != null:
return createTodo(_that);case UpdateTodo() when updateTodo != null:
return updateTodo(_that);case DeleteTodo() when deleteTodo != null:
return deleteTodo(_that);case ToggleTodoCompletion() when toggleTodoCompletion != null:
return toggleTodoCompletion(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTodos value)  loadTodos,required TResult Function( CreateTodo value)  createTodo,required TResult Function( UpdateTodo value)  updateTodo,required TResult Function( DeleteTodo value)  deleteTodo,required TResult Function( ToggleTodoCompletion value)  toggleTodoCompletion,}){
final _that = this;
switch (_that) {
case LoadTodos():
return loadTodos(_that);case CreateTodo():
return createTodo(_that);case UpdateTodo():
return updateTodo(_that);case DeleteTodo():
return deleteTodo(_that);case ToggleTodoCompletion():
return toggleTodoCompletion(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTodos value)?  loadTodos,TResult? Function( CreateTodo value)?  createTodo,TResult? Function( UpdateTodo value)?  updateTodo,TResult? Function( DeleteTodo value)?  deleteTodo,TResult? Function( ToggleTodoCompletion value)?  toggleTodoCompletion,}){
final _that = this;
switch (_that) {
case LoadTodos() when loadTodos != null:
return loadTodos(_that);case CreateTodo() when createTodo != null:
return createTodo(_that);case UpdateTodo() when updateTodo != null:
return updateTodo(_that);case DeleteTodo() when deleteTodo != null:
return deleteTodo(_that);case ToggleTodoCompletion() when toggleTodoCompletion != null:
return toggleTodoCompletion(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTodos,TResult Function( String title,  String description)?  createTodo,TResult Function( Todo todo)?  updateTodo,TResult Function( int id)?  deleteTodo,TResult Function( Todo todo)?  toggleTodoCompletion,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTodos() when loadTodos != null:
return loadTodos();case CreateTodo() when createTodo != null:
return createTodo(_that.title,_that.description);case UpdateTodo() when updateTodo != null:
return updateTodo(_that.todo);case DeleteTodo() when deleteTodo != null:
return deleteTodo(_that.id);case ToggleTodoCompletion() when toggleTodoCompletion != null:
return toggleTodoCompletion(_that.todo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTodos,required TResult Function( String title,  String description)  createTodo,required TResult Function( Todo todo)  updateTodo,required TResult Function( int id)  deleteTodo,required TResult Function( Todo todo)  toggleTodoCompletion,}) {final _that = this;
switch (_that) {
case LoadTodos():
return loadTodos();case CreateTodo():
return createTodo(_that.title,_that.description);case UpdateTodo():
return updateTodo(_that.todo);case DeleteTodo():
return deleteTodo(_that.id);case ToggleTodoCompletion():
return toggleTodoCompletion(_that.todo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTodos,TResult? Function( String title,  String description)?  createTodo,TResult? Function( Todo todo)?  updateTodo,TResult? Function( int id)?  deleteTodo,TResult? Function( Todo todo)?  toggleTodoCompletion,}) {final _that = this;
switch (_that) {
case LoadTodos() when loadTodos != null:
return loadTodos();case CreateTodo() when createTodo != null:
return createTodo(_that.title,_that.description);case UpdateTodo() when updateTodo != null:
return updateTodo(_that.todo);case DeleteTodo() when deleteTodo != null:
return deleteTodo(_that.id);case ToggleTodoCompletion() when toggleTodoCompletion != null:
return toggleTodoCompletion(_that.todo);case _:
  return null;

}
}

}

/// @nodoc


class LoadTodos implements TodoEvent {
  const LoadTodos();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTodos);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoEvent.loadTodos()';
}


}




/// @nodoc


class CreateTodo implements TodoEvent {
  const CreateTodo({required this.title, required this.description});
  

 final  String title;
 final  String description;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTodoCopyWith<CreateTodo> get copyWith => _$CreateTodoCopyWithImpl<CreateTodo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTodo&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'TodoEvent.createTodo(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateTodoCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $CreateTodoCopyWith(CreateTodo value, $Res Function(CreateTodo) _then) = _$CreateTodoCopyWithImpl;
@useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class _$CreateTodoCopyWithImpl<$Res>
    implements $CreateTodoCopyWith<$Res> {
  _$CreateTodoCopyWithImpl(this._self, this._then);

  final CreateTodo _self;
  final $Res Function(CreateTodo) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,}) {
  return _then(CreateTodo(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateTodo implements TodoEvent {
  const UpdateTodo(this.todo);
  

 final  Todo todo;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTodoCopyWith<UpdateTodo> get copyWith => _$UpdateTodoCopyWithImpl<UpdateTodo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTodo&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,todo);

@override
String toString() {
  return 'TodoEvent.updateTodo(todo: $todo)';
}


}

/// @nodoc
abstract mixin class $UpdateTodoCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $UpdateTodoCopyWith(UpdateTodo value, $Res Function(UpdateTodo) _then) = _$UpdateTodoCopyWithImpl;
@useResult
$Res call({
 Todo todo
});


$TodoCopyWith<$Res> get todo;

}
/// @nodoc
class _$UpdateTodoCopyWithImpl<$Res>
    implements $UpdateTodoCopyWith<$Res> {
  _$UpdateTodoCopyWithImpl(this._self, this._then);

  final UpdateTodo _self;
  final $Res Function(UpdateTodo) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todo = null,}) {
  return _then(UpdateTodo(
null == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as Todo,
  ));
}

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoCopyWith<$Res> get todo {
  
  return $TodoCopyWith<$Res>(_self.todo, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}

/// @nodoc


class DeleteTodo implements TodoEvent {
  const DeleteTodo(this.id);
  

 final  int id;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteTodoCopyWith<DeleteTodo> get copyWith => _$DeleteTodoCopyWithImpl<DeleteTodo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteTodo&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TodoEvent.deleteTodo(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteTodoCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $DeleteTodoCopyWith(DeleteTodo value, $Res Function(DeleteTodo) _then) = _$DeleteTodoCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteTodoCopyWithImpl<$Res>
    implements $DeleteTodoCopyWith<$Res> {
  _$DeleteTodoCopyWithImpl(this._self, this._then);

  final DeleteTodo _self;
  final $Res Function(DeleteTodo) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteTodo(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ToggleTodoCompletion implements TodoEvent {
  const ToggleTodoCompletion(this.todo);
  

 final  Todo todo;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleTodoCompletionCopyWith<ToggleTodoCompletion> get copyWith => _$ToggleTodoCompletionCopyWithImpl<ToggleTodoCompletion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleTodoCompletion&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,todo);

@override
String toString() {
  return 'TodoEvent.toggleTodoCompletion(todo: $todo)';
}


}

/// @nodoc
abstract mixin class $ToggleTodoCompletionCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $ToggleTodoCompletionCopyWith(ToggleTodoCompletion value, $Res Function(ToggleTodoCompletion) _then) = _$ToggleTodoCompletionCopyWithImpl;
@useResult
$Res call({
 Todo todo
});


$TodoCopyWith<$Res> get todo;

}
/// @nodoc
class _$ToggleTodoCompletionCopyWithImpl<$Res>
    implements $ToggleTodoCompletionCopyWith<$Res> {
  _$ToggleTodoCompletionCopyWithImpl(this._self, this._then);

  final ToggleTodoCompletion _self;
  final $Res Function(ToggleTodoCompletion) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todo = null,}) {
  return _then(ToggleTodoCompletion(
null == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as Todo,
  ));
}

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoCopyWith<$Res> get todo {
  
  return $TodoCopyWith<$Res>(_self.todo, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}

// dart format on
