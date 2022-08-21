import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeBanner()),
    );
  }
}
