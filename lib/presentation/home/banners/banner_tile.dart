import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

// aware issue :
// https://dev.azure.com/zuelligpharmadevops/eZRx%20Overall/_wiki/wikis/eZRx-Overall.wiki/3443/eZRx-banner-workflow-doubt
class BannerTile extends StatelessWidget {
  final BannerItem banner;
  final int bannerPosition;

  const BannerTile({
    Key? key,
    required this.bannerPosition,
    required this.banner,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        trackMixpanelEvent(MixpanelEvents.bannerClick, props: {
          MixpanelProps.bannerId: banner.id.toString(),
          MixpanelProps.bannerTitle: banner.title,
          MixpanelProps.bannerOrder: bannerPosition,
          MixpanelProps.bannerRedirected:
              banner.url.startsWith('https') ? 'external_web' : 'internal',
        });
        if (banner.isKeyword && banner.keyword != '') {
          if (context.mounted) {
            locator<MixpanelService>().setBannerOrderFlow(banner);

            await context.router.pushNamed('material_root');
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
      child: CachedNetworkImage(
        imageUrl: banner.url,
        placeholder: (context, url) => LoadingShimmer.logo(),
        errorWidget: (context, url, error) => banner.url.isEmpty
            ? LoadingShimmer.logo()
            : const Icon(Icons.error),
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
