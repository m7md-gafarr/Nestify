import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      validateStatus: (status) {
        return status != null && status >= 200 && status < 300;
      },
    ),
  );
}
