import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/theme/colors.dart';
import 'package:onboarding/utils/utils.dart';

class IntroWidget1 extends StatelessWidget {
  const IntroWidget1({
    super.key,
    required this.title,
    required this.description,
    required this.skip,
    required this.image,
    required this.onTab,
    required this.onSkip,
    required this.index,
  });

  final String title;
  final String description;
  final bool skip;
  final String image;
  final VoidCallback onTab;
  final VoidCallback onSkip;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.introGreen,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.86,
            child: SvgPicture.asset(image),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: context.height / 2.16,
              decoration: BoxDecoration(
                  color: context.isDarkMode ? Colors.black : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(70),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 62,
                    ),
                    Text(title,
                        style: context.textTheme.bodyLarge!.copyWith(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      description,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: skip
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: onSkip,
                            child: Text('Skip Now',
                                style: context.bodyLarge.copyWith(
                                  fontSize: 14,
                                )),
                          ),
                          GestureDetector(
                            onTap: onTab,
                            child: Container(
                              padding: const EdgeInsets.all(16),
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
                        height: 46,
                        child: MaterialButton(
                          color: AppColors.introGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {},
                          child: const Text('Get Started',
                              style: TextStyle(color: Colors.white)),
                        ),
                      )),
          )
        ],
      ),
    );
  }
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
