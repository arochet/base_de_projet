import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';

part 'user_auth.freezed.dart';

@freezed
abstract class UserAuth with _$UserAuth {
  const factory UserAuth({required UniqueId id}) = _UserAuth;
}
