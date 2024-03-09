import 'object_utils.dart';

class BoolUtils {
  const BoolUtils._();

  static bool parseBool(
    dynamic value, {
    bool defaultValue = false,
  }) {
    return ObjectUtils.returnOrThrow(
      () => parseNullableBool(
        value,
        defaultValue,
      ),
      exception: 'Value is null!',
    );
  }

  static bool? parseNullableBool(
    dynamic value, [
    bool? defaultValue,
    bool acceptNullItems = false,
  ]) {
    if (value is bool) {
      return value;
    } else if (value is String) {
      return value == '1' || value == 'true' || value == 'oui';
    } else if (value is num) {
      return value == 1;
    } else if (value == null && acceptNullItems) {
      return null;
    } else if (defaultValue != null) {
      return defaultValue;
    } else {
      throw Exception('Not a boolean !');
    }
  }
}

extension BoolUtilsExtensions on bool {
  int toInt() {
    return this ? 1 : 0;
  }

  String toIntString() {
    return toInt().toString();
  }
}
