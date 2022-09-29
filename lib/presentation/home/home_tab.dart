import 'package:auto_route/auto_route.dart';

import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeBanner(),
            TextButton(
              onPressed: () {
                context.router.pushNamed('saved_order_list');
              },
              child: const Text('saved order'),
            ),
          ],
        ),
      ),
    );
  }
}
