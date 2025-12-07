import 'package:depi_graduation_project/data/data_sources/remote/api_response_handler.dart';
import 'package:dio/dio.dart';

class ApiExceptions {
  static ApiResponse<T> handleDioError<T>(DioException e) {
    return ApiResponseHandler.handleDioError<T>(e);
  }

  static ApiResponse<T> handleGenericError<T>(Object e) {
    return ApiResponseHandler.handleGenericError<T>(e);
  }
}
