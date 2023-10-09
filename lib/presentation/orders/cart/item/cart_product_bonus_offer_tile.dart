import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_product_bonus_offer_widgets/bonus_material_details.dart';
part 'cart_product_bonus_offer_widgets/bonus_item_sub_total_section.dart';
part 'cart_product_bonus_offer_widgets/bonus_material_details_section.dart';
part 'cart_product_bonus_offer_widgets/bonus_material_image_section.dart';
part 'cart_product_bonus_offer_widgets/bonus_material_quantity_section.dart';

class CartProductOfferBonus extends StatelessWidget {
  final PriceAggregate cartProduct;
  final MaterialItemBonus bonusItem;

  const CartProductOfferBonus({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.cartItemBonus(
        cartProduct.materialInfo.materialNumber.displayMatNo,
        bonusItem.materialNumber.displayMatNo,
      ),
      margin: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          _MaterialDetailsSection(
            bonusItem: bonusItem,
          ),
          const _ItemSubTotalSection(),
        ],
      ),
    );
  }
}
