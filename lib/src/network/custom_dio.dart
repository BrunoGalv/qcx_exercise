import 'package:dio/dio.dart';
import 'environment.dart';

class CustomDio {
  static const int _timeout = 1000 * 60 * 2;
  late Dio client;

  CustomDio() {
    client = Dio();
    client.options.sendTimeout = _timeout;
    client.options.connectTimeout = _timeout;
    client.options.receiveTimeout = _timeout;
    client.options.maxRedirects = 2;
    client.options.responseType = ResponseType.json;
    client.options.baseUrl = Environment.prod.api;
  }
}
