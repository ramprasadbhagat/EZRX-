import 'dart:async';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CarouselBanner extends StatefulWidget {
  const CarouselBanner({Key? key}) : super(key: key);

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  final _controller = PageController();
  Timer? bannerTimer;
  bool isBannerVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<BannerBloc>(),
      child: BlocListener<SalesOrgBloc, SalesOrgState>(
        listenWhen: (previous, current) =>
            previous.salesOrganisation != current.salesOrganisation,
        listener: (context, state) {
          context.read<BannerBloc>().add(
                BannerEvent.fetch(
                  isPreSalesOrg: false,
                  salesOrganisation: state.salesOrganisation,
                  country: state.salesOrg.country,
                  role: context
                      .read<UserBloc>()
                      .state
                      .user
                      .role
                      .type
                      .getEZReachRoleType,
                  bannerType: 'banner_carousel',
                ),
              );
        },
        child: BlocConsumer<BannerBloc, BannerState>(
          listenWhen: (previous, current) => previous.banner != current.banner,
          listener: (context, state) {
            state.bannerFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          buildWhen: (previous, current) => previous.banner != current.banner,
          builder: (context, state) {
            bannerTimer?.cancel();
            if (state.banner.isEmpty) {
              return const SizedBox.shrink();
            }
            if (state.banner.length > 1) {
              startBannerScrollTimer();
            }
            final bannerHeight = MediaQuery.of(context).size.width * 0.5;

            return Stack(
              children: [
                SizedBox(
                  height: bannerHeight,
                  child: VisibilityDetector(
                    key: WidgetKeys.visibilityDetector,
                    onVisibilityChanged: (info) {
                      final visiblePercentage = info.visibleFraction * 100;
                      isBannerVisible = visiblePercentage >= 80;
                    },
                    child: PageView.builder(
                      key: WidgetKeys.homeBanner,
                      controller: _controller,
                      allowImplicitScrolling: true,
                      itemBuilder: (_, index) {
                        final banner =
                            state.banner[index % state.banner.length];
                        if (isBannerVisible &&
                            banner != BannerItem.empty() &&
                            index > 1) {
                          trackMixpanelEvent(
                            MixpanelEvents.bannerImpression,
                            props: {
                              MixpanelProps.bannerId: banner.id.toString(),
                              MixpanelProps.bannerTitle: banner.title,
                            },
                          );
                        }

                        return CarouselBannerTile(
                          key: Key(state.banner[index % state.banner.length].id
                              .toString()),
                          bannerPosition: index % state.banner.length,
                          banner: state.banner[index % state.banner.length],
                        );
                      },
                    ),
                  ),
                ),
                state.banner.isNotEmpty
                    ? Positioned(
                        bottom: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: SmoothPageIndicator(
                            controller: _controller,
                            onDotClicked: (index) =>
                                _controller.jumpToPage(index),
                            count: state.banner.length,
                            effect: ExpandingDotsEffect(
                              dotHeight:
                                  MediaQuery.of(context).size.width * 0.02,
                              dotWidth:
                                  MediaQuery.of(context).size.width * 0.02,
                              dotColor: ZPColors.translucentWhite,
                              activeDotColor: ZPColors.white,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Positioned(
                  left: 12,
                  child: Container(
                    height: bannerHeight,
                    alignment: Alignment.center,
                    child: _CircleButton(
                      iconData: Icons.chevron_left,
                      onTap: previousPage,
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  child: Container(
                    height: bannerHeight,
                    alignment: Alignment.center,
                    child: _CircleButton(
                      iconData: Icons.chevron_right,
                      onTap: nextPage,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    bannerTimer?.cancel();
  }

  void startBannerScrollTimer() {
    if (_controller.hasClients) {
      _controller.jumpToPage(0);
    }
    bannerTimer = Timer.periodic(
      const Duration(seconds: 8),
      (timer) {
        nextPage();
      },
    );
  }

  void nextPage() {
    if (_controller.hasClients) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (_controller.hasClients) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }
}

class _CircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  const _CircleButton({
    Key? key,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ZPColors.translucentWhite,
        ),
        child: Icon(
          iconData,
          color: ZPColors.white,
        ),
      ),
    );
  }
}
