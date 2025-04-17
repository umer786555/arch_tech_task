import 'package:http/http.dart' as http;

class DataService {
  Future<http.Response> get(String endpoint) async {
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
