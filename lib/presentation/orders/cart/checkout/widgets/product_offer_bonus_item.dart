import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

part 'product_offer_bonus_widgets/bonus_product_details_section.dart';
part 'product_offer_bonus_widgets/bonus_product_image_section.dart';
part 'product_offer_bonus_widgets/bonus_product_quantity_and_price.dart';
part 'product_offer_bonus_widgets/bonus_product_details.dart';

class CheckoutOfferBonusItem extends StatelessWidget {
  final MaterialItemBonus bonusItem;
  const CheckoutOfferBonusItem({
    Key? key,
    required this.bonusItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showBorder: true,
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          _ProductDetailsSection(
            bonusItem: bonusItem,
          ),
          _QuantityAndPrice(bonusItem: bonusItem),
        ],
      ),
    );
  }
}
