///定义了常见请求状态，例如网络错误、超时、成功等
class NetCode {
  ///网络错误
  static const networkError = -1;

  ///网络超时
  static const networkTimeout = -2;

  ///网络返回数据格式化一次
  static const networkJsonException = -3;

  static const success = 200;

  static const accepted = 201;

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    return message;
  }
}
