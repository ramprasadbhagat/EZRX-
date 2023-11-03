import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// aware issue :
// https://dev.azure.com/zuelligpharmadevops/eZRx%20Overall/_wiki/wikis/eZRx-Overall.wiki/3443/eZRx-banner-workflow-doubt
class CarouselBannerTile extends StatelessWidget {
  final EZReachBanner banner;
  final int bannerPosition;

  const CarouselBannerTile({
    Key? key,
    required this.bannerPosition,
    required this.banner,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        trackMixpanelEvent(
          MixpanelEvents.bannerClick,
          props: {
            MixpanelProps.bannerId: banner.id,
            MixpanelProps.bannerTitle: banner.title,
            MixpanelProps.bannerOrder: bannerPosition,
            MixpanelProps.bannerRedirected:
                banner.url.startsWith('https') ? 'external_web' : 'internal',
          },
        );
        if (banner.isKeyword) {
          if (context.mounted) {
            locator<MixpanelService>().setBannerOrderFlow(banner);
            context.read<ProductSearchBloc>().add(
                  ProductSearchEvent.searchProduct(
                    searchKey: SearchKey.search(
                      banner.keyword,
                    ),
                  ),
                );
            await context.router.push(
              ProductSuggestionPageRoute(parentRoute: context.routeData.path),
            );
          }
        } else if (banner.urlLink.isNotEmpty) {
          if (context.mounted) {
            await context.router.push(
              WebViewPageRoute(
                url: banner.urlLink,
              ),
            );
          }
        }
      },
      child: CustomImage(
        imageUrl: banner.url,
        placeholder: LoadingShimmer.logo(),
        errorWidget: banner.url.isEmpty
            ? LoadingShimmer.logo()
            : const Icon(Icons.error),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.5,
      ),
    );
  }
}
