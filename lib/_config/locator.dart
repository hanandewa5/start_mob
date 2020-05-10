import 'package:get_it/get_it.dart';
import 'package:start_mob/_services/api_get.dart';
import 'package:start_mob/_services/api_post.dart';
import 'package:start_mob/_services/api_put.dart';
import 'package:start_mob/_services/dialog_service.dart';
import 'package:start_mob/_services/navigation_service.dart';
import 'package:start_mob/viewmodels/auth_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiGet());
  locator.registerLazySingleton(() => ApiPost());
  locator.registerLazySingleton(() => ApiPut());

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  
  locator.registerFactory(() => AuthVM());
}
