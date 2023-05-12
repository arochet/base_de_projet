import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_failure.freezed.dart';

///Type de failure lié au serveur
@freezed
abstract class ServerFailure with _$ServerFailure {
  const factory ServerFailure.serverError() = ServerError;
  const factory ServerFailure.noInternet() = NoInternet;
}
