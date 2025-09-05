abstract class BaseApiService {
  Future<dynamic> getApi(String uri);

  Future<dynamic> postApi(dynamic data, String uri);
}
