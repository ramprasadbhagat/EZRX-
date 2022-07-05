abstract class ILoginService {
  Future<bool?> init();
  Future<Map?> login();
  Future<Map?> getAccessToken();
  Future<bool?> logout();
  Future<dynamic> getUserProfile();
}
