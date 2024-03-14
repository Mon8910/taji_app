import 'package:dio/dio.dart';
import 'package:task_appp/api/api_consumer.dart';
import 'package:task_appp/error/error_exception.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = 'https://api.tajj.xyz/v1/';
   
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true));
  }
  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameter,
      );
      return response.data;
    } on DioException catch (e) {
      dioException(e);
    }
  }

  @override
  Future get(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormated = false,}) async {
    try {
      final response = await dio.get(
        path,
        data:isFormated?FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );
      return response.data;
    } on DioException catch (e) {
      dioException(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormated = false}) async {
    try {
      final response = await dio.patch(
        path,
       data:isFormated?FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );
      return response.data;
    } on DioException catch (e) {
      dioException(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormated = false}) async {
    try {
      final response = await dio.post(
        path,
       data:isFormated?FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );
      return response.data;
    } on DioException catch (e) {
      dioException(e);
    }
  }
}
