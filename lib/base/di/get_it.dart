import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:results/base/di/get_it.iconfig.dart';

final getIt = GetIt.instance;

@injectableInit
void initDependencyInjection() => $initGetIt(getIt);
