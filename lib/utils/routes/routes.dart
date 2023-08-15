import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/routes/routes_name.dart';
import 'package:stc_health_suits_assessment_test_nouman/view/authentication/login_view.dart';
import 'package:stc_health_suits_assessment_test_nouman/view/detail/product_detail_screen.dart';
import 'package:stc_health_suits_assessment_test_nouman/view/products/product_screen.dart';
import 'package:stc_health_suits_assessment_test_nouman/view/splash/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());

      case RoutesName.products:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProductScreen());
      case RoutesName.product_detail:
        int id = settings.arguments as int;
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductDetailScreen(
                  productId: id,
                ));

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Center(
                  child: Text('No Route Defined'),
                ));
    }
  }
}
