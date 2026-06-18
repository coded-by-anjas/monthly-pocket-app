import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

/// Mirrors GET /api/categories response shape (full Category row).
@freezed
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    String? icon,
    String? color,
    @JsonKey(name: 'is_default') bool? isDefault,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'name_changed_at') String? nameChangedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
