import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/remarks_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_remark_dialog.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_remarks_button.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/edit_delete_dialog.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_discount_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_lable.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_override_bottomsheet.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_tier_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartMaterialItemTile extends StatelessWidget {
  final PriceAggregate cartItem;
  final String taxCode;
  final bool showCheckBox;
  final bool isOrderSummaryView;

  const CartMaterialItemTile({
    Key? key,
    required this.cartItem,
    this.taxCode = 'VAT',
    this.showCheckBox = false,
    this.isOrderSummaryView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CustomSlidable(
            endActionPaneActions: [
              CustomSlidableAction(
                label: 'Delete',
                icon: Icons.delete_outline,
                onPressed: (context) => context
                    .read<CartBloc>()
                    .add(CartEvent.removeFromCart(item: cartItem)),
              ),
            ],
            borderRadius: 8,
            child: ListTile(
              contentPadding: showCheckBox ? EdgeInsets.zero : null,
              key: Key('cartItem${cartItem.materialInfo.materialNumber}'),
              onTap: () {
                CartBottomSheet.showUpdateCartBottomSheet(
                  context: context,
                  cartItem: cartItem,
                );
              },
              title: Column(
                children: [
                  Row(
                    children: [
                      if (showCheckBox)
                        Checkbox(
                          onChanged: ((v) => {
                                context
                                    .read<CartBloc>()
                                    .add(CartEvent.updateSelectedItem(
                                      item: cartItem,
                                    )),
                              }),
                          value: context
                              .read<CartBloc>()
                              .state
                              .selectedItemsMaterialNumber
                              .contains(
                                cartItem.materialInfo.materialNumber,
                              ),
                        ),
                      CartMaterialItemTileDetails(
                        cartItem: cartItem,
                        taxCode: taxCode,
                        isOrderSummaryView: isOrderSummaryView,
                      ),
                      _CartItemQuantityInput(cartItem: cartItem),
                    ],
                  ),
                  if (cartItem.materialInfo.remarks.isNotEmpty &&
                      context.read<SalesOrgBloc>().state.configs.enableRemarks)
                    RemarksMessage(
                      message:
                          '${'Remarks: '.tr()}${cartItem.materialInfo.remarks}',
                      showEditDeleteDialog: EditDeleteDialog(
                        cartItem: cartItem,
                        bonusItem: cartItem.materialInfo,
                        isBonus: false,
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (cartItem.materialInfo.remarks.isEmpty &&
              context.read<SalesOrgBloc>().state.configs.enableRemarks)
            AddRemarksButton(
              key: const Key('addRemarks'),
              onPressed: () {
                AddRemarkDialog.show(
                  context: context,
                  cartItem: cartItem,
                  isEdit: false,
                  bonusItem: cartItem.materialInfo,
                  isBonus: false,
                );
              },
            ),
          BounsTile(cartItem: cartItem),
        ],
      ),
    );
  }
}

class CartMaterialItemTileDetails extends StatelessWidget {
  final PriceAggregate cartItem;
  final String taxCode;
  final bool isOrderSummaryView;

  const CartMaterialItemTileDetails({
    Key? key,
    required this.cartItem,
    required this.taxCode,
    required this.isOrderSummaryView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPriceOverride = cartItem.price.isPriceOverride;
    final enableListPrice =
        context.read<SalesOrgBloc>().state.configs.enableListPrice;
    final enableVat = context.read<SalesOrgBloc>().state.configs.enableVat;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cartItem.materialInfo.materialNumber.displayMatNo,
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.kPrimaryColor,
                    ),
              ),
              BonusDiscountLabel(
                materialInfo: cartItem.materialInfo,
                tenderContractNumber: cartItem.tenderContract.contractNumber
                    .displayTenderContractNumberInCart,
              ),
            ],
          ),
          Text(
            cartItem.materialInfo.materialDescription,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          if (cartItem.isDefaultMDEnabled)
            Text(
              cartItem.materialInfo.defaultMaterialDescription,
              style: Theme.of(context).textTheme.subtitle2?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          Text(
            cartItem.materialInfo.principalData.principalName,
            style: Theme.of(context).textTheme.subtitle2?.apply(
                  color: ZPColors.lightGray,
                ),
          ),
          isOrderSummaryView
              ? Text(
                  '${'Material type : '.tr()}${cartItem.toSavedOrderMaterial().type}',
                  style: Theme.of(context).textTheme.bodyText1?.apply(
                        color: ZPColors.lightGray,
                      ),
                )
              : const SizedBox.shrink(),
          isOrderSummaryView
              ? Text(
                  '${'Unit of Measurement : '.tr()}${cartItem.materialInfo.unitOfMeasurement}',
                  style: Theme.of(context).textTheme.bodyText1?.apply(
                        color: ZPColors.lightGray,
                      ),
                )
              : const SizedBox.shrink(),
          if (!cartItem.materialInfo.hidePrice && isOrderSummaryView)
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 3.0,
                  ),
                  child: Text(
                    'Deals : '.tr(),
                    style: Theme.of(context).textTheme.bodyText1?.apply(
                          color: ZPColors.lightGray,
                        ),
                  ),
                ),
              ],
            ),
          if (cartItem.price.tiers.isNotEmpty && isOrderSummaryView)
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: cartItem.price.priceTireItem
                  .map<Widget>(
                    (e) => PriceTierLabel(priceTierItem: e),
                  )
                  .toList(),
            ),
          if (cartItem.price.isBonusDealEligible && isOrderSummaryView)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: cartItem.price.priceBonusItem
                      .map<Widget>(
                        (e) => BonusLabel(bonus: e),
                      )
                      .toList(),
                ),
              ],
            ),
          if (cartItem.salesOrgConfig.expiryDateDisplay)
            Text(
              '${'Expiry Date : '.tr()}${cartItem.stockInfo.expiryDate.getExpiryDate}',
              style: Theme.of(context).textTheme.bodyText1?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          if (!cartItem.salesOrgConfig.hideStockDisplay)
            Text(
              '${'In Stock : '.tr()}${cartItem.stockInfo.inStock.getOrDefaultValue('')}',
              style: Theme.of(context).textTheme.bodyText1?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          // Text(
          //   '${'Quantity: '.tr()}${cartItem.quantity}',
          //   style:
          //       Theme.of(context).textTheme.bodyText1?.apply(
          //             color: ZPColors.lightGray,
          //           ),
          // ),

          InkWell(
            key: const Key('priceOverride'),
            onTap: () async {
              await showModalBottomSheet<void>(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return PriceSheet(
                    item: cartItem,
                    onTap: (double newPrice) {
                      if (cartItem.salesOrgConfig.priceOverride) {
                        context.read<PriceOverrideBloc>().add(
                              PriceOverrideEvent.fetch(
                                item: cartItem,
                                newPrice: newPrice.toString(),
                                salesOrganisation: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                              ),
                            );
                      }
                    },
                  );
                },
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                enableVat
                    ? Text(
                        '${'Price before $taxCode: '.tr()}${cartItem.display(PriceType.listPrice)}',
                        style: Theme.of(context).textTheme.bodyText1?.apply(
                              color: isPriceOverride
                                  ? ZPColors.red
                                  : ZPColors.black,
                              decoration: cartItem.salesOrgConfig.priceOverride
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            ),
                      )
                    : const SizedBox.shrink(),
                enableListPrice
                    ? Text(
                        '${'List Price: '.tr()}${cartItem.display(PriceType.listPrice)}',
                        key: const Key('listPrice'),
                        style: Theme.of(context).textTheme.bodyText1?.apply(
                              color: isPriceOverride
                                  ? ZPColors.red
                                  : ZPColors.black,
                              decoration: cartItem.salesOrgConfig.priceOverride
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            ),
                      )
                    : const SizedBox.shrink(),
                Text(
                  '${'Unit Price: '.tr()}${cartItem.display(PriceType.unitPrice)}',
                  key: const Key('unitPrice'),
                  style: Theme.of(context).textTheme.bodyText1?.apply(
                        color: isPriceOverride ? ZPColors.red : ZPColors.black,
                        decoration: cartItem.salesOrgConfig.priceOverride
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                ),
                isOrderSummaryView
                    ? Text(
                        '${'Total Price: '.tr()}${cartItem.display(PriceType.unitPriceTotal)}',
                        style: Theme.of(context).textTheme.bodyText1?.apply(
                              color: isPriceOverride
                                  ? ZPColors.red
                                  : ZPColors.black,
                              decoration: cartItem.salesOrgConfig.priceOverride
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItemQuantityInput extends StatefulWidget {
  final PriceAggregate cartItem;

  const _CartItemQuantityInput({Key? key, required this.cartItem})
      : super(key: key);

  @override
  State<_CartItemQuantityInput> createState() => _CartItemQuantityInputState();
}

class _CartItemQuantityInputState extends State<_CartItemQuantityInput> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.value = TextEditingValue(
      text: widget.cartItem.quantity.toString(),
      selection: TextSelection.collapsed(
        offset: widget.cartItem.quantity.toString().length,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return QuantityInput(
      isEnabled: widget.cartItem.tenderContract == TenderContract.empty(),
      quantityAddKey: const Key('cartAdd'),
      quantityDeleteKey: const Key('cartDelete'),
      quantityTextKey: const Key('cartItem'),
      controller: controller,
      onFieldChange: (value) {
        locator<CountlyService>().addCountlyEvent(
          'changed_quantity',
          segmentation: {
            'materialNum': widget.cartItem.getMaterialNumber.getOrCrash(),
            'listPrice': widget.cartItem.listPrice,
            'price': widget.cartItem.price.finalPrice.getOrCrash(),
          },
        );
        context.read<CartBloc>().add(
              CartEvent.updateCartItem(
                item: widget.cartItem.copyWith(quantity: value),
                customerCodeInfo:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
                doNotallowOutOfStockMaterial: context
                    .read<EligibilityBloc>()
                    .state
                    .doNotAllowOutOfStockMaterials,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                salesOrganisationConfigs:
                    context.read<SalesOrgBloc>().state.configs,
                shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
              ),
            );
      },
      minusPressed: (k) {
        if (widget.cartItem.quantity > 1) {
          locator<CountlyService>().addCountlyEvent(
            'deduct_quantity',
            segmentation: {
              'materialNum': widget.cartItem.getMaterialNumber.getOrCrash(),
              'listPrice': widget.cartItem.listPrice,
              'price': widget.cartItem.price.finalPrice.getOrCrash(),
            },
          );
          context.read<CartBloc>().add(
                CartEvent.addToCart(
                  item: widget.cartItem.copyWith(quantity: -1),
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  doNotallowOutOfStockMaterial: context
                      .read<EligibilityBloc>()
                      .state
                      .doNotAllowOutOfStockMaterials,
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  salesOrganisationConfigs:
                      context.read<SalesOrgBloc>().state.configs,
                  shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
                ),
              );
        } else {
          context.read<CartBloc>().add(
                CartEvent.removeFromCart(
                  item: widget.cartItem,
                ),
              );
        }
      },
      addPressed: (k) {
        locator<CountlyService>().addCountlyEvent(
          'add_quantity',
          segmentation: {
            'materialNum': widget.cartItem.getMaterialNumber.getOrCrash(),
            'listPrice': widget.cartItem.listPrice,
            'price': widget.cartItem.price.finalPrice.getOrCrash(),
          },
        );
        context.read<CartBloc>().add(
              CartEvent.addToCart(
                item: widget.cartItem.copyWith(quantity: 1),
                customerCodeInfo:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
                doNotallowOutOfStockMaterial: context
                    .read<EligibilityBloc>()
                    .state
                    .doNotAllowOutOfStockMaterials,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                salesOrganisationConfigs:
                    context.read<SalesOrgBloc>().state.configs,
                shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
              ),
            );
      },
    );
  }
}
