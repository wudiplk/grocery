/// 网络返回数据二次封装
class NetResult {
  Object data;
  bool isSuccess;
  int? code;
  Object? headers;

  NetResult(this.data, this.isSuccess, this.code, {this.headers});
}
