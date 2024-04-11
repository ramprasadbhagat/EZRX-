import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/govt_list_price_component.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/list_price_strike_through_component.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/stock_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/bottom_section.dart';
part 'widgets/pre_order_scroll_section.dart';
part 'widgets/image_section.dart';
part 'widgets/material_details.dart';
part 'widgets/manufacturer_name.dart';
part 'widgets/pre_order_product_tile.dart';

const headerTitle = 'OOS-Preorder items in cart';
const headerSubTitle =
    'These item will only be delivered when stock is available.';

class PreOrderModal extends StatelessWidget {
  const PreOrderModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.preOrderModel,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          title: Text(
            context.tr(headerTitle),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ZPColors.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InfoLabel(
            textValue: context.tr(headerSubTitle),
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            mainColor: ZPColors.lightBorderYellow,
            textStyle: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) =>
              previous.allMaterial.preOrderItems !=
              current.allMaterial.preOrderItems,
          builder: (context, state) {
            return _PreOrderScrollSection(state: state);
          },
        ),
        _BottomSection(),
      ],
    );
  }
}
