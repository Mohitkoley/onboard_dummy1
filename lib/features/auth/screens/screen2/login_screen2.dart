import 'package:flutter/material.dart';
import 'package:onboarding/shared/common_textfield.dart';
import 'package:onboarding/utils/utils.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // wave like shape of green color Container
            SizedBox(
              height: context.height * 0.2,
              width: context.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: WaveClipper(),
                    child: _upperCut(context),
                  ),
                  Positioned(
                    top: context.height * 0.08,
                    child: Container(
                      height: context.height * 0.08,
                      width: context.height * 0.08,
                      decoration: BoxDecoration(
                          color: context.theme.scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: context.isDarkMode
                                  ? Colors.grey.shade100
                                  : Colors.grey,
                              blurRadius: 3,
                              spreadRadius: 2,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 40,
                      width: context.width,
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: context.bodyLarge.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                      height: 70,
                      width: context.width,
                      child: Text(
                        "Enter your email and password to login",
                        textAlign: TextAlign.center,
                        style: context.bodyLarge.copyWith(),
                      )),
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
                ],
              ),
            ),

            // _upperCut(context),
          ],
        ),
      )),
    );
  }

  Widget _upperCut(BuildContext context) {
    return Container(
      height: context.height * 0.2,
      width: double.infinity,
      color: Colors.green,
      alignment: Alignment.center,
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    var firstControlPoint = Offset(size.width / 2, size.height * 0.2);
    var firstEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    // var secondControlPoint = Offset(size.width * 0.75, size.height * 0.1);
    // var secondEndPoint = Offset(size.width, size.height * 0.4);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
