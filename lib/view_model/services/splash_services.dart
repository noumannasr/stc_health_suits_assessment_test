import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:stc_health_suits_assessment_test_nouman/model/user_model.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/routes/routes_name.dart';
import 'package:stc_health_suits_assessment_test_nouman/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (kDebugMode) {
        print(value.toString());
      }

      if (value.token.toString() == 'null' || value.token == '') {
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.products, (route) => false);
        // Navigator.pushNamedAndRemoveUntil(context, RoutesName.products,);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
