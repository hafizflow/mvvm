import 'package:flutter/cupertino.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

import '../utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final _myRepository = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  loginApi(dynamic data, BuildContext context) {
    setLoading(true);
    _myRepository.loginApi(data).then((value) {
      setLoading(false);
      // UserService().setToken(value.toString());
      Navigator.pushNamed(context, RoutesName.home);
      Utils.flushBar('Login Successful', context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBar(error.toString(), context);
    });
  }
}
