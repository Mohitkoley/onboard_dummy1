import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/const/resource.dart';
import 'package:onboarding/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
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

  List<String> assetNames = [
    R.ASSETS_SVG_RESEARCH_PAPER_RAFIKI_SVG,
    R.ASSETS_SVG_STUDYING_BRO_SVG,
    R.ASSETS_SVG_STUDYING_RAFIKI_SVG
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [_images(assetNames), _indicator()],
      )),
    );
  }

  Widget _images(List<String> assetNames) {
    return PageView.builder(
        itemCount: assetNames.length,
        controller: _pageController,
        itemBuilder: (context, index) {
          String assetName = assetNames[index];
          return SvgPicture.asset(assetName);
        });
  }

  Widget _indicator() {
    return Positioned(
      bottom: context.height * 0.02,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _indicatorItem(),
          _indicatorItem(),
          _indicatorItem(),
        ],
      ),
    );
  }

  _indicatorItem() {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 10,
      height: 10,
      decoration:
          const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}
