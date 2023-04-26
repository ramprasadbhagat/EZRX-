import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/config.dart' as c;
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// aware issue :
// https://dev.azure.com/zuelligpharmadevops/eZRx%20Overall/_wiki/wikis/eZRx-Overall.wiki/3443/eZRx-banner-workflow-doubt
class BannerTile extends StatelessWidget {
  final BannerItem banner;
  final int bannerPosition;
  final HttpService httpService;

  final c.Config config;
  final DefaultCacheManager defaultCacheManager;
  const BannerTile({
    Key? key,
    required this.bannerPosition,
    required this.banner,
    required this.httpService,
    required this.config,
    required this.defaultCacheManager,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: _fetchImageData(imgUrl: banner.url, config: config),
        builder: (context, image) {
          return image.data != null
              ? GestureDetector(
                  onTap: () async {
                    trackMixpanelEvent(MixpanelEvents.bannerClick, props: {
                      MixpanelProps.bannerId: banner.id.toString(),
                      MixpanelProps.bannerTitle: banner.title,
                      MixpanelProps.bannerOrder: bannerPosition,
                      MixpanelProps.bannerRedirected:
                          banner.url.startsWith('https')
                              ? 'external_web'
                              : 'internal',
                    });
                    if (banner.isKeyword && banner.keyword != '') {
                      if (context.mounted) {
                        locator<MixpanelService>().setBannerOrderFlow(banner);
                        context.read<MaterialListBloc>().add(
                              MaterialListEvent.searchMaterialList(
                                user:
                                    context.read<EligibilityBloc>().state.user,
                                salesOrganisation: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation,
                                configs:
                                    context.read<SalesOrgBloc>().state.configs,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                shipToInfo: context
                                    .read<ShipToCodeBloc>()
                                    .state
                                    .shipToInfo,
                                selectedMaterialFilter: context
                                    .read<MaterialFilterBloc>()
                                    .state
                                    .selectedMaterialFilter,
                                pickAndPack: context
                                    .read<EligibilityBloc>()
                                    .state
                                    .getPNPValueMaterial,
                                searchKey: SearchKey(banner.keyword),
                              ),
                            );

                        await context.router.pushNamed('material_list_page');
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
                  child: Image.memory(
                    (image.data as Uint8List),
                    fit: BoxFit.fitWidth,
                    gaplessPlayback: true,
                  ),
                )
              : LoadingShimmer.logo();
        },
      ),
    );
  }

  Future<Uint8List?> _fetchImageData({
    required String imgUrl,
    required c.Config config,
  }) async {
    if (imgUrl.isEmpty) return null;

    try {
      final file = await defaultCacheManager.getFileFromCache(imgUrl);
      if (file != null) {
        return file.file.readAsBytesSync();
      }

      if (config.appFlavor == c.Flavor.mock) {
        final imageData =
            await rootBundle.load('assets/images/data/banner_image_data');

        final imageUint8List = imageData.buffer
            .asUint8List(imageData.offsetInBytes, imageData.lengthInBytes);

        await defaultCacheManager.putFile(imgUrl, imageUint8List);

        return imageUint8List;
      }

      final res = await httpService.request(
        method: 'POST',
        url: '/api/downloadAttachment',
        data: {'url': imgUrl},
        responseType: ResponseType.bytes,
      );

      if (res.statusCode == 200) {
        final imageData = res.data;
        await defaultCacheManager.putFile(imgUrl, imageData);

        return imageData;
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
