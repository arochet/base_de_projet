import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_password_failure.freezed.dart';

@freezed
abstract class NewPasswordFailure with _$NewPasswordFailure {
  const factory NewPasswordFailure.serverError() = ServerError;
}
