import 'dart:developer';

import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/resorces/app_url.dart';
import 'package:mvvm/view_model/services/user_service.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  // login api call and response
  Future<void> loginApi(dynamic data) async {
    try {
      dynamic response =
          _apiServices.getPostApiService(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // registration api call and response
  Future<void> registrationApi(dynamic data) async {
    try {
      dynamic response =
          _apiServices.getPostApiService(AppUrl.registrationEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
