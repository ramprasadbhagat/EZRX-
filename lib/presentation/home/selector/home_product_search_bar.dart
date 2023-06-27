import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_search_entry.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeProductSearchBar extends StatelessWidget {
  const HomeProductSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: WidgetKeys.homeProductSearchBar,
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Expanded(
                child: ColoredBox(
                  color: ZPColors.primary,
                ),
              ),
              Expanded(
                child: Container(
                  color: ZPColors.white,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ProductSearchEntry(),
        ),
      ],
    );
  }
}
