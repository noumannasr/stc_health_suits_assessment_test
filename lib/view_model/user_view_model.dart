import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stc_health_suits_assessment_test_nouman/model/user_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(String token) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    print('we are in token');
    sp.setString('token', token.toString());
    notifyListeners();

    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserModel(
      token: token,
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
