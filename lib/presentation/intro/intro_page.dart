import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/presentation/intro/intro_object.dart';
import 'package:ezrxmobile/presentation/intro/intro_step.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  Timer? _timer;
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  List<IntroObject> getOnBoardingObject = [
    IntroObject(
      heading: 'Order and track easily',
      description:
          'With our interactive engagement portal, you can now order prescription drugs, and view order history and status on eZRx+ mobile app.',
      buttonText: 'Skip',
      assetsPath: SvgImage.introScreen1,
      backgroundColor: ZPColors.navyBlueBGColor,
      headingColor: ZPColors.white,
      descriptionColor: ZPColors.shadowColor,
      buttonBorderColor: ZPColors.white,
      buttonTextColor: ZPColors.white,
      buttonBGColor: ZPColors.navyBlueBGColor,
    ),
    IntroObject(
      heading: 'Payments on the go',
      description:
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
      buttonText: 'Skip',
      assetsPath: SvgImage.introScreen2,
      backgroundColor: ZPColors.lightVioletBGColor,
      headingColor: ZPColors.primary,
      descriptionColor: ZPColors.neutralsBlack,
      buttonBorderColor: ZPColors.primary,
      buttonTextColor: ZPColors.primary,
      buttonBGColor: ZPColors.lightVioletBGColor,
    ),
    IntroObject(
      heading: 'Fuss-free returns',
      description:
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
      buttonText: 'Get started',
      assetsPath: SvgImage.introScreen3,
      backgroundColor: ZPColors.blueBGColor,
      headingColor: ZPColors.white,
      descriptionColor: ZPColors.shadowColor,
      buttonBorderColor: ZPColors.white,
      buttonTextColor: ZPColors.primary,
      buttonBGColor: ZPColors.white,
    ),
  ];

  void _nextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }

  void startTimer() => _timer = Timer.periodic(
        const Duration(seconds: 6),
        (timer) => _nextPage(),
      );

  void _getStarted(BuildContext context) {
    context.router.push(
      HomeNavigationTabbarRoute(),
    );
    context.read<IntroBloc>().add(const IntroEvent.initialIndex());
  }

  int get lastIndexIntroObject => getOnBoardingObject.length - 1;

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      allowImplicitScrolling: true,
      onPageChanged: (index) =>
          context.read<IntroBloc>().add(IntroEvent.setIndex(index: index)),
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemCount: getOnBoardingObject.length,
      itemBuilder: (context, i) {
        return Scaffold(
          backgroundColor: getOnBoardingObject[i].backgroundColor,
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title:  BlocBuilder<IntroBloc, IntroState>(
              buildWhen: (previous, current) => previous.index != current.index,
              builder: (context, state) {
                _timer?.cancel();
                if (state.index < lastIndexIntroObject) {
                  startTimer();
                }

                return _CustomIndicator(
                  index: state.index,
                  lastIndex: lastIndexIntroObject,
                );
              },
            ),
          ),
          body: IntroStep(
            introObject: getOnBoardingObject[i],
            buttonOnTap: () => i == lastIndexIntroObject
                ? _getStarted(context)
                : _nextPage(),
          ),
        );
      },
    );
  }
}

class _CustomIndicator extends StatelessWidget {
  final int index;
  final int lastIndex;
  const _CustomIndicator(
      {Key? key, required this.index, required this.lastIndex,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
            (i) => Expanded(
          child: _HorizontalDivider(isActive: index == i),
        ),
      ),
    );
  }
}

class _HorizontalDivider extends StatelessWidget {
  const _HorizontalDivider({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isActive
            ? ZPColors.white
            : ZPColors.unselectedIndicatorColor,
      ),
    );
  }
}
