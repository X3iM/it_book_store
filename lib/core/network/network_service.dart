import 'package:dio/dio.dart';

abstract class NetworkService {
  static const String baseUrl = 'https://api.itbook.store/1.0';

  static final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Dio get dio => _dio;
}