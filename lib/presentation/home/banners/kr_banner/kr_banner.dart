import 'package:ezrxmobile/presentation/home/banners/kr_banner/kr_banner_tile.dart';
import 'package:flutter/material.dart';

class KRBanners extends StatelessWidget {
  const KRBanners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const KRBannerTile(
      image: 'assets/images/kr_ad_4.png',
      fullWidth: true,
    );
  }
}
