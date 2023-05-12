import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_failure.freezed.dart';

///Type de failure lié au reset du mot de passe
@freezed
abstract class ResetPasswordFailure with _$ResetPasswordFailure {
  const factory ResetPasswordFailure.serverError() = ServerError;
  const factory ResetPasswordFailure.userNotFound() = UserNotFound;
}
