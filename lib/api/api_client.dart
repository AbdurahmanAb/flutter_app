import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String BaseUrl;

  late Map<String, String> _headers;

  ApiClient({required this.BaseUrl}) {
    baseUrl = BaseUrl;
    timeout = Duration(seconds: 30);
    token = '';
    _headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token}'
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
