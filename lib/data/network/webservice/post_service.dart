import 'package:http/http.dart' as http;

import '../endpoints.dart';

class PostService {
  static Future<http.Response> getPost() => http.get(Uri.parse(Endpoint.POST));
}
