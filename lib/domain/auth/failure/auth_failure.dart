import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

///Type de failure lié à l'authentification
@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.insufficientPermission() = InsufficientPermission;
  const factory AuthFailure.invalidUser() = InvalidUser;
  const factory AuthFailure.invalidPassword() = InvalidPassword;
  const factory AuthFailure.noInternet() = NoInternet;
  const factory AuthFailure.tooManyRequest() = TooManyRequest;
  const factory AuthFailure.invalidEmailVerified() = InvalidEmailVerified;
}
