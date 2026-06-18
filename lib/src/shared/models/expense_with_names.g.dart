// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_with_names.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseWithNames _$ExpenseWithNamesFromJson(Map<String, dynamic> json) =>
    _ExpenseWithNames(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      pocketId: json['pocket_id'] as String,
      categoryId: json['category_id'] as String,
      amount: (json['amount'] as num).toInt(),
      expenseDate: json['expense_date'] as String,
      note: json['note'] as String?,
      paymentMethod: json['payment_method'] as String?,
      createdAt: json['created_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      pockets: json['pockets'] == null
          ? null
          : PocketRef.fromJson(json['pockets'] as Map<String, dynamic>),
      categories: json['categories'] == null
          ? null
          : CategoryRef.fromJson(json['categories'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpenseWithNamesToJson(_ExpenseWithNames instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'pocket_id': instance.pocketId,
      'category_id': instance.categoryId,
      'amount': instance.amount,
      'expense_date': instance.expenseDate,
      'note': instance.note,
      'payment_method': instance.paymentMethod,
      'created_at': instance.createdAt,
      'deleted_at': instance.deletedAt,
      'pockets': instance.pockets,
      'categories': instance.categories,
    };

_PocketRef _$PocketRefFromJson(Map<String, dynamic> json) =>
    _PocketRef(name: json['name'] as String);

Map<String, dynamic> _$PocketRefToJson(_PocketRef instance) =>
    <String, dynamic>{'name': instance.name};

_CategoryRef _$CategoryRefFromJson(Map<String, dynamic> json) =>
    _CategoryRef(name: json['name'] as String);

Map<String, dynamic> _$CategoryRefToJson(_CategoryRef instance) =>
    <String, dynamic>{'name': instance.name};

_Expense _$ExpenseFromJson(Map<String, dynamic> json) => _Expense(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  pocketId: json['pocket_id'] as String,
  categoryId: json['category_id'] as String,
  amount: (json['amount'] as num).toInt(),
  expenseDate: json['expense_date'] as String,
  note: json['note'] as String?,
  paymentMethod: json['payment_method'] as String?,
  createdAt: json['created_at'] as String?,
  deletedAt: json['deleted_at'] as String?,
);

Map<String, dynamic> _$ExpenseToJson(_Expense instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'pocket_id': instance.pocketId,
  'category_id': instance.categoryId,
  'amount': instance.amount,
  'expense_date': instance.expenseDate,
  'note': instance.note,
  'payment_method': instance.paymentMethod,
  'created_at': instance.createdAt,
  'deleted_at': instance.deletedAt,
};
