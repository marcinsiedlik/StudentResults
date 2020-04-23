import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:results/base/network/interceptor/connectivity_interceptor.dart';
import 'package:results/base/network/interceptor/logger_interceptor.dart';

@registerModule
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio();
    dio
      ..options.baseUrl = 'https://appost.herokuapp.com/'
      ..interceptors.addAll([
        LoggerInterceptor(),
        ConnectivityInterceptor(),
      ]);
    return dio;
  }
}
