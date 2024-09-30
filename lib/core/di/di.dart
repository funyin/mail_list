import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part '../data/network/network_provider.dart';

final getIt = GetIt.instance;

///should be done after app config has been set
Future<void> setupDi() {
  getIt.registerLazySingleton<Dio>(() => networkProvider());
  return getIt.allReady();
}
