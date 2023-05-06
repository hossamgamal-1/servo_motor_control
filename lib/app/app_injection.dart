import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/web_services.dart';
import '../presentation/app_cubit/app_cubit.dart';

GetIt sL = GetIt.instance;
void getInit() {
  sL.registerLazySingleton<Dio>(() => initDio());
  sL.registerLazySingleton<WebServices>(() => WebServices(sL<Dio>()));
  sL.registerLazySingleton<AppCubit>(() => AppCubit(sL<WebServices>()));
}
