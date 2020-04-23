import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@registerModule
abstract class UtilModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get preferences async => await SharedPreferences.getInstance();
}
