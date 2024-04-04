import 'package:mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  // set token
  Future<void> setToken(String token) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', token);
  }

  //get token
  Future<UserModel> getToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return UserModel(token: sp.getString('token'));
  }

  // remove token
  Future<void> removeToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
  }
}
