import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hearai/features/setting/setting.dart';

import '../network/api_client.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  // --- core (infrastructure) ------------------------------------------------
  sl.registerLazySingleton<Dio>(() => createApiClient());
  // sl.registerLazySingleton<AppRouter>(() => AppRouter());

  // --- data -----------------------------------------------------------------
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(dio: sl()));

  // --- features -------------------------------------------------------------
  // sl.registerLazySingleton<SettingController>(
  //   () => SettingController(userRepository: sl()),
  // );
}
