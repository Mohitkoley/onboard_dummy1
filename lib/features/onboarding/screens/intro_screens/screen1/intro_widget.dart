import 'package:flutter/material.dart';
import 'package:onboarding/features/onboarding/screens/login_screen_list.dart';
import 'package:onboarding/models/intro_pages.dart';
import 'package:onboarding/theme/colors.dart';
import 'package:onboarding/utils/utils.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key,
    required PageController pageController,
    required this.currentIndex,
  }) : _pageController = pageController;

  final PageController _pageController;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! < 0) {
            if (currentIndex < pages.length - 1) {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            }
          } else if (details.primaryDelta! > 0) {
            if (currentIndex > 0) {
              _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          height: context.height * 0.5,
          width: context.width,
          decoration: BoxDecoration(
              color: context.isDarkMode ? Colors.black : Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(70),
              )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(pages.length, (index) {
                    return _indicatorItem(index == currentIndex);
                  })
                ],
              ),
              20.hBox,
              Text(
                pages[currentIndex]["title"],
                style: context.bodyLarge
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              16.hBox,
              Text(
                pages[currentIndex]["description"],
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: currentIndex != pages.length - 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                _pageController.animateToPage(
                                  pages.length - 1,
                                  curve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 300),
                                );
                              },
                              child: Text('Skip Now',
                                  style: context.bodyLarge.copyWith(
                                    fontSize: 14,
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppColors.introGreen,
                                    borderRadius: BorderRadius.circular(50)),
                                child: const Icon(Icons.arrow_circle_right,
                                    color: Colors.white, size: 42),
                              ),
                            )
                          ],
                        )
                      : SizedBox(
                          width: context.width * 0.8,
                          height: 46,
                          child: MaterialButton(
                            color: AppColors.introGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return LoginScreenList();
                              }));
                            },
                            child: const Text('Get Started',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _indicatorItem(bool isCurrent) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: isCurrent ? 8 : 8,
      width: isCurrent ? 42 : 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isCurrent ? AppColors.introGreen : Colors.grey,
        // shape: isCurrent ? BoxShape.circle : BoxShape.rectangle,
      ),
    );
  }
}
