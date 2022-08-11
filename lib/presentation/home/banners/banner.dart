import 'package:ezrxmobile/presentation/home/banners/banner_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatelessWidget {
  HomeBanner({Key? key}) : super(key: key);
  final controller = PageController(viewportFraction: 0.95, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (_, index) {
              return const BannerTile();
            }
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          onDotClicked: (index) {
            controller.jumpToPage(index);
          },
          count: 4,
          effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: ZPColors.secondary,
              activeDotColor: ZPColors.primary
              // strokeWidth: 0.5,
              ),
        )
      ],
    );
  }
}
