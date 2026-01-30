import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://fakestoreapi.com/';
  final Dio _dio;

  ApiService(this._dio);

  Future<List<dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> get2({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
   // _dio.interceptors.add(DioFirebasePerformanceInterceptor());
    return response.data;
  }

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await _dio.post(url,
        data: body,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': 'Bearer $token'},
        ));
  //  _dio.interceptors.add(DioFirebasePerformanceInterceptor());

    return response;
  }
}
