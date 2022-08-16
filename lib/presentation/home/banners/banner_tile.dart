import 'dart:typed_data';

import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerTile extends StatelessWidget {
  final BannerItem banner;
  final BannerRemoteDataSource remoteDataSource;
  const BannerTile({Key? key, required this.banner, required this.remoteDataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FutureBuilder(
            future: remoteDataSource.downloadImage({'url': banner.url},),
            builder: (context, image) {
              if (image.data != null &&
                  image.data != 'empty url' &&
                  image.data != 'error') {
                // User myUser = authStateProvider.getUser(preferenceData);
                // if (myUser.firstName != null) {
                //   addCountlyEvent(
                //     "banner_impression",
                //     segmentation: {
                //       "banner_id": bannerList[index]["id"],
                //       "landingPage": bannerList[index]["urlLink"],
                //       "selectedSalesOrg": preferenceData.getUserSalesOrg,
                //       "selectedCustomerCode":
                //           preferenceData.getUserCustomerCode,
                //       "selectedShipToAddress": preferenceData.getShipToCode,
                //       "userRole": preferenceData.getUserRoleType,
                //       "username": "${myUser.firstName + " " + myUser.lastName}",
                //     },
                //   );
                // }
                return GestureDetector(
                  onTap: () async {
                    // if (await canLaunch(bannerList[index]['urlLink'])) {
                    //   try {
                    //     await launch(bannerList[index]['urlLink']);
                    //   } on PlatformException catch (_) {
                    //     await launch(bannerList[index]['urlLink']);
                    //   } finally {
                    //     await launch(bannerList[index]['urlLink']);
                    //   }
                    // } else if (bannerList[index]['urlLink'].isNotEmpty) {
                    //   ToastMessage().cantAddItemdebounceMsg(
                    //       'Could not launch ${bannerList[index]["urlLink"]}');
                    // }
                    // addCountlyEvent(
                    //   'carousel_banner_clicked',
                    //   segmentation: {
                    //     'banner_id': bannerList[index]['id'],
                    //     'landingPage': bannerList[index]['urlLink'],
                    //     'selectedSalesOrg': preferenceData.getUserSalesOrg,
                    //     'selectedCustomerCode':
                    //         preferenceData.getUserCustomerCode,
                    //     'selectedShipToAddress': preferenceData.getShipToCode,
                    //     'userRole': preferenceData.getUserRoleType,
                    //   },
                    // );
                  },
                  child: Image.memory(
                    (image.data! as Uint8List),
                    repeat: ImageRepeat.noRepeat,
                    fit: BoxFit.fitWidth,
                    gaplessPlayback: true
                  ),
                );
              } else if (image.data == 'empty url' || image.data == 'error') {
                return Center(
                  child: Image.asset(
                    'assets/images/ezrxlogo.png',
                    width: 80,
                    height: 80,
                  ),
                );
              } else {
                return Center(
                  child: Shimmer.fromColors(
                    baseColor: ZPColors.primary,
                    highlightColor: ZPColors.secondary,
                    child: Image.asset(
                      'assets/images/ezrxlogo.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
