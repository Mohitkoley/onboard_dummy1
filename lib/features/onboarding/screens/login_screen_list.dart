// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:onboarding/features/auth/screens/screen1/login_screen1.dart';
import 'package:onboarding/features/auth/screens/screen2/login_screen2.dart';
import 'package:onboarding/features/onboarding/screens/intro_screens/screen1/intro_screen.dart';

import 'package:onboarding/utils/utils.dart';

class LoginScreenList extends StatefulWidget {
  const LoginScreenList({super.key});

  @override
  State<LoginScreenList> createState() => _LoginScreenListState();
}

class _LoginScreenListState extends State<LoginScreenList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("On Boarding Screens"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScreenButton(
                title: "Login 1",
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen1()))),
            ScreenButton(
                title: "Login 2",
                onPressed: () => context.navigateTo(LoginScreen2())),
            // ScreenButton(
            //     title: "intro 3",
            //     onPressed: () => context.navigateTo(IntroScreen())),
          ],
        ),
      ),
    );
  }
}

class ScreenButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const ScreenButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(context.width * 0.7, context.height * 0.1),
        ),
        child: Text(
          title,
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
