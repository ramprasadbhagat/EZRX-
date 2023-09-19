import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class CartBottomSheetShimmer extends StatelessWidget {
  final bool isEdit;

  const CartBottomSheetShimmer({
    Key? key,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: LoadingShimmer.tile(),
              ),
              SizedBox(
                width: 230,
                child: LoadingShimmer.tile(),
              ),
              SizedBox(
                width: 100,
                child: LoadingShimmer.tile(),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: QuantityInput(
                  isEnabled: false,
                  isLoading: true,
                  quantityAddKey: const Key('cartItemAdd'),
                  quantityDeleteKey: const Key('cartItemDelete'),
                  quantityTextKey: const Key('item'),
                  controller: TextEditingController(text: '0'),
                  onFieldChange: (val) {},
                  minusPressed: (val) {},
                  addPressed: (val) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    BalanceTextRow(
                      keyText: 'Unit Price'.tr(),
                      valueText: '',
                      valueTextLoading: true,
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                    BalanceTextRow(
                      keyText: 'Total Price'.tr(),
                      valueText: '',
                      valueTextLoading: true,
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ZPColors.lightGray,
            ),
            onPressed: null,
            child: isEdit
                ? const Text('Update Cart').tr()
                : const Text('Add to cart').tr(),
          ),
        ),
      ],
    );
  }
}
