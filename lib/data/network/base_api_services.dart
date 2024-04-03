abstract class BaseApiServices {
  // get request
  Future<dynamic> getGetApiService(String url);
  // post request
  Future<dynamic> getPostApiService(String url, dynamic data);
}
