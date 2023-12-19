import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_search_entry.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeProductSearchBar extends StatelessWidget {
  final bool isCustomerBlocked;
  const HomeProductSearchBar({Key? key, required this.isCustomerBlocked})
      : super(key: key);

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
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: isCustomerBlocked
                            ? ZPColors.priceWarning
                            : ZPColors.white,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
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
