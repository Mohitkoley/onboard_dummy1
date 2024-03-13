import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onboarding/models/intro_pages.dart';
import 'package:onboarding/screens/intro_screens/screen3/intro_widget3.dart';
import 'package:onboarding/theme/colors.dart';
import 'package:onboarding/utils/utils.dart';

class IntroScreen3 extends StatefulWidget {
  const IntroScreen3({super.key});

  @override
  State<IntroScreen3> createState() => _IntroScreen3State();
}

class _IntroScreen3State extends State<IntroScreen3> {
  int currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              // color: Colors.red,
              height: context.height * 0.8,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _pageController,
                itemBuilder: (context, index) {
                  return IntroWidget3(
                    imagePath: pages[index]["image"],
                    title: pages[index]["title"],
                    description: pages[index]["description"],
                    currentIndex: index,
                  );
                },
                itemCount: pages.length,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(pages.length - 1);
                  },
                  child: SizedBox(
                    width: context.width * 0.2,
                    child: Text("Skip",
                        textAlign: TextAlign.center,
                        style: context.bodyLarge.copyWith(color: Colors.grey)),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    if (currentIndex == pages.length - 1) {
                    } else {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    alignment: currentIndex == pages.length - 1
                        ? Alignment.center
                        : Alignment.centerRight,
                    height: context.height * 0.07,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.secondryColor,
                    ),
                    child: currentIndex != pages.length - 1
                        ? const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          )
                        : Text(
                            "Get Started",
                            style: context.bodyLarge.copyWith(
                                color: context.colorScheme.background),
                          ),
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
