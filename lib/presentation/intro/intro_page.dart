import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/presentation/intro/intro_object.dart';
import 'package:ezrxmobile/presentation/intro/intro_step.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  List<IntroObject> getOnBoardingObject(EligibilityState state) {
    return [
      IntroObject(
        heading: 'Order and track easily',
        description:
            'With the new and improved eZRx+ mobile app, you can order your prescription drugs, view order history and track delivery statuses easily.',
        assetsPath: 'assets/svg/intro_notes.svg',
        backgroundColor: ZPColors.introBlueBGColor,
        headingColor: ZPColors.white,
        descriptionColor: ZPColors.white,
        buttonBorderColor: ZPColors.neutralsBlack,
        buttonTextColor: ZPColors.neutralsBlack,
        buttonBGColor: ZPColors.lightLime,
      ),
      if (state.isPaymentEnabled)
        IntroObject(
          heading: 'Payments on the go',
          description:
              'Make payments, check credit limit and account summary balance with greater convenience.',
          assetsPath: 'assets/svg/intro_shopping_bag.svg',
          backgroundColor: ZPColors.lightVioletBGColor,
          headingColor: ZPColors.white,
          descriptionColor: ZPColors.white,
          buttonBorderColor: ZPColors.neutralsBlack,
          buttonTextColor: ZPColors.neutralsBlack,
          buttonBGColor: ZPColors.lightLime,
        ),
      if (state.isReturnsEnable)
        IntroObject(
          heading: 'Hassle-free returns',
          description:
              'Raise a return request and get notified of the approval status.',
          assetsPath: 'assets/svg/intro_wallet.svg',
          backgroundColor: ZPColors.blueBGColor,
          headingColor: ZPColors.white,
          descriptionColor: ZPColors.white,
          buttonBorderColor: ZPColors.white,
          buttonTextColor: ZPColors.neutralsBlack,
          buttonBGColor: ZPColors.lightLime,
        ),
    ];
  }

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
    //Here we are using userBloc instead of eligibilityBloc,
    //as our integration test is too fast that sometimes
    //it taps on getStarted button, before we update eligibility bloc.
    final userState = context.read<UserBloc>().state;
    if (userState.haveSalesOrganisation) {
      context.read<SalesOrgBloc>().add(
            SalesOrgEvent.loadSavedOrganisation(
              salesOrganisations: userState.user.userSalesOrganisations,
            ),
          );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocConsumer<IntroBloc, IntroState>(
        buildWhen: (previous, current) => previous.index != current.index,
        listenWhen: (previous, current) =>
            previous.isAppFirstLaunch != current.isAppFirstLaunch &&
            !current.isAppFirstLaunch,
        listener: (context, state) {
          if (!state.isAppFirstLaunch) {
            context.router
                .popUntilRouteWithName(HomeNavigationTabbarRoute.name);
          }
        },
        builder: (context, state) {
          return BlocBuilder<EligibilityBloc, EligibilityState>(
            buildWhen: (pre, cur) => pre != cur,
            builder: (context, eligibilityState) {
              final list = getOnBoardingObject(eligibilityState);

              return PageView.builder(
                allowImplicitScrolling: true,
                onPageChanged: (index) => context
                    .read<IntroBloc>()
                    .add(IntroEvent.setIndex(index: index)),
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: list.length,
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
                            child: _CustomIndicator(
                              index: state.index,
                              lastIndex: list.length - 1,
                              length: list.length,
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: IntroStep(
                              introObject: list[i],
                              isLastPage: i == (list.length - 1),
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
            },
          );
        },
      ),
    );
  }
}

class _CustomIndicator extends StatelessWidget {
  final int index;
  final int lastIndex;
  final int length;

  const _CustomIndicator({
    required this.index,
    required this.lastIndex,
    required this.length,
  });

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
    required this.isActive,
  });

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
