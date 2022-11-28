class FutureUtils {
  const FutureUtils._();

  static Future<Iterable<T>> run<T>(
    Iterable<Future<T>> futures, {
    bool ignoreExceptions = false,
  }) async {
    List<T> res = <T>[];

    for (Future<T> future in futures) {
      try {
        T futureRes = await future;
        res.add(futureRes);
      } catch (err, trace) {
        print('Future execution error');
        print(err);
        print(trace);
        if (ignoreExceptions && err is T) {
          res.add(err as T);
        } else {
          rethrow;
        }
      }
    }

    return res;
  }

  static Future<void> forceVoidValue(Future<void>? future) {
    if (future != null) {
      return future;
    } else {
      return Future<void>.value();
    }
  }

  static Future<T> forceValue<T>(Future<T?>? future) async {
    T? res = await future!;
    return res!;
  }

  static Future<void> get nullVoid => Future<Null>.value(null);

  static Future<Null>? get nil => Future<Null>.value(null);
}

extension IterableFutureExtension<T> on Iterable<Future<T>> {
  Future<Iterable<T>> run({bool ignoreExceptions = false}) {
    return FutureUtils.run<T>(this, ignoreExceptions: ignoreExceptions);
  }

  Future<void> runIgnoringResult({bool ignoreExceptions = false}) {
    return FutureUtils.run<T>(
      this,
      ignoreExceptions: ignoreExceptions,
    ).then(
      (Iterable<T> value) => null,
    );
  }
}

extension FutureExtension<T> on Future<T?> {
  Future<T> alwaysReturn(T defaultValue) {
    return this.then<T>((T? value) => value ?? defaultValue).catchError((dynamic err) => defaultValue);
  }
}

extension FutureObjectExtension<T extends Object> on T {
  Future<T> toFuture() => Future<T>.value(this);
}
