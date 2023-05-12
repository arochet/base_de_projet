import 'package:base_de_projet/PRESENTATION/core/_components/app_error.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Récupère un AsyncValue<T> et retourne un widget en fonction de l'état de AsyncValue<T><br>
/// <br>
/// 3 états possibles:<br>
/// - builder <br>
/// - error <br>
/// - loading <br>
class AppAsync<T> extends StatelessWidget {
  final AsyncValue<T?> async;
  final Widget Function(T?) builder;
  final Widget? loading;
  const AppAsync(this.async, {super.key, required this.builder, this.loading});

  @override
  Widget build(BuildContext context) {
    return async.when(
        data: (T? data) => builder(data),
        error: (err, StackTrace stack) => AppError(message: '$err'),
        loading: () => loading ?? AppLoading());
  }
}
