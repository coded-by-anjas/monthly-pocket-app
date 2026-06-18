// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncomeResponse _$IncomeResponseFromJson(Map<String, dynamic> json) =>
    _IncomeResponse(
      id: json['id'] as String,
      amount: (json['amount'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$IncomeResponseToJson(_IncomeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'year': instance.year,
      'month': instance.month,
      'created_at': instance.createdAt,
    };
