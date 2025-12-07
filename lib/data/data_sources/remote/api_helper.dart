import 'dart:developer';

import 'package:depi_graduation_project/data/data_sources/remote/api_client.dart';
import 'package:depi_graduation_project/data/data_sources/remote/api_exceptions.dart';
import 'package:depi_graduation_project/data/data_sources/remote/api_response_handler.dart';
import 'package:dio/dio.dart';

/// Handles all HTTP requests using Dio
class ApiHelper {
  final Dio _dio = ApiClient.dio;

  /// GET Request
  Future<ApiResponse<T>> get<T>({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.data == null) {
        return ApiResponse<T>(
          success: false,
          errors: 'Empty response data',
          statusCode: response.statusCode,
        );
      }

      return ApiResponseHandler.handleSuccess<T>(response);
    } on DioException catch (e) {
      return ApiExceptions.handleDioError<T>(e);
    } catch (e) {
      return ApiExceptions.handleGenericError<T>(e);
    }
  }

  /// POST Request
  Future<ApiResponse<T>> post<T>({
    required String url,
    required dynamic body,
    required Map<String, String> headers,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
        options: Options(headers: headers),
      );

      return ApiResponseHandler.handleSuccess<T>(response);
    } on DioException catch (e) {
      return ApiExceptions.handleDioError<T>(e);
    } catch (e) {
      return ApiExceptions.handleGenericError<T>(e);
    }
  }

  /// PUT Request
  Future<ApiResponse<T>> put<T>({
    required String url,
    required dynamic body,
    required Map<String, String> headers,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: body,
        options: Options(headers: headers),
      );

      return ApiResponseHandler.handleSuccess<T>(response);
    } on DioException catch (e) {
      return ApiExceptions.handleDioError<T>(e);
    } catch (e) {
      return ApiExceptions.handleGenericError<T>(e);
    }
  }

  /// PATCH Request
  Future<ApiResponse<T>> patch<T>({
    required String url,
    required dynamic body,
    required Map<String, String> headers,
  }) async {
    try {
      final response = await _dio.patch(
        url,
        data: body,
        options: Options(headers: headers),
      );

      log(response.toString());

      return ApiResponseHandler.handleSuccess<T>(response);
    } on DioException catch (e) {
      return ApiExceptions.handleDioError<T>(e);
    } catch (e) {
      return ApiExceptions.handleGenericError<T>(e);
    }
  }

  /// DELETE Request
  Future<ApiResponse<T>> delete<T>({
    required String url,
    required Map<String, String> headers,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        options: Options(headers: headers),
      );

      return ApiResponseHandler.handleSuccess<T>(response);
    } on DioException catch (e) {
      return ApiExceptions.handleDioError<T>(e);
    } catch (e) {
      return ApiExceptions.handleGenericError<T>(e);
    }
  }
}
