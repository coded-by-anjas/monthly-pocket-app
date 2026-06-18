// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_with_names.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseWithNames {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'pocket_id') String get pocketId;@JsonKey(name: 'category_id') String get categoryId; int get amount;@JsonKey(name: 'expense_date') String get expenseDate; String? get note;@JsonKey(name: 'payment_method') String? get paymentMethod;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'deleted_at') String? get deletedAt;// Joined fields — may be null if pocket/category was soft-deleted
 PocketRef? get pockets; CategoryRef? get categories;
/// Create a copy of ExpenseWithNames
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseWithNamesCopyWith<ExpenseWithNames> get copyWith => _$ExpenseWithNamesCopyWithImpl<ExpenseWithNames>(this as ExpenseWithNames, _$identity);

  /// Serializes this ExpenseWithNames to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseWithNames&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pocketId, pocketId) || other.pocketId == pocketId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.pockets, pockets) || other.pockets == pockets)&&(identical(other.categories, categories) || other.categories == categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,pocketId,categoryId,amount,expenseDate,note,paymentMethod,createdAt,deletedAt,pockets,categories);

@override
String toString() {
  return 'ExpenseWithNames(id: $id, userId: $userId, pocketId: $pocketId, categoryId: $categoryId, amount: $amount, expenseDate: $expenseDate, note: $note, paymentMethod: $paymentMethod, createdAt: $createdAt, deletedAt: $deletedAt, pockets: $pockets, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ExpenseWithNamesCopyWith<$Res>  {
  factory $ExpenseWithNamesCopyWith(ExpenseWithNames value, $Res Function(ExpenseWithNames) _then) = _$ExpenseWithNamesCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'pocket_id') String pocketId,@JsonKey(name: 'category_id') String categoryId, int amount,@JsonKey(name: 'expense_date') String expenseDate, String? note,@JsonKey(name: 'payment_method') String? paymentMethod,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt, PocketRef? pockets, CategoryRef? categories
});


$PocketRefCopyWith<$Res>? get pockets;$CategoryRefCopyWith<$Res>? get categories;

}
/// @nodoc
class _$ExpenseWithNamesCopyWithImpl<$Res>
    implements $ExpenseWithNamesCopyWith<$Res> {
  _$ExpenseWithNamesCopyWithImpl(this._self, this._then);

  final ExpenseWithNames _self;
  final $Res Function(ExpenseWithNames) _then;

/// Create a copy of ExpenseWithNames
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? pocketId = null,Object? categoryId = null,Object? amount = null,Object? expenseDate = null,Object? note = freezed,Object? paymentMethod = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,Object? pockets = freezed,Object? categories = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pocketId: null == pocketId ? _self.pocketId : pocketId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,pockets: freezed == pockets ? _self.pockets : pockets // ignore: cast_nullable_to_non_nullable
as PocketRef?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as CategoryRef?,
  ));
}
/// Create a copy of ExpenseWithNames
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PocketRefCopyWith<$Res>? get pockets {
    if (_self.pockets == null) {
    return null;
  }

  return $PocketRefCopyWith<$Res>(_self.pockets!, (value) {
    return _then(_self.copyWith(pockets: value));
  });
}/// Create a copy of ExpenseWithNames
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryRefCopyWith<$Res>? get categories {
    if (_self.categories == null) {
    return null;
  }

  return $CategoryRefCopyWith<$Res>(_self.categories!, (value) {
    return _then(_self.copyWith(categories: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExpenseWithNames].
extension ExpenseWithNamesPatterns on ExpenseWithNames {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseWithNames value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseWithNames() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseWithNames value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseWithNames():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseWithNames value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseWithNames() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'pocket_id')  String pocketId, @JsonKey(name: 'category_id')  String categoryId,  int amount, @JsonKey(name: 'expense_date')  String expenseDate,  String? note, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt,  PocketRef? pockets,  CategoryRef? categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseWithNames() when $default != null:
return $default(_that.id,_that.userId,_that.pocketId,_that.categoryId,_that.amount,_that.expenseDate,_that.note,_that.paymentMethod,_that.createdAt,_that.deletedAt,_that.pockets,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'pocket_id')  String pocketId, @JsonKey(name: 'category_id')  String categoryId,  int amount, @JsonKey(name: 'expense_date')  String expenseDate,  String? note, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt,  PocketRef? pockets,  CategoryRef? categories)  $default,) {final _that = this;
switch (_that) {
case _ExpenseWithNames():
return $default(_that.id,_that.userId,_that.pocketId,_that.categoryId,_that.amount,_that.expenseDate,_that.note,_that.paymentMethod,_that.createdAt,_that.deletedAt,_that.pockets,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'pocket_id')  String pocketId, @JsonKey(name: 'category_id')  String categoryId,  int amount, @JsonKey(name: 'expense_date')  String expenseDate,  String? note, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt,  PocketRef? pockets,  CategoryRef? categories)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseWithNames() when $default != null:
return $default(_that.id,_that.userId,_that.pocketId,_that.categoryId,_that.amount,_that.expenseDate,_that.note,_that.paymentMethod,_that.createdAt,_that.deletedAt,_that.pockets,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseWithNames implements ExpenseWithNames {
  const _ExpenseWithNames({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'pocket_id') required this.pocketId, @JsonKey(name: 'category_id') required this.categoryId, required this.amount, @JsonKey(name: 'expense_date') required this.expenseDate, this.note, @JsonKey(name: 'payment_method') this.paymentMethod, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'deleted_at') this.deletedAt, this.pockets, this.categories});
  factory _ExpenseWithNames.fromJson(Map<String, dynamic> json) => _$ExpenseWithNamesFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'pocket_id') final  String pocketId;
@override@JsonKey(name: 'category_id') final  String categoryId;
@override final  int amount;
@override@JsonKey(name: 'expense_date') final  String expenseDate;
@override final  String? note;
@override@JsonKey(name: 'payment_method') final  String? paymentMethod;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
// Joined fields — may be null if pocket/category was soft-deleted
@override final  PocketRef? pockets;
@override final  CategoryRef? categories;

/// Create a copy of ExpenseWithNames
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseWithNamesCopyWith<_ExpenseWithNames> get copyWith => __$ExpenseWithNamesCopyWithImpl<_ExpenseWithNames>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseWithNamesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseWithNames&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pocketId, pocketId) || other.pocketId == pocketId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.pockets, pockets) || other.pockets == pockets)&&(identical(other.categories, categories) || other.categories == categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,pocketId,categoryId,amount,expenseDate,note,paymentMethod,createdAt,deletedAt,pockets,categories);

