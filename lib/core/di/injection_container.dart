import 'package:get_it/get_it.dart';

/// Global [GetIt] service locator instance.
///
/// Register dependencies in [initDependencies]. Call it once
/// during app bootstrap in [main.dart].
final GetIt sl = GetIt.instance;

/// Bootstrap all dependency registrations.
///
/// Modules are initialised in dependency order — infrastructure first,
/// then features. Async initialisation (SharedPreferences, DB, etc.)
/// should be awaited here.
Future<void> initDependencies() async {
  // --- core ---
  // sl.registerLazySingleton<Dio>(() => createApiClient());
  // sl.registerLazySingleton<AppRouter>(() => AppRouter());

  // --- features ---
  // Feature modules register themselves via dedicated init functions:
  // initSplashDependencies();
}
