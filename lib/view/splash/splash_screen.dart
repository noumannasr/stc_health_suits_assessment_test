import 'package:flutter/material.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/app_text.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/colors.dart';
import 'package:stc_health_suits_assessment_test_nouman/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
              AppColors.blueColor,
              AppColors.lightBlueColor,
            ],
                stops: [
              0.0,
              1.0
            ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.repeated)),
        width: size.width,
        height: size.height,
        child: Container(
            width: size.width * 0.5,
            child: const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                AppText.stc_health,
                style: TextStyle(
                    fontSize: TextStylesData.headingLargeFontSize,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ))),
      ),
    );
  }
}
