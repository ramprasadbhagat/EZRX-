import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/presentation/intro/intro_object.dart';
import 'package:ezrxmobile/presentation/intro/intro_step.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  List<IntroObject> getOnBoardingObject = [
    IntroObject(
      heading: 'Order and track easily',
      description:
          'With the new and improved eZRx+ mobile app, you can order your prescription drugs, view order history and track delivery statuses easily.',
      buttonText: 'Next',
      assetsPath: 'assets/images/temp1.png',
      backgroundColor: ZPColors.introBlueBGColor,
      headingColor: ZPColors.white,
      descriptionColor: ZPColors.white,
      buttonBorderColor: ZPColors.neutralsBlack,
      buttonTextColor: ZPColors.neutralsBlack,
      buttonBGColor: ZPColors.lightLime,
    ),
    IntroObject(
      heading: 'Payments on the go',
      description:
          'Make payments, check credit limit and account summary balance with greater convenience.',
      buttonText: 'Next',
      assetsPath: 'assets/images/temp3.png',
      backgroundColor: ZPColors.lightVioletBGColor,
      headingColor: ZPColors.white,
      descriptionColor: ZPColors.white,
      buttonBorderColor: ZPColors.neutralsBlack,
      buttonTextColor: ZPColors.neutralsBlack,
      buttonBGColor: ZPColors.lightLime,
    ),
    IntroObject(
      heading: 'Hassle-free returns',
      description:
          'Raise a return request and get notified of the approval status.',
      buttonText: 'Get started',
      assetsPath: 'assets/images/temp2.png',
      backgroundColor: ZPColors.blueBGColor,
      headingColor: ZPColors.white,
      descriptionColor: ZPColors.white,
      buttonBorderColor: ZPColors.white,
      buttonTextColor: ZPColors.neutralsBlack,
      buttonBGColor: ZPColors.lightLime,
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

  void _getStarted(BuildContext context) {
    context.read<IntroBloc>().add(const IntroEvent.setAppFirstLaunch());
    context.read<IntroBloc>().add(const IntroEvent.initialIndex());
    context.read<SalesOrgBloc>().add(
          SalesOrgEvent.loadSavedOrganisation(
            salesOrganisations: context
                .read<EligibilityBloc>()
                .state
                .user
                .userSalesOrganisations,
          ),
        );
  }

  int get lastIndexIntroObject => getOnBoardingObject.length - 1;

  @override
  void dispose() {
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
          body: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/intro_background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: BlocBuilder<IntroBloc, IntroState>(
                    buildWhen: (previous, current) =>
                        previous.index != current.index,
                    builder: (context, state) {
                      return _CustomIndicator(
                        index: state.index,
                        lastIndex: lastIndexIntroObject,
                        length: getOnBoardingObject.length,
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: IntroStep(
                    introObject: getOnBoardingObject[i],
                    canSkip: i != lastIndexIntroObject,
                    getStarted: () => _getStarted(context),
                    nextPage: _nextPage,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CustomIndicator extends StatelessWidget {
  final int index;
  final int lastIndex;
  final int length;
  const _CustomIndicator({
    Key? key,
    required this.index,
    required this.lastIndex,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        length,
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
        color: isActive ? ZPColors.white : ZPColors.unselectedIndicatorColor,
      ),
    );
  }
}
