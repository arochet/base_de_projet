import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_de_projet/domain/core/failures.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/domain/core/value_validators.dart';

@immutable
class Nom extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Nom(String input) {
    return Nom._(validateMaxStringLengthAndNoNull(input, 50));
  }

  const Nom._(this.value);
}

@immutable
class Telephone extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Telephone(String input) {
    return Telephone._(validateTelephone(input));
  }

  const Telephone._(this.value);
}

@immutable
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}

@immutable
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  const Password._(this.value);
}

@immutable
class PasswordConfirmation extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PasswordConfirmation(String input, String input2) {
    return PasswordConfirmation._(validatePasswordConfirmation(input, input2));
  }

  const PasswordConfirmation._(this.value);
}