@override
String toString() {
  return 'ExpenseWithNames(id: $id, userId: $userId, pocketId: $pocketId, categoryId: $categoryId, amount: $amount, expenseDate: $expenseDate, note: $note, paymentMethod: $paymentMethod, createdAt: $createdAt, deletedAt: $deletedAt, pockets: $pockets, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ExpenseWithNamesCopyWith<$Res> implements $ExpenseWithNamesCopyWith<$Res> {
  factory _$ExpenseWithNamesCopyWith(_ExpenseWithNames value, $Res Function(_ExpenseWithNames) _then) = __$ExpenseWithNamesCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'pocket_id') String pocketId,@JsonKey(name: 'category_id') String categoryId, int amount,@JsonKey(name: 'expense_date') String expenseDate, String? note,@JsonKey(name: 'payment_method') String? paymentMethod,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt, PocketRef? pockets, CategoryRef? categories
});


@override $PocketRefCopyWith<$Res>? get pockets;@override $CategoryRefCopyWith<$Res>? get categories;

}
/// @nodoc
class __$ExpenseWithNamesCopyWithImpl<$Res>
    implements _$ExpenseWithNamesCopyWith<$Res> {
  __$ExpenseWithNamesCopyWithImpl(this._self, this._then);

  final _ExpenseWithNames _self;
  final $Res Function(_ExpenseWithNames) _then;

/// Create a copy of ExpenseWithNames
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? pocketId = null,Object? categoryId = null,Object? amount = null,Object? expenseDate = null,Object? note = freezed,Object? paymentMethod = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,Object? pockets = freezed,Object? categories = freezed,}) {
  return _then(_ExpenseWithNames(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pocketId: null == pocketId ? _self.pocketId : pocketId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,pockets: freezed == pockets ? _self.pockets : pockets // ignore: cast_nullable_to_non_nullable
as PocketRef?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as CategoryRef?,
  ));
}

/// Create a copy of ExpenseWithNames
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PocketRefCopyWith<$Res>? get pockets {
    if (_self.pockets == null) {
    return null;
  }

  return $PocketRefCopyWith<$Res>(_self.pockets!, (value) {
    return _then(_self.copyWith(pockets: value));
  });
}/// Create a copy of ExpenseWithNames
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryRefCopyWith<$Res>? get categories {
    if (_self.categories == null) {
    return null;
  }

  return $CategoryRefCopyWith<$Res>(_self.categories!, (value) {
    return _then(_self.copyWith(categories: value));
  });
}
}


