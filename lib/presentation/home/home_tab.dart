import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/home/selector/sales_org_selector.dart';
import 'package:ezrxmobile/presentation/home/selector/shipping_address_selector.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            SalesOrgSelector(),
            CustomerCodeSelector(),
            ShipCodeSelector(),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const HomeBanner(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics:
                    const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: (1 / .6),
                children: List.generate(
                  homePageTiles.length,
                  (index) {
                    return Center(
                      child: TileCard(
                        key: const Key('HomeTileCard'),
                        homePageTile: homePageTiles[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageTile {
  const HomePageTile({
    required this.title,
    required this.icon,
    required this.routeName,
  });
  final String title;
  final IconData icon;
  final String routeName;
}

const List<HomePageTile> homePageTiles = <HomePageTile>[
  HomePageTile(
    title: 'Create Order',
    icon: Icons.list,
    routeName: 'material_list_page',
  ),
  HomePageTile(
    title: 'Saved Order',
    icon: Icons.list,
    routeName: 'saved_order_list',
  ),
  HomePageTile(
    title: 'Order Template',
    icon: Icons.list,
    routeName: 'order_template_list_page',
  ),
];

class TileCard extends StatelessWidget {
  const TileCard({Key? key, required this.homePageTile}) : super(key: key);
  final HomePageTile homePageTile;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle2;

    return GestureDetector(
      onTap: () => context.router.pushNamed(homePageTile.routeName),
      child: Card(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Icon(
                  homePageTile.icon,
                  size: 30.0,
                  color: textStyle!.color,
                ),
              ),
              Text(
                homePageTile.title,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
