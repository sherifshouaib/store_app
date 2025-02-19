import 'package:dio/dio.dart';

class ApiService {

  final _baseUrl = 'https://fakestoreapi.com/';
  final Dio _dio;

  ApiService(this._dio);

  Future<List<dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }


 Future<Map<String,dynamic>> get2({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }


}