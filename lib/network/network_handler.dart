import 'package:dio/dio.dart';

abstract class NetworkHandler {
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters});
}

class DioNetworkHandler extends NetworkHandler {
    final Dio client = Dio();

    @override
    Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
      return client.get(path, queryParameters: queryParameters);
    }

}