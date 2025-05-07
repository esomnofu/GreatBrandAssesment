import 'package:http/http.dart' as http;

final class ApiService {
  static final ApiService _sharedInstance = ApiService();
  static ApiService shared() {
    return _sharedInstance;
  }

  final client = http.Client();

  //Start: No BearerToken Calls
  final Map<String, String> _authorizationHeader = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  Future<dynamic> getRequest(String url) async {
    try {
      final response =
          await client.get(Uri.parse(url), headers: _authorizationHeader);
      return response;
    } catch (_) {
      return null;
    }
  }
}
