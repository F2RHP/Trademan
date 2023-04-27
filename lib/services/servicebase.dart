import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseService {
  static const String _baseUrl = "http://ponsinghclone-001-site5.itempurl.com/api";

  Future<T> get<T>(String endpoint) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.get(url);
    return _parseResponse<T>(response);
  }
  Future<T> getWithParam<T>(String endpoint, Map<String, dynamic> queryParams) async {
  final uri = Uri.parse(endpoint).replace(queryParameters: queryParams);
  final response = await http.get(uri);
  return _parseResponse<T>(response);
}

  Future<T> post<T>(String endpoint, dynamic body) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.post(url, body: jsonEncode(body));
    return _parseResponse<T>(response);
  }

  Future<T> put<T>(String endpoint, dynamic body) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.put(url, body: jsonEncode(body));
    return _parseResponse<T>(response);
  }

  Future<void> delete(String endpoint) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.delete(url);
    _parseResponse<dynamic>(response);
  }

  T _parseResponse<T>(http.Response response) {
    final jsonBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonBody as T;
    } else {
      throw Exception('Failed to call API: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
