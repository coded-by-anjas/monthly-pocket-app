// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncomeResponse {

 String get id; int get amount; int get year; int get month;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of IncomeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeResponseCopyWith<IncomeResponse> get copyWith => _$IncomeResponseCopyWithImpl<IncomeResponse>(this as IncomeResponse, _$identity);

  /// Serializes this IncomeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,year,month,createdAt);

@override
String toString() {
  return 'IncomeResponse(id: $id, amount: $amount, year: $year, month: $month, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $IncomeResponseCopyWith<$Res>  {
  factory $IncomeResponseCopyWith(IncomeResponse value, $Res Function(IncomeResponse) _then) = _$IncomeResponseCopyWithImpl;
@useResult
$Res call({
 String id, int amount, int year, int month,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$IncomeResponseCopyWithImpl<$Res>
    implements $IncomeResponseCopyWith<$Res> {
  _$IncomeResponseCopyWithImpl(this._self, this._then);

  final IncomeResponse _self;
  final $Res Function(IncomeResponse) _then;

/// Create a copy of IncomeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? year = null,Object? month = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomeResponse].
extension IncomeResponsePatterns on IncomeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeResponse value)  $default,){
final _that = this;
switch (_that) {
case _IncomeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int amount,  int year,  int month, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeResponse() when $default != null:
return $default(_that.id,_that.amount,_that.year,_that.month,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int amount,  int year,  int month, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _IncomeResponse():
return $default(_that.id,_that.amount,_that.year,_that.month,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int amount,  int year,  int month, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _IncomeResponse() when $default != null:
return $default(_that.id,_that.amount,_that.year,_that.month,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomeResponse implements IncomeResponse {
  const _IncomeResponse({required this.id, required this.amount, required this.year, required this.month, @JsonKey(name: 'created_at') this.createdAt});
  factory _IncomeResponse.fromJson(Map<String, dynamic> json) => _$IncomeResponseFromJson(json);

@override final  String id;
@override final  int amount;
@override final  int year;
@override final  int month;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of IncomeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeResponseCopyWith<_IncomeResponse> get copyWith => __$IncomeResponseCopyWithImpl<_IncomeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,year,month,createdAt);

@override
String toString() {
  return 'IncomeResponse(id: $id, amount: $amount, year: $year, month: $month, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$IncomeResponseCopyWith<$Res> implements $IncomeResponseCopyWith<$Res> {
  factory _$IncomeResponseCopyWith(_IncomeResponse value, $Res Function(_IncomeResponse) _then) = __$IncomeResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, int amount, int year, int month,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$IncomeResponseCopyWithImpl<$Res>
    implements _$IncomeResponseCopyWith<$Res> {
  __$IncomeResponseCopyWithImpl(this._self, this._then);

  final _IncomeResponse _self;
  final $Res Function(_IncomeResponse) _then;

/// Create a copy of IncomeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? year = null,Object? month = null,Object? createdAt = freezed,}) {
  return _then(_IncomeResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
