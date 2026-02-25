import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = dotenv.env['BASEURL']!;
  final Dio _dio;
  ApiService(this._dio);

  Future<List<dynamic>> get({required String endPoint}) async {
    final response = await http.get(Uri.parse('$_baseUrl$endPoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> get2({required String endPoint}) async {
    final response = await http.get(Uri.parse('$_baseUrl$endPoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
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

// import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class ApiService {
//   final _baseUrl = dotenv.env['BASEURL']!;
//   // 'https://fakestoreapi.com/';
//   final Dio _dio;

//   ApiService(this._dio);

//   Future<List<dynamic>> get({required String endPoint}) async {
//     var response = await _dio.get('$_baseUrl$endPoint');
//     return response.data;
//   }

//   Future<Map<String, dynamic>> get2({required String endPoint}) async {
//     var response = await _dio.get('$_baseUrl$endPoint');
//     // _dio.interceptors.add(DioFirebasePerformanceInterceptor());
//     return response.data;
//   }

//   Future<Response> post(
//       {required body,
//       required String url,
//       required String token,
//       Map<String, String>? headers,
//       String? contentType}) async {
//     var response = await _dio.post(url,
//         data: body,
//         options: Options(
//           contentType: contentType,
//           headers: headers ?? {'Authorization': 'Bearer $token'},
//         ));
//     //  _dio.interceptors.add(DioFirebasePerformanceInterceptor());

//     return response;
//   }
// }
