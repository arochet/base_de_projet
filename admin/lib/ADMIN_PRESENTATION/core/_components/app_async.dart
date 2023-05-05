import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_error.dart';
import 'app_loading.dart';

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
