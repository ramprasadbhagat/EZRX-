import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart' as c;
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class BannerTile extends StatelessWidget {
  final BannerItem banner;
  final HttpService httpService;
  final CountlyService countlyService;
  final c.Config config;
  const BannerTile({
    Key? key,
    required this.banner,
    required this.httpService,
    required this.countlyService,
    required this.config,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FutureBuilder(
          future: _fetchImageData(imgUrl: banner.url, config: config),
          builder: (context, image) {
            return image.data != null
                ? GestureDetector(
                    onTap: banner.urlLink.isEmpty
                        ? null
                        : () {
                            // await countlyService.addCountlyEvent('carousel_banner_clicked',
                            //   segmentation: {
                            //   'banner_id': banner.id,
                            //   'landingPage':banner.urlLink,
                            //   'selectedSalesOrg':preferenceData.getUserSalesOrg,
                            //   'selectedCustomerCode':preferenceData.getUserCustomerCode,
                            //   'selectedShipToAddress':preferenceData.getShipToCode,
                            //   'userRole':preferenceData.getUserRoleType,
                            //   },
                            // );
                            context.router.push(
                              WebViewPageRoute(url: banner.urlLink),
                            );
                          },
                    child: Image.memory(
                      (image.data as Uint8List),
                      fit: BoxFit.fitWidth,
                      gaplessPlayback: true,
                    ),
                  )
                : LoadingShimmer.withChild(
                    child: Image.asset(
                      'assets/images/ezrxlogo.png',
                      width: 80,
                      height: 80,
                    ),
                  );
          },
        ),
      ),
    );
  }

  Future<Uint8List?> _fetchImageData({
    required String imgUrl,
    required c.Config config,
  }) async {
    if (imgUrl.isEmpty) return null;

    try {
      final file = await DefaultCacheManager().getFileFromCache(imgUrl);
      if (file != null) {
        return file.file.readAsBytesSync();
      }

      if (config.appFlavor == c.Flavor.mock) {
        final imageData =
            await rootBundle.load('assets/images/data/banner_image_data');

        final imageUint8List = imageData.buffer
            .asUint8List(imageData.offsetInBytes, imageData.lengthInBytes);

        await DefaultCacheManager().putFile(imgUrl, imageUint8List);

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
        await DefaultCacheManager().putFile(imgUrl, imageData);

        return imageData;
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
