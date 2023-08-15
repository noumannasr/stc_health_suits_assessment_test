import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/routes/routes.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/routes/routes_name.dart';
import 'package:stc_health_suits_assessment_test_nouman/view/authentication/login_view.dart';
import 'package:stc_health_suits_assessment_test_nouman/view_model/auth_view_model.dart';
import 'package:stc_health_suits_assessment_test_nouman/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'STC Health Suits Assessments Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.transparent,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoutes,
        home: const LoginView(),
      ),
    );
  }
}
