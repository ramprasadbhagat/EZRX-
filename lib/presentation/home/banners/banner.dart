import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/locator.dart';
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
    return BlocBuilder<BannerBloc, BannerState>(
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
