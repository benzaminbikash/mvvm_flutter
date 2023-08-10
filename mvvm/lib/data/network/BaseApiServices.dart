abstract class BaseApiServices {
  Future<dynamic> getReponse(String url);
  Future<dynamic> getPostResponse(String url, dynamic data);
}
