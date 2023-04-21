import 'package:http/http.dart' as http;

class AppApi {
  static String url = 'truyen-clone.getdata.one';

  static Future<http.Response> get({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    return await http.get(Uri.https(url, path));
  }

  static Future<http.Response> getQuery({
    required String path,
    required dynamic query,
  }) async {
    return await http.get(Uri.https(url, path, query));
  }

  static Future<http.Response> getWithId({
    required String path,
    required String id,
  }) async {
    return await http.get(Uri.https(url, '$path/$id'));
  }
}
