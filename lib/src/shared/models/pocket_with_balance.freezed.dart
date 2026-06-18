// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pocket_with_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PocketWithBalance {

 String get id; String get name; int get budget;@JsonKey(name: 'is_unallocated') bool get isUnallocated; int get spent; int get remaining; String? get color; String? get icon;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of PocketWithBalance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PocketWithBalanceCopyWith<PocketWithBalance> get copyWith => _$PocketWithBalanceCopyWithImpl<PocketWithBalance>(this as PocketWithBalance, _$identity);

  /// Serializes this PocketWithBalance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PocketWithBalance&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.isUnallocated, isUnallocated) || other.isUnallocated == isUnallocated)&&(identical(other.spent, spent) || other.spent == spent)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,budget,isUnallocated,spent,remaining,color,icon,createdAt);

@override
String toString() {
  return 'PocketWithBalance(id: $id, name: $name, budget: $budget, isUnallocated: $isUnallocated, spent: $spent, remaining: $remaining, color: $color, icon: $icon, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PocketWithBalanceCopyWith<$Res>  {
  factory $PocketWithBalanceCopyWith(PocketWithBalance value, $Res Function(PocketWithBalance) _then) = _$PocketWithBalanceCopyWithImpl;
@useResult
$Res call({
 String id, String name, int budget,@JsonKey(name: 'is_unallocated') bool isUnallocated, int spent, int remaining, String? color, String? icon,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$PocketWithBalanceCopyWithImpl<$Res>
    implements $PocketWithBalanceCopyWith<$Res> {
  _$PocketWithBalanceCopyWithImpl(this._self, this._then);

  final PocketWithBalance _self;
  final $Res Function(PocketWithBalance) _then;

/// Create a copy of PocketWithBalance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? budget = null,Object? isUnallocated = null,Object? spent = null,Object? remaining = null,Object? color = freezed,Object? icon = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,isUnallocated: null == isUnallocated ? _self.isUnallocated : isUnallocated // ignore: cast_nullable_to_non_nullable
as bool,spent: null == spent ? _self.spent : spent // ignore: cast_nullable_to_non_nullable
as int,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PocketWithBalance].
extension PocketWithBalancePatterns on PocketWithBalance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PocketWithBalance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PocketWithBalance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PocketWithBalance value)  $default,){
final _that = this;
switch (_that) {
case _PocketWithBalance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PocketWithBalance value)?  $default,){
final _that = this;
switch (_that) {
case _PocketWithBalance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int budget, @JsonKey(name: 'is_unallocated')  bool isUnallocated,  int spent,  int remaining,  String? color,  String? icon, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PocketWithBalance() when $default != null:
return $default(_that.id,_that.name,_that.budget,_that.isUnallocated,_that.spent,_that.remaining,_that.color,_that.icon,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int budget, @JsonKey(name: 'is_unallocated')  bool isUnallocated,  int spent,  int remaining,  String? color,  String? icon, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PocketWithBalance():
return $default(_that.id,_that.name,_that.budget,_that.isUnallocated,_that.spent,_that.remaining,_that.color,_that.icon,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int budget, @JsonKey(name: 'is_unallocated')  bool isUnallocated,  int spent,  int remaining,  String? color,  String? icon, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PocketWithBalance() when $default != null:
return $default(_that.id,_that.name,_that.budget,_that.isUnallocated,_that.spent,_that.remaining,_that.color,_that.icon,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PocketWithBalance implements PocketWithBalance {
  const _PocketWithBalance({required this.id, required this.name, required this.budget, @JsonKey(name: 'is_unallocated') required this.isUnallocated, required this.spent, required this.remaining, this.color, this.icon, @JsonKey(name: 'created_at') this.createdAt});
  factory _PocketWithBalance.fromJson(Map<String, dynamic> json) => _$PocketWithBalanceFromJson(json);

@override final  String id;
@override final  String name;
@override final  int budget;
@override@JsonKey(name: 'is_unallocated') final  bool isUnallocated;
@override final  int spent;
@override final  int remaining;
@override final  String? color;
@override final  String? icon;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of PocketWithBalance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PocketWithBalanceCopyWith<_PocketWithBalance> get copyWith => __$PocketWithBalanceCopyWithImpl<_PocketWithBalance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PocketWithBalanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PocketWithBalance&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.isUnallocated, isUnallocated) || other.isUnallocated == isUnallocated)&&(identical(other.spent, spent) || other.spent == spent)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,budget,isUnallocated,spent,remaining,color,icon,createdAt);

@override
String toString() {
  return 'PocketWithBalance(id: $id, name: $name, budget: $budget, isUnallocated: $isUnallocated, spent: $spent, remaining: $remaining, color: $color, icon: $icon, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PocketWithBalanceCopyWith<$Res> implements $PocketWithBalanceCopyWith<$Res> {
  factory _$PocketWithBalanceCopyWith(_PocketWithBalance value, $Res Function(_PocketWithBalance) _then) = __$PocketWithBalanceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int budget,@JsonKey(name: 'is_unallocated') bool isUnallocated, int spent, int remaining, String? color, String? icon,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$PocketWithBalanceCopyWithImpl<$Res>
    implements _$PocketWithBalanceCopyWith<$Res> {
  __$PocketWithBalanceCopyWithImpl(this._self, this._then);

  final _PocketWithBalance _self;
  final $Res Function(_PocketWithBalance) _then;

/// Create a copy of PocketWithBalance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? budget = null,Object? isUnallocated = null,Object? spent = null,Object? remaining = null,Object? color = freezed,Object? icon = freezed,Object? createdAt = freezed,}) {
  return _then(_PocketWithBalance(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,isUnallocated: null == isUnallocated ? _self.isUnallocated : isUnallocated // ignore: cast_nullable_to_non_nullable
as bool,spent: null == spent ? _self.spent : spent // ignore: cast_nullable_to_non_nullable
as int,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
