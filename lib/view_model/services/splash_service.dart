import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/services/user_service.dart';

import '../../model/user_model.dart';

class SplashService {
  // get userToken
  Future<UserModel> getUserToken() => UserService().getToken();

  // authentication check
  void checkAuthentication(BuildContext context) {
    getUserToken().then((value) {
      if (value.token == null || value.token.toString() == '') {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      Utils.flushBar(error.toString(), context);
    });
  }
}
