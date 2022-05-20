import 'package:dio/dio.dart';
import 'package:watertcmapp2/login_radius/login_radius_api.dart';

//This is the HTTP client for interacting with login radius

class LRClient {
  LoginRadius lrCredentials = LoginRadius.instance;

  String endPointUrl = 'https://api.loginradius.com/identity/v2/auth/';
  final Dio dio = Dio();

  Future<Response> post(
      {String endPoint = '',
      dynamic data,
      Map<String, dynamic> params = const {}}) async {
    print(data);
    try {
      Response response = await dio.post(endPointUrl + endPoint, //ENDPONT URL
          data: data, //REQUEST BODY
          queryParameters: {
            'apikey': lrCredentials.apiKey,
            ...params
          }, //QUERY PARAMETERS
          options: Options(
            headers: {'X-LoginRadius-Sott': lrCredentials.sott}, //HEADERS
          ));
      //returns the successful json object
      return response;
    } on DioError catch (e) {
      //returns the error object if there is
      throw e.response!;
    }
  }

  Future<Response> get(
      {String endPoint = '',
      Map<String, dynamic> params = const {},
      required String authToken}) async {
    print(params);
    try {
      Response response = await dio.get(endPointUrl + endPoint, //ENDPONT URL
          queryParameters: {
            'apikey': lrCredentials.apiKey,
            ...params
          }, //QUERY PARAMETERS
          options: Options(
            headers: {
              'X-LoginRadius-Sott': lrCredentials.sott,
              'Authorization': 'Bearer ' + authToken
            }, //HEADERS
          ));
      //returns the successful json object
      return response.data;
    } on DioError catch (e) {
      //returns the error object if there is
      return e.response!.data;
    }
  }
}
