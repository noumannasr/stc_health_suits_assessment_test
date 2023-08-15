import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/components/app_text.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/colors.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/components/round_button.dart';
import 'package:stc_health_suits_assessment_test_nouman/utils/utils.dart';
import 'package:stc_health_suits_assessment_test_nouman/view_model/auth_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ValueNotifier obsecurePassword = ValueNotifier(true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              width: size.width,
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
              child: Column(
                children: [
                  Container(
                      height: size.height * 0.32,
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
                  Container(
                      height: size.height * 0.08,
                      width: size.width,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          AppText.login,
                          style: TextStyle(
                              fontSize: TextStylesData.headingSmallFontSize,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                  child: TextFormField(
                    controller: _emailAddressController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      // if(EmailValidator.validate(value)) {
                      //   setState(() {
                      //     isValid = true;
                      //   });
                      // } else {
                      //   setState(() {
                      //     isValid = false;
                      //   });
                      // }
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      fillColor: Colors.grey,
                      labelText: 'Email',
                      suffixIcon: GestureDetector(
                          onTap: () {
                            //  obsecurePassword.value = !obsecurePassword.value;
                          },
                          child: const Icon(
                            Icons.verified_outlined,
                            color: AppColors.greenColor,
                            size: 20,
                          )),
                      labelStyle: const TextStyle(
                        color: AppColors.greyColor,
                        fontSize: TextStylesData.smallFontSize,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                ValueListenableBuilder(
                    valueListenable: obsecurePassword,
                    builder: (context, value, child) {
                      return Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 0),
                        child: TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          obscureText: obsecurePassword.value ? true : false,
                          textInputAction: TextInputAction.done,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  obsecurePassword.value = !obsecurePassword.value;
                                },
                                child: Icon(
                                  obsecurePassword.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility,
                                  size: 20,
                                  color: AppColors.greyColor.withOpacity(0.5),
                                )),
                            fillColor: Colors.grey,
                            labelText: 'Password',
                            hintText: '************',
                            labelStyle: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: TextStylesData.smallFontSize,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: RoundButton(
                    width: size.width,
                    isLoading: authViewModel.loading,
                    round: 30.0,
                    color: AppColors.lightBlueColor,
                    title: AppText.continueText,
                    onPress: () {
                      // Navigator.pushNamed(context, RoutesName.products);

                      if (_emailAddressController.text.isEmpty) {
                        Utils.flushBarErrorMessage('Enter email ', context,
                            AppColors.darkRedColor, 'Error');
                      } else if (_passwordController.text.isEmpty) {
                        Utils.flushBarErrorMessage('Enter password ', context,
                            AppColors.darkRedColor, 'Error');
                      } else if (_passwordController.text.length < 6) {
                        Utils.flushBarErrorMessage(
                            'Please enter 6 digits password ',
                            context,
                            AppColors.darkRedColor,
                            'Error');
                      } else {
                        authViewModel.loginApi(_emailAddressController.text,
                            _passwordController.text, context);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppText.needHelp,
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: TextStylesData.smallFontSize,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
