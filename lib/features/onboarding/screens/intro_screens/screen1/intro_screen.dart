import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/models/intro_pages.dart';
import 'package:onboarding/features/onboarding/screens/intro_screens/screen1/intro_widget.dart';
import 'package:onboarding/theme/colors.dart';
import 'package:onboarding/utils/utils.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.introGreen,
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: context.height * 0.5,
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> page = pages[index];
                  return SvgPicture.asset(page["image"]);
                }),
          ),
          IntroWidget(
            pageController: _pageController,
            currentIndex: currentIndex,
          )
        ],
      )),
    );
  }
}
