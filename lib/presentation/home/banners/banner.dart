import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/home/banners/banner_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart' hide Config;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final _controller = PageController(viewportFraction: 0.95, keepPage: true);
  Timer? bannerTimer;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannerBloc, BannerState>(
      listenWhen: (previous, current) => previous.banner != current.banner,
      listener: (context, state) {
        state.bannerFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final failureMessage = failure.failureMessage;
              showSnackBar(context: context, message: failureMessage.tr());
              if (failureMessage == 'authentication failed') {
                context.read<AuthBloc>().add(const AuthEvent.logout());
              }
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

        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.375,
              child: PageView.builder(
                key: const Key('homeBanner'),
                controller: _controller,
                allowImplicitScrolling: true,
                itemBuilder: (_, index) {
                  return BannerTile(
                    banner: state.banner[index % state.banner.length],
                    httpService: locator<HttpService>(),
                    countlyService: locator<CountlyService>(),
                    config: locator<Config>(),
                    defaultCacheManager: DefaultCacheManager(),
                  );
                },
              ),
            ),
            state.banner.isNotEmpty
                ? SmoothPageIndicator(
                    controller: _controller,
                    onDotClicked: (index) => _controller.jumpToPage(index),
                    count: state.banner.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: MediaQuery.of(context).size.width * 0.02,
                      dotWidth: MediaQuery.of(context).size.width * 0.02,
                      dotColor: ZPColors.secondary,
                      activeDotColor: ZPColors.primary,
                      // strokeWidth: 0.5,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    bannerTimer?.cancel();
  }

  void startBannerScrollTimer() {
    _controller.jumpToPage(0);
    bannerTimer = Timer.periodic(
      const Duration(seconds: 8),
      (timer) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
    );
  }
}
