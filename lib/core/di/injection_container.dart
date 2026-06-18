import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hearai/features/home/home.dart';
import 'package:hearai/features/setting/setting.dart';
import 'package:hearai/features/sign_up/sign_up.dart';

import '../auth/auth_controller.dart';
import '../network/api_client.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  // --- core (infrastructure) ------------------------------------------------
  sl.registerLazySingleton<Dio>(() => createApiClient());
  sl.registerLazySingleton<AuthController>(() => AuthController());

  // --- data -----------------------------------------------------------------
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(dio: sl()));
  sl.registerLazySingleton<WordRepository>(() => WordRepositoryImpl(dio: sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dio: sl()));

  // --- init -----------------------------------------------------------------
  await sl<AuthController>().init();

  // --- features -------------------------------------------------------------
  // sl.registerLazySingleton<SettingController>(
  //   () => SettingController(userRepository: sl()),
  // );
}
