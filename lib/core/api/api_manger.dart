import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/core/constants.dart';

@singleton
class ApiManager {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.apiPath,
        headers: {"Content-Type": "application/json"},
      ),
    );
  }

  Future<Response> getRequest(
      {required String endPoints,
      Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(
      endPoints,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response> postRequest({
    required String endPoints,
    Map<String, dynamic>? body,
    required String token,
  }) async {
    var response = await dio.post(
      endPoints,
      data: body,
    );
    return response;
  }
}