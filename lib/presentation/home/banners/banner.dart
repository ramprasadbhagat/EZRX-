import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/home/banners/banner_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatelessWidget {
  HomeBanner({Key? key}) : super(key: key);
  final _controller = PageController(viewportFraction: 0.95, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannerBloc, BannerState>(
      listenWhen: (previous, current) => previous.banner != current.banner,
      listener: (context, state) {
        state.bannerFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final failureMessage = failure.map(
                other: (other) => other.message,
                serverError: (serverError) => serverError.message,
                poorConnection: (_) => 'Poor Internet connection',
                serverTimeout: (_) => 'Server time out',
              );
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
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.375,
              child: PageView.builder(
                key: const Key('homeBanner'),
                controller: _controller,
                itemCount: state.banner.length,
                allowImplicitScrolling: true,
                itemBuilder: (_, index) {
                  return BannerTile(
                    banner: state.banner[index],
                    httpService: locator<HttpService>(),
                    countlyService: locator<CountlyService>(),
                    config: locator<Config>(),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
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
          ],
        );
      },
    );
  }
}