/// @nodoc
mixin _$PocketRef {

 String get name;
/// Create a copy of PocketRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PocketRefCopyWith<PocketRef> get copyWith => _$PocketRefCopyWithImpl<PocketRef>(this as PocketRef, _$identity);

  /// Serializes this PocketRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PocketRef&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'PocketRef(name: $name)';
}


}

/// @nodoc
abstract mixin class $PocketRefCopyWith<$Res>  {
  factory $PocketRefCopyWith(PocketRef value, $Res Function(PocketRef) _then) = _$PocketRefCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$PocketRefCopyWithImpl<$Res>
    implements $PocketRefCopyWith<$Res> {
  _$PocketRefCopyWithImpl(this._self, this._then);

  final PocketRef _self;
  final $Res Function(PocketRef) _then;

/// Create a copy of PocketRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PocketRef].
extension PocketRefPatterns on PocketRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PocketRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PocketRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PocketRef value)  $default,){
final _that = this;
switch (_that) {
case _PocketRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PocketRef value)?  $default,){
final _that = this;
switch (_that) {
case _PocketRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PocketRef() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _PocketRef():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _PocketRef() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PocketRef implements PocketRef {
  const _PocketRef({required this.name});
  factory _PocketRef.fromJson(Map<String, dynamic> json) => _$PocketRefFromJson(json);

@override final  String name;

/// Create a copy of PocketRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PocketRefCopyWith<_PocketRef> get copyWith => __$PocketRefCopyWithImpl<_PocketRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PocketRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PocketRef&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'PocketRef(name: $name)';
}


}

/// @nodoc
abstract mixin class _$PocketRefCopyWith<$Res> implements $PocketRefCopyWith<$Res> {
  factory _$PocketRefCopyWith(_PocketRef value, $Res Function(_PocketRef) _then) = __$PocketRefCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$PocketRefCopyWithImpl<$Res>
    implements _$PocketRefCopyWith<$Res> {
  __$PocketRefCopyWithImpl(this._self, this._then);

  final _PocketRef _self;
  final $Res Function(_PocketRef) _then;

/// Create a copy of PocketRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_PocketRef(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CategoryRef {

 String get name;
/// Create a copy of CategoryRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryRefCopyWith<CategoryRef> get copyWith => _$CategoryRefCopyWithImpl<CategoryRef>(this as CategoryRef, _$identity);

  /// Serializes this CategoryRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryRef&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CategoryRef(name: $name)';
}


}

/// @nodoc
abstract mixin class $CategoryRefCopyWith<$Res>  {
  factory $CategoryRefCopyWith(CategoryRef value, $Res Function(CategoryRef) _then) = _$CategoryRefCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$CategoryRefCopyWithImpl<$Res>
    implements $CategoryRefCopyWith<$Res> {
  _$CategoryRefCopyWithImpl(this._self, this._then);

  final CategoryRef _self;
  final $Res Function(CategoryRef) _then;

/// Create a copy of CategoryRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryRef].
extension CategoryRefPatterns on CategoryRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryRef value)  $default,){
final _that = this;
switch (_that) {
case _CategoryRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryRef value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryRef() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _CategoryRef():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _CategoryRef() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryRef implements CategoryRef {
  const _CategoryRef({required this.name});
  factory _CategoryRef.fromJson(Map<String, dynamic> json) => _$CategoryRefFromJson(json);

@override final  String name;

/// Create a copy of CategoryRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryRefCopyWith<_CategoryRef> get copyWith => __$CategoryRefCopyWithImpl<_CategoryRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryRef&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CategoryRef(name: $name)';
}


}

/// @nodoc
abstract mixin class _$CategoryRefCopyWith<$Res> implements $CategoryRefCopyWith<$Res> {
  factory _$CategoryRefCopyWith(_CategoryRef value, $Res Function(_CategoryRef) _then) = __$CategoryRefCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$CategoryRefCopyWithImpl<$Res>
    implements _$CategoryRefCopyWith<$Res> {
  __$CategoryRefCopyWithImpl(this._self, this._then);

  final _CategoryRef _self;
  final $Res Function(_CategoryRef) _then;

/// Create a copy of CategoryRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_CategoryRef(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Expense {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'pocket_id') String get pocketId;@JsonKey(name: 'category_id') String get categoryId; int get amount;@JsonKey(name: 'expense_date') String get expenseDate; String? get note;@JsonKey(name: 'payment_method') String? get paymentMethod;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'deleted_at') String? get deletedAt;
/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseCopyWith<Expense> get copyWith => _$ExpenseCopyWithImpl<Expense>(this as Expense, _$identity);

  /// Serializes this Expense to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Expense&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pocketId, pocketId) || other.pocketId == pocketId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,pocketId,categoryId,amount,expenseDate,note,paymentMethod,createdAt,deletedAt);

@override
String toString() {
  return 'Expense(id: $id, userId: $userId, pocketId: $pocketId, categoryId: $categoryId, amount: $amount, expenseDate: $expenseDate, note: $note, paymentMethod: $paymentMethod, createdAt: $createdAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $ExpenseCopyWith<$Res>  {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) _then) = _$ExpenseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'pocket_id') String pocketId,@JsonKey(name: 'category_id') String categoryId, int amount,@JsonKey(name: 'expense_date') String expenseDate, String? note,@JsonKey(name: 'payment_method') String? paymentMethod,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt
});




}
/// @nodoc
class _$ExpenseCopyWithImpl<$Res>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._self, this._then);

  final Expense _self;
  final $Res Function(Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? pocketId = null,Object? categoryId = null,Object? amount = null,Object? expenseDate = null,Object? note = freezed,Object? paymentMethod = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pocketId: null == pocketId ? _self.pocketId : pocketId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Expense].
extension ExpensePatterns on Expense {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Expense value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Expense value)  $default,){
final _that = this;
switch (_that) {
case _Expense():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Expense value)?  $default,){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'pocket_id')  String pocketId, @JsonKey(name: 'category_id')  String categoryId,  int amount, @JsonKey(name: 'expense_date')  String expenseDate,  String? note, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.id,_that.userId,_that.pocketId,_that.categoryId,_that.amount,_that.expenseDate,_that.note,_that.paymentMethod,_that.createdAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'pocket_id')  String pocketId, @JsonKey(name: 'category_id')  String categoryId,  int amount, @JsonKey(name: 'expense_date')  String expenseDate,  String? note, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _Expense():
return $default(_that.id,_that.userId,_that.pocketId,_that.categoryId,_that.amount,_that.expenseDate,_that.note,_that.paymentMethod,_that.createdAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'pocket_id')  String pocketId, @JsonKey(name: 'category_id')  String categoryId,  int amount, @JsonKey(name: 'expense_date')  String expenseDate,  String? note, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.id,_that.userId,_that.pocketId,_that.categoryId,_that.amount,_that.expenseDate,_that.note,_that.paymentMethod,_that.createdAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Expense implements Expense {
  const _Expense({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'pocket_id') required this.pocketId, @JsonKey(name: 'category_id') required this.categoryId, required this.amount, @JsonKey(name: 'expense_date') required this.expenseDate, this.note, @JsonKey(name: 'payment_method') this.paymentMethod, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'deleted_at') this.deletedAt});
  factory _Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'pocket_id') final  String pocketId;
