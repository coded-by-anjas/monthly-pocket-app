// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pocket_with_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PocketWithBalance _$PocketWithBalanceFromJson(Map<String, dynamic> json) =>
    _PocketWithBalance(
      id: json['id'] as String,
      name: json['name'] as String,
      budget: (json['budget'] as num).toInt(),
      isUnallocated: json['is_unallocated'] as bool,
      spent: (json['spent'] as num).toInt(),
      remaining: (json['remaining'] as num).toInt(),
      color: json['color'] as String?,
      icon: json['icon'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$PocketWithBalanceToJson(_PocketWithBalance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'budget': instance.budget,
      'is_unallocated': instance.isUnallocated,
      'spent': instance.spent,
      'remaining': instance.remaining,
      'color': instance.color,
      'icon': instance.icon,
      'created_at': instance.createdAt,
    };
