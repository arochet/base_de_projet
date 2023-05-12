import 'package:freezed_annotation/freezed_annotation.dart';

part 'reauthenticate_failure.freezed.dart';

///Type de failure lié à la réauthentification
@freezed
abstract class ReauthenticateFailure with _$ReauthenticateFailure {
  const factory ReauthenticateFailure.serverError() = ServerError;
  const factory ReauthenticateFailure.notAuthenticated() = NotAuthenticated;
  const factory ReauthenticateFailure.userMismatch() = UserMismatch;
  const factory ReauthenticateFailure.userNotFound() = UserNotFound;
  const factory ReauthenticateFailure.invalidCredential() = InvalidCredential;
  const factory ReauthenticateFailure.invalidEmail() = InvalidEmail;
  const factory ReauthenticateFailure.wrongPassword() = WrongPassword;
  const factory ReauthenticateFailure.tooManyRequest() = TooManyRequest;
}
