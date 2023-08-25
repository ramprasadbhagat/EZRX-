import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/icon_label.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bundle_detail_section.dart';
part 'all_material_item.dart';
part 'total_qty_section.dart';

class CheckoutBundleItem extends StatelessWidget {
  final PriceAggregate cartItem;
  const CheckoutBundleItem({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconLabel(
            icon: Icons.local_offer_outlined,
            labelText: 'Bundle offer'.tr(),
            iconSize: 24,
            labelStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontSize: 12, color: ZPColors.white),
          ),
          _BundleDetailsSection(
            cartItem: cartItem,
          ),
          _AllMaterialItem(
            cartItem: cartItem,
          ),
          _TotalQtySection(cartProduct: cartItem),
        ],
      ),
    );
  }
}
