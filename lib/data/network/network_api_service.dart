import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:mvvm/data/app_exceptions.dart';
import 'package:http/http.dart' as http;

import '../../view_model/services/user_service.dart';
import 'base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  // get request
  @override
  Future getGetApiService(String url) async {
    dynamic responseData;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseData = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseData;
  }

  // post request
  @override
  Future getPostApiService(String url, dynamic data) async {
    dynamic responseData;

    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responseData = returnResponse(response);
      UserService().setToken(responseData.toString());

      log('Token: $responseData');
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseData;
  }

  // response handle
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occurred while communicating with server with status code ${response.statusCode.toString()}',
        );
    }
  }
}
