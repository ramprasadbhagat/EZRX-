import 'dart:async';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselBanner extends StatefulWidget {
  const CarouselBanner({Key? key}) : super(key: key);

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  final _controller = PageController();
  Timer? bannerTimer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<BannerBloc>(),
      child: BlocListener<EligibilityBloc, EligibilityState>(
        listenWhen: (previous, current) =>
            previous.shipToInfo != current.shipToInfo && current.haveShipTo ||
            (previous.isLoadingCustomerCode != current.isLoadingCustomerCode &&
                    !current.isLoadingCustomerCode) &&
                current.salesOrganisation.salesOrg.isValid(),
        listener: (context, state) {
          // ID uses targeted banner carousels for users so we need to include targetCustomerType and branchCode in the eZReach banner call.
          // This feature is not applicable for other markets.
          context.read<BannerBloc>().add(
                BannerEvent.fetch(
                  isPreSalesOrg: false,
                  salesOrganisation: state.salesOrganisation,
                  country: state.salesOrg.country,
                  role: state.user.role.type.getEZReachRoleType,
                  bannerType: 'banner_carousel',
                  branchCode: state.isIDMarket ? state.shipToInfo.plant : '',
                  targetCustomerType: state.isIDMarket
                      ? state.shipToInfo.targetCustomerType
                      : '',
                ),
              );
        },
        child: BlocConsumer<BannerBloc, BannerState>(
          listenWhen: (previous, current) => previous.banner != current.banner,
          listener: (context, state) {
            if (state.banner.isNotEmpty) {
              startBannerScrollTimer();
              _trackBannerChangeEvent(context: context, index: 0);
            }
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
          buildWhen: (previous, current) =>
              previous.banner != current.banner ||
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            if (state.banner.isEmpty) {
              return const SizedBox.shrink();
            }
            // eZReach banner for mobile
            // W 856 * H 550
            // eZReach banner for Desktop
            // W 1440 * H 420
            // US url - https://zuelligpharma.atlassian.net/browse/EZRX-15644 (for reference)
            final ratio =
                Responsive.isMobile(context) ? (550 / 856) : (420 / 1440);
            final bannerHeight = MediaQuery.of(context).size.width * ratio;

            return Stack(
              children: [
                SizedBox(
                  height: bannerHeight,
                  child: LoadingShimmer.withChild(
                    enabled: state.isLoading,
                    child: PageView.builder(
                      key: WidgetKeys.homeBanner,
                      onPageChanged: (index) {
                        final bannerPosition = index % state.banner.length;

                        _trackBannerChangeEvent(
                          context: context,
                          index: bannerPosition,
                        );
                      },
                      controller: _controller,
                      allowImplicitScrolling: true,
                      itemBuilder: (_, index) {
                        final bannerPosition = index % state.banner.length;

                        return CarouselBannerTile(
                          key: Key(
                            state.banner[bannerPosition].id.toString(),
                          ),
                          bannerPosition: bannerPosition,
                          banner: state.banner[bannerPosition],
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
                      key: WidgetKeys.previousBannerIcon,
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
                      key: WidgetKeys.nextBannerIcon,
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
    bannerTimer?.cancel();
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

  void _trackBannerChangeEvent({
    required BuildContext context,
    required int index,
  }) {
    final banner = context.read<BannerBloc>().state.banner[index];
    trackMixpanelEvent(
      TrackingEvents.bannerImpression,
      props: {
        TrackingProps.bannerId: banner.id,
        TrackingProps.bannerTitle: banner.title,
        TrackingProps.bannerOrder: index + 1,
      },
    );
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
