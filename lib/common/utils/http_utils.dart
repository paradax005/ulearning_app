import 'package:dio/dio.dart';
import 'package:ulearning_app/common/constants/constant.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }
  late Dio dio;
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    dio = Dio(options);
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    print('---------------- HTTP UTILS -----------------');

    print(response.statusCode);
    print(response.data.toString());

    print('-----------------------------------------------');

    return response.data;
  }
}
