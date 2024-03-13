import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/theme/colors.dart';
import 'package:onboarding/models/intro_pages.dart';
import 'package:onboarding/utils/utils.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  int selectedIndex = 0;

  AnimationController? _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!);
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0), // Down to Up transition
      end: Offset(0.0, 0.0),
    ).animate(_animationController!);
    _animationController!.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  // List<String> assetNames = [
  //   R.ASSETS_SVG_RESEARCH_PAPER_RAFIKI_SVG,
  //   R.ASSETS_SVG_STUDYING_BRO_SVG,
  //   R.ASSETS_SVG_STUDYING_RAFIKI_SVG
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [_images(pages), _indicator(context)],
      )),
    );
  }

  Widget _images(List pages) {
    return Positioned(
      top: 10,
      right: 0,
      left: 0,
      child: SizedBox(
        height: context.height * 0.5,
        width: context.width,
        child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
              _animationController!.forward(from: 0.0);
            },
            itemCount: pages.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              Map<String, dynamic> content = pages[index];
              return SvgPicture.asset(content["image"]);
            }),
      ),
    );
  }

  Widget _indicator(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: AnimatedBuilder(
          animation: _animationController!,
          child: Container(
              decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    )
                  ]),
              height: context.height * 0.4,
              width: context.width,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int index = 0; index < pages.length; index++) ...[
                        _indicatorItem(index, context,
                            isCurrent: selectedIndex == index)
                      ]
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _titleText(pages[selectedIndex]["title"], context),
                  const SizedBox(
                    height: 10,
                  ),
                  _descriptionText(
                      pages[selectedIndex]["description"], context),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (selectedIndex != pages.length - 1)
                        TextButton(
                          onPressed: () {
                            _pageController.animateToPage(
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 300),
                              pages.length - 1,
                            );
                          },
                          child: Text("Skip",
                              style: context.textTheme.bodyMedium!
                                  .copyWith(color: AppColors.secondryColor)),
                        ),
                      // _nextButton("Next", context, () {})
                      NextButton(
                          pageController: _pageController,
                          selectedIndex: selectedIndex)
                    ],
                  )
                ],
              )),
          builder: (context, child) {
            return child!;
          }),
    );
  }

  Widget _titleText(
    String title,
    BuildContext context,
  ) {
    return _slidingAnimaiton(SizedBox(
      width: context.width * 0.8,
      child: Text(
        title,
        style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold, fontSize: context.width * 0.08),
      ),
    ));
  }

  _descriptionText(String title, BuildContext context) {
    return _slidingAnimaiton(SizedBox(
      width: context.width * 0.8,
      child: Text(title,
          style: context.textTheme.bodyMedium!.copyWith(fontSize: 17)),
    ));
  }

  _slidingAnimaiton(Widget child) {
    return FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _offsetAnimation,
          child: SizedBox(
            width: context.width * 0.8,
            child: child,
          ),
        ));
  }

  _indicatorItem(int index, BuildContext context, {bool isCurrent = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(4),
      width: isCurrent ? 30 : 10,
      height: 8,
      decoration: BoxDecoration(
        color: isCurrent ? AppColors.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required PageController pageController,
    required this.selectedIndex,
  }) : _pageController = pageController;

  final PageController _pageController;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 50),
        ),
        onPressed: () {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        },
        child: Text(
            (selectedIndex != pages.length - 1) ? "Next" : "Get started",
            style: context.textTheme.bodyLarge!.copyWith(
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: context.isDarkMode ? AppColors.black : AppColors.white)),
      ),
    );
  }
}
