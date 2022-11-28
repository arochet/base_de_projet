class ObjectUtils {
  const ObjectUtils._();

  static T? extractFromMap<T>(
    Map? object,
    ObjectMapBuilder<T> f,
  ) {
    if (object == null) {
      return null;
    }

    try {
      return f(object);
    } catch (e, trace) {
      print('Unable to extract from map');
      print(e);
      print(trace);
      return null;
    }
  }

  static T extractFromMapOrThrow<T>(
    Map object,
    ObjectMapBuilder<T> f,
  ) {
    try {
      return f(object);
    } catch (e, trace) {
      print('Unable to extract from map');
      print(e);
      print(trace);
      throw Exception('Unable to extract from map');
    }
  }

  static O extractOrThrow<I, O>(
    I object,
    ObjectBuilder<I, O> f,
  ) {
    try {
      return f(object);
    } catch (e) {
      rethrow;
    }
  }

  static O? extract<I, O>(
    I object,
    ObjectBuilder<I, O> f,
  ) {
    try {
      return f(object);
    } catch (e) {
      return null;
    }
  }

  static O? useNonNull2<I, O>(
    I object1,
    I object2,
    ObjectBuilder<I, O> f,
  ) {
    try {
      if (object1 != null || object2 != null) {
        return f(object1 ?? object2);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static T returnOrThrow<T, E extends Exception>(T? Function() value, {String? exception}) {
    T? res = value.call();

    if (res == null) {
      throw exception ?? Exception();
    } else {
      return res;
    }
  }
}

extension ObjectExtensions on Object {
  T returnOrThrow<T, E extends Exception>(
    T? Function() value, {
    String? exception,
  }) {
    T? res = value.call();

    if (res == null) {
      throw exception ?? Exception();
    } else {
      return res;
    }
  }

  void addToList(List list) {
    list.add(this);
  }

  String get asString => this as String;

  int get asInt => this as int;

  double get asDouble => this as double;

  num get asNum => this as num;

  bool get asBool => this as bool;
}

typedef ObjectBuilder<A, B> = B Function(A object);
typedef ObjectMapBuilder<T> = T Function(Map object);
