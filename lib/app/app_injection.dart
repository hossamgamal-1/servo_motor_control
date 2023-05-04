import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:servo_web_server/data/web_service_repo.dart';

import '../data/remote_data_base/web_services.dart';
import '../presentation/app_cubit/app_cubit.dart';

GetIt sL = GetIt.instance;
void getInit() {
  sL.registerLazySingleton<Dio>(() => initDio());
  sL.registerLazySingleton<WebServices>(() => WebServices(sL<Dio>()));
  sL.registerLazySingleton<WebServicesRepo>(
      () => WebServicesRepo(sL<WebServices>()));
  sL.registerLazySingleton<AppCubit>(() => AppCubit(sL<WebServicesRepo>()));
}

Dio initDio() {
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    error: true,
  ));
  return dio;
}
