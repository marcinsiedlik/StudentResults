import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:results/base/network/exceptions/api_exception.dart';

class ConnectivityInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      if (!await DataConnectionChecker().hasConnection) {
        throw ConnectivityException(-1, null, "No internet connection");
      }
    } else {
      throw ConnectivityException(-1, null, "No internet connection");
    }
    return options;
  }
}
