// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String,
  name: json['name'] as String,
  icon: json['icon'] as String?,
  color: json['color'] as String?,
  isDefault: json['is_default'] as bool?,
  isActive: json['is_active'] as bool?,
  userId: json['user_id'] as String?,
  createdAt: json['created_at'] as String?,
  deletedAt: json['deleted_at'] as String?,
  nameChangedAt: json['name_changed_at'] as String?,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'icon': instance.icon,
  'color': instance.color,
  'is_default': instance.isDefault,
  'is_active': instance.isActive,
  'user_id': instance.userId,
  'created_at': instance.createdAt,
  'deleted_at': instance.deletedAt,
  'name_changed_at': instance.nameChangedAt,
};
