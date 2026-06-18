// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_create_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CourseCreateEvent {

 CourseCreateForm get form;
/// Create a copy of CourseCreateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseCreateEventCopyWith<CourseCreateEvent> get copyWith => _$CourseCreateEventCopyWithImpl<CourseCreateEvent>(this as CourseCreateEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseCreateEvent&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,form);

@override
String toString() {
  return 'CourseCreateEvent(form: $form)';
}


}

/// @nodoc
abstract mixin class $CourseCreateEventCopyWith<$Res>  {
  factory $CourseCreateEventCopyWith(CourseCreateEvent value, $Res Function(CourseCreateEvent) _then) = _$CourseCreateEventCopyWithImpl;
@useResult
$Res call({
 CourseCreateForm form
});




}
/// @nodoc
class _$CourseCreateEventCopyWithImpl<$Res>
    implements $CourseCreateEventCopyWith<$Res> {
  _$CourseCreateEventCopyWithImpl(this._self, this._then);

  final CourseCreateEvent _self;
  final $Res Function(CourseCreateEvent) _then;

/// Create a copy of CourseCreateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? form = null,}) {
  return _then(_self.copyWith(
form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CourseCreateForm,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseCreateEvent].
extension CourseCreateEventPatterns on CourseCreateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Create value)?  create,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Create value)  create,}){
final _that = this;
switch (_that) {
case _Create():
return create(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Create value)?  create,}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CourseCreateForm form)?  create,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.form);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CourseCreateForm form)  create,}) {final _that = this;
switch (_that) {
case _Create():
return create(_that.form);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CourseCreateForm form)?  create,}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.form);case _:
  return null;

}
}

}

/// @nodoc


class _Create implements CourseCreateEvent {
  const _Create(this.form);
  

@override final  CourseCreateForm form;

/// Create a copy of CourseCreateEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.form, form) || other.form == form));
}


@override
int get hashCode => Object.hash(runtimeType,form);

@override
String toString() {
  return 'CourseCreateEvent.create(form: $form)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $CourseCreateEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@override @useResult
$Res call({
 CourseCreateForm form
});




}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of CourseCreateEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? form = null,}) {
  return _then(_Create(
null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CourseCreateForm,
  ));
}


}

// dart format on
