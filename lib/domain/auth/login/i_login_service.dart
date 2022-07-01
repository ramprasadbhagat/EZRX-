abstract class ILoginService {
  Future<Map?> login();
  Future<Map?> getAccessToken();
  Future<bool?> logout();
  Future<dynamic> getUserProfile();
}
