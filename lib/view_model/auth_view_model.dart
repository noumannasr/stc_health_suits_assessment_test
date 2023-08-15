import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:stc_health_suits_assessment_test_nouman/model/user_model.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/colors.dart';
import 'package:stc_health_suits_assessment_test_nouman/respository/auth_repository.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/routes/routes_name.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/utils.dart';
import 'package:stc_health_suits_assessment_test_nouman/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  UserModel? model;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(
      String userName, String password, BuildContext context) async {
    //   {
    //     "username": "mor_2314",
    //   "password": "83r5^_"
    // }
    setLoading(true);
    Map data = {
      "username": userName.toString(),
      "password": password.toString()
    };
    _myRepo.loginApi(data).then((value) {
      model = UserModel.fromJson(json.decode(value));
      setLoading(false);
      UserViewModel().saveUser(model!.token.toString());
      Utils.flushBarErrorMessage(
          "Login Successfully", context, AppColors.greenColor, 'Success');
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.products, (route) => false);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.flushBarErrorMessage(
          error.toString(), context, AppColors.darkRedColor, 'Error');
    });
  }
}
