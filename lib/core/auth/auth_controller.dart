import 'package:flutter/foundation.dart';

/// Holds authentication state and notifies listeners so the router
/// (and UI) can react to sign-in / sign-out / onboarding-complete events.
class AuthController extends ChangeNotifier {
  String? _accessToken;
  bool _newUser = false;
  bool _isLoading = true;

  String? get accessToken => _accessToken;
  bool get isAuthenticated => _accessToken != null;
  bool get isNewUser => _newUser;
  bool get isLoading => _isLoading;

  /// Called once after DI is ready. In the future this could restore a
  /// persisted token (e.g. from flutter_secure_storage).
  Future<void> init() async {
    _isLoading = false;
    notifyListeners();
  }

  /// Store the token received after a successful sign-in.
  void setAuth({required String accessToken, required bool newUser}) {
    _accessToken = accessToken;
    _newUser = newUser;
    notifyListeners();
  }

  /// Mark the new-user onboarding flow as finished.
  void completeOnboarding() {
    _newUser = false;
    notifyListeners();
  }

  /// Clear all auth state (sign-out).
  void clearAuth() {
    _accessToken = null;
    _newUser = false;
    notifyListeners();
  }
}
