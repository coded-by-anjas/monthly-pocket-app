import 'package:freezed_annotation/freezed_annotation.dart';

part 'pocket_with_balance.freezed.dart';
part 'pocket_with_balance.g.dart';

/// Mirrors GET /api/pockets response shape (PocketWithBalance in web types).
@freezed
abstract class PocketWithBalance with _$PocketWithBalance {
  const factory PocketWithBalance({
    required String id,
    required String name,
    required int budget,
    @JsonKey(name: 'is_unallocated') required bool isUnallocated,
    required int spent,
    required int remaining,
    String? color,
    String? icon,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _PocketWithBalance;

  factory PocketWithBalance.fromJson(Map<String, dynamic> json) =>
      _$PocketWithBalanceFromJson(json);
}