@override@JsonKey(name: 'category_id') final  String categoryId;
@override final  int amount;
@override@JsonKey(name: 'expense_date') final  String expenseDate;
@override final  String? note;
@override@JsonKey(name: 'payment_method') final  String? paymentMethod;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseCopyWith<_Expense> get copyWith => __$ExpenseCopyWithImpl<_Expense>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Expense&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.pocketId, pocketId) || other.pocketId == pocketId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,pocketId,categoryId,amount,expenseDate,note,paymentMethod,createdAt,deletedAt);

@override
String toString() {
  return 'Expense(id: $id, userId: $userId, pocketId: $pocketId, categoryId: $categoryId, amount: $amount, expenseDate: $expenseDate, note: $note, paymentMethod: $paymentMethod, createdAt: $createdAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) _then) = __$ExpenseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'pocket_id') String pocketId,@JsonKey(name: 'category_id') String categoryId, int amount,@JsonKey(name: 'expense_date') String expenseDate, String? note,@JsonKey(name: 'payment_method') String? paymentMethod,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt
});




}
/// @nodoc
class __$ExpenseCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(this._self, this._then);

  final _Expense _self;
  final $Res Function(_Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? pocketId = null,Object? categoryId = null,Object? amount = null,Object? expenseDate = null,Object? note = freezed,Object? paymentMethod = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_Expense(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,pocketId: null == pocketId ? _self.pocketId : pocketId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
