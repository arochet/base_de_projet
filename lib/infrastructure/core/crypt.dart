import 'package:encrypt/encrypt.dart';

String crypt(String str) {
  final key = Key.fromUtf8('E8A0B3CCC9AD2030AD413A17EBEA0F3F');
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key));
  final strEncrypted = encrypter.encrypt(str, iv: iv);
  return strEncrypted.base64;
}
