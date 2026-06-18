import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Holds authentication state and notifies listeners so the router
/// (and UI) can react to sign-in / sign-out / onboarding-complete events.
///
/// The access token is persisted to [FlutterSecureStorage] so the user stays
/// logged in across app restarts.
class AuthController extends ChangeNotifier {
  AuthController({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  static const _keyAccessToken = 'auth_access_token';

  String? _accessToken;
  bool _newUser = false;
  bool _isLoading = true;

  String? get accessToken => _accessToken;
  bool get isAuthenticated => _accessToken != null;
  bool get isNewUser => _newUser;
  bool get isLoading => _isLoading;

  /// Called once after DI is ready. Restores a previously persisted token
  /// so the user doesn't need to re-authenticate on every app launch.
  Future<void> init() async {
    try {
      _accessToken = await _secureStorage.read(key: _keyAccessToken);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Store the token received after a successful sign-in.
  /// The token is persisted so it survives app restarts.
  Future<void> setAuth({
    required String accessToken,
    required bool newUser,
  }) async {
    _accessToken = accessToken;
    _newUser = newUser;
    notifyListeners();

    await _secureStorage.write(key: _keyAccessToken, value: accessToken);
  }

  /// Mark the new-user onboarding flow as finished (in-memory only).
  void completeOnboarding() {
    _newUser = false;
    notifyListeners();
  }

  /// Clear all auth state (sign-out).
  Future<void> clearAuth() async {
    _accessToken = null;
    _newUser = false;
    notifyListeners();
    await _secureStorage.delete(key: _keyAccessToken);
  }
}
