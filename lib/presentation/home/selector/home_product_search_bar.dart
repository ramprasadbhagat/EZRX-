import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search by product name or code'.tr(),
              prefixIcon: const Icon(
                Icons.search,
                size: 20,
              ),
              suffixIcon: IconButton(
                splashRadius: 1,
                key: WidgetKeys.productScanCameraKey,
                icon: const Icon(
                  Icons.camera_alt_outlined,
                ),
                onPressed: () => {},
              ),
              border: const OutlineInputBorder(),
            ),
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              context.router.pushNamed('product_suggestion_page');
            },
          ),
        ),
      ],
    );
  }
}
