import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_failure.freezed.dart';

///Type de failure lié à la suppression du compte
@freezed
abstract class DeleteFailure with _$DeleteFailure {
  const factory DeleteFailure.cancelledByUser() = CancelledByUser;
  const factory DeleteFailure.serverError() = ServerError;
  const factory DeleteFailure.requiresRecentLogin() = RequiresRecentLogin;
}
