import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_bonus_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_tier_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemDetailWidget extends StatefulWidget {
  const CartItemDetailWidget({
    Key? key,
    required this.cartItem,
    required this.onQuantityChanged,
  }) : super(key: key);

  final PriceAggregate cartItem;
  final Function(int) onQuantityChanged;

  @override
  State<CartItemDetailWidget> createState() => _CartItemDetailWidgetState();
}

class _CartItemDetailWidgetState extends State<CartItemDetailWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    final addToCartBloc = context.read<AddToCartBloc>();

    _controller.text = addToCartBloc.state.cartItem.quantity.toString();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;
    final enableVat = context.read<SalesOrgBloc>().state.configs.enableVat;

    return Column(
      children: [
        Text(
          widget.cartItem.materialInfo.materialDescription,
          style: Theme.of(context).textTheme.titleLarge?.apply(
                color: ZPColors.black,
              ),
        ),
        Text(
          widget.cartItem.materialInfo.principalData.principalName
              .getOrDefaultValue(''),
          style: Theme.of(context).textTheme.titleMedium?.apply(
                color: ZPColors.lightGray,
              ),
        ),
        Text(
          widget.cartItem.materialInfo.materialNumber.displayMatNo,
          style: Theme.of(context).textTheme.titleMedium?.apply(
                color: ZPColors.darkGray,
              ),
        ),
        BonusDetails(
          cartItem: widget.cartItem,
        ),
        if (widget.cartItem.price.isDiscountEligible)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'Tiered Pricing'.tr()} :',
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              ...widget.cartItem.price.tiers.first.items
                  .map((e) => PriceTierLabel(priceTierItem: e))
                  .toList(),
            ],
          ),

        Padding(
          padding: const EdgeInsets.all(15),
          child: QuantityInput(
            isEnabled: true,
            quantityAddKey: const Key('cartItemAdd'),
            quantityDeleteKey: const Key('cartItemDelete'),
            quantityTextKey: const Key('item'),
            controller: _controller,
            onFieldChange: (val) {
              locator<CountlyService>()
                  .addCountlyEvent('changed_quantity', segmentation: {
                'materialNum': widget.cartItem.getMaterialNumber.getOrCrash(),
                'listPrice': widget.cartItem.listPrice,
                'price': widget.cartItem.price.finalPrice.getOrCrash(),
              });
              widget.onQuantityChanged.call(val);
            },
            minusPressed: (val) {
              locator<CountlyService>()
                  .addCountlyEvent('deduct_quantity', segmentation: {
                'materialNum': widget.cartItem.getMaterialNumber.getOrCrash(),
                'listPrice': widget.cartItem.listPrice,
                'price': widget.cartItem.price.finalPrice.getOrCrash(),
              });
              widget.onQuantityChanged.call(val);
            },
            addPressed: (val) {
              locator<CountlyService>()
                  .addCountlyEvent('add_quantity', segmentation: {
                'materialNum': widget.cartItem.getMaterialNumber.getOrCrash(),
                'listPrice': widget.cartItem.listPrice,
                'price': widget.cartItem.price.finalPrice.getOrCrash(),
              });
              widget.onQuantityChanged.call(val);
            },
          ),
        ),
        BlocBuilder<TenderContractBloc, TenderContractState>(
          buildWhen: (previous, current) =>
              previous.selectedTenderContract != current.selectedTenderContract,
          builder: (context, state) {
            final cartItem = state.selectedTenderContract ==
                        TenderContract.empty() ||
                    state.selectedTenderContract == TenderContract.noContract()
                ? widget.cartItem
                : widget.cartItem.copyWith(
                    tenderContract: state.selectedTenderContract,
                    price: widget.cartItem.price.copyWith(
                      finalPrice: MaterialPrice(
                        state.selectedTenderContract.tenderPrice
                            .tenderPriceByPricingUnit(
                          state.selectedTenderContract.pricingUnit,
                        ),
                      ),
                    ),
                  );

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  enableVat
                      ? BalanceTextRow(
                        keyText: 'Unit price before $taxCode'.tr(),
                        valueText: cartItem.display(PriceType.finalPrice),
                        keyFlex: 1,
                        valueFlex: 1,
                      )
                      : const SizedBox.shrink(),
                  BalanceTextRow(
                    keyText: 'Unit Price'.tr(),
                    valueText: cartItem.display(PriceType.unitPrice),
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                  enableVat
                      ? BalanceTextRow(
                        keyText: 'Total price before $taxCode'.tr(),
                        valueText: cartItem.display(PriceType.finalPriceTotal),
                        keyFlex: 1,
                        valueFlex: 1,
                      )
                      : const SizedBox.shrink(),
                  BalanceTextRow(
                    keyText: 'Total Price'.tr(),
                    valueText: cartItem.display(PriceType.unitPriceTotal),
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
