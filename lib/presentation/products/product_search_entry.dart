import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

class ProductSearchEntry extends StatelessWidget {
  const ProductSearchEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        context.router.pushNamed('product_suggestion_page');
      },
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
      ),
    );
  }
}
