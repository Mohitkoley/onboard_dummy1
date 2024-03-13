import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/utils/utils.dart';

class IntroWidget3 extends StatelessWidget {
  const IntroWidget3({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.currentIndex,
  });
  final String imagePath;
  final String title;
  final String description;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          imagePath,
          height: context.height * 0.4,
        ),
        Text(
          title,
          style: context.textTheme.bodyLarge!.copyWith(
              fontSize: context.height * 0.04, fontWeight: FontWeight.bold),
        ),
        10.hBox,
        SizedBox(
          width: context.width * 0.9,
          child: Text(
            description,
            style: context.textTheme.bodyMedium!.copyWith(fontSize: 17),
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => _indicatorItem(index, context, currentIndex),
          ),
        ),
        20.hBox,
      ],
    );
  }

  _indicatorItem(
    int index,
    BuildContext context,
    int currentIndex,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(4),
      width: 10,
      height: 8,
      decoration: BoxDecoration(
          color: (currentIndex >= index)
              ? context.textTheme.bodyLarge!.color
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}
