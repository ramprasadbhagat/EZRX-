import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreMarketPlaceBanner extends StatelessWidget {
  const ExploreMarketPlaceBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 27),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ZPColors.marketplaceBg,
      ),
      child: Column(
        children: [
          Text(
            context.tr('What\'s new!'),
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: ZPColors.primary),
          ),
          const SizedBox(height: 8),
          SvgPicture.asset(
            SvgImage.marketplaceOutlinedButton,
            height: 28,
            width: 64,
          ),
          const SizedBox(height: 8),
          Text(
            context.tr('Check out the new eZRx+ Marketplace!'),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ZPColors.darkerGrey,
                ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              //TODO: Will cover in EZRX-17284
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                context.tr('Explore Marketplace'),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
