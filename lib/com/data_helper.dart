import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

///定义了常见请求状态，例如网络错误、超时、成功等
class DataHelper {
  static encryptParams(Map<String, dynamic> map) {
    var buffer = StringBuffer();
    map.forEach((key, value) {
      buffer.write(key);
      buffer.write(value);
    });

    buffer.write("SERECT");
    var sign = string2MD5(buffer.toString());
    return sign;
  }

  static string2MD5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}