import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onboarding/const/resource.dart';
import 'package:onboarding/shared/common_textfield.dart';
import 'package:onboarding/theme/colors.dart';
import 'package:onboarding/utils/utils.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.introGreen,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: SizedBox(
                      height: 70,
                      width: context.width,
                      child: Text(
                        "Logo here",
                        style: context.bodyLarge.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: context.theme.scaffoldBackgroundColor,
                        ),
                      )),
                ),
                Container(
                  // height: context.height,
                  // width: context.width,
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Utils.circle,
                      topRight: Utils.circle,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: context.width,
                        child: Text(
                          "Login",
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      20.hBox,
                      SizedBox(
                        width: context.width,
                        child: Text(
                          "Enter your email and password to login",
                          style: context.bodyMedium.copyWith(),
                        ),
                      ),
                      20.hBox,
                      CommonTextField(
                        controller: emailController,
                        hintText: "Email Address",
                      ),
                      20.hBox,
                      CommonTextField(
                        controller: passwordController,
                        hintText: "Password",
                        isPassword: true,
                      ),
                      20.hBox,
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: context.width,
                          child: Text(
                            "Forgot Password?",
                            style: context.bodyMedium.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      20.hBox,
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: Size(context.width, 55),
                          backgroundColor: AppColors.introGreen,
                        ),
                        child: Text(
                          "Login",
                          style: context.bodyLarge.copyWith(
                            color: context.theme.scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                      20.hBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: context.bodyMedium.copyWith(),
                          ),
                          10.wBox,
                          GestureDetector(
                            onTap: () {
                              // context.navigateTo(SignUpScreen());
                            },
                            child: Text(
                              "Sign Up",
                              style: context.bodyMedium.copyWith(
                                color: AppColors.introGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                      20.hBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Divider(
                            color:
                                context.isDarkMode ? Colors.white : Colors.grey,
                          )),
                          10.wBox,
                          Text(
                            "OR",
                            style: context.bodyMedium
                                .copyWith(color: AppColors.supporterColor),
                          ),
                          10.wBox,
                          Expanded(
                            child: Divider(
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      20.hBox,
                      Container(
                        width: context.width,
                        height: 55,
                        decoration: BoxDecoration(
                          color: context.theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: context.isDarkMode
                                ? AppColors.white
                                : AppColors.supporterColor,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              R.ASSETS_PNG_GOOGLE_LOGO_PNG,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                            15.wBox,
                            Text(
                              "SignIn with Google",
                              style: context.bodyMedium.copyWith(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
