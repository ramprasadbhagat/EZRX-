import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/remarks_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_remark_dialog.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_remarks_button.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/edit_delete_dialog.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_discount_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_override_bottomsheet.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartMaterialItemTile extends StatefulWidget {
  final PriceAggregate cartItem;
  final String taxCode;
  final bool showCheckBox;

  const CartMaterialItemTile({
    Key? key,
    required this.cartItem,
    this.taxCode = 'VAT',
    this.showCheckBox = false,
  }) : super(key: key);

  @override
  State<CartMaterialItemTile> createState() => _CartMaterialItemTileState();
}

class _CartMaterialItemTileState extends State<CartMaterialItemTile> {
  late final TextEditingController controller;
  late final String? taxDetails;

  @override
  void initState() {
    controller =
        TextEditingController(text: widget.cartItem.quantity.toString());
    taxDetails = widget.cartItem.taxDetails;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                    .add(CartEvent.removeFromCart(item: widget.cartItem)),
              ),
            ],
            borderRadius: 8,
            child: ListTile(
              contentPadding: widget.showCheckBox ? EdgeInsets.zero : null,
              key: Key(
                'cartItem${widget.cartItem.materialInfo.materialNumber}',
              ),
              onTap: () {
                CartBottomSheet.showUpdateCartBottomSheet(
                  context: context,
                  cartItem: widget.cartItem,
                );
              },
              title: Column(
                children: [
                  Row(
                    children: [
                      widget.showCheckBox
                          ? Checkbox(
                              onChanged: ((v) => {
                                    context
                                        .read<CartBloc>()
                                        .add(CartEvent.updateSelectedItem(
                                          item: widget.cartItem,
                                        )),
                                  }),
                              value: context
                                  .read<CartBloc>()
                                  .state
                                  .selectedItemsMaterialNumber
                                  .contains(widget
                                      .cartItem.materialInfo.materialNumber),
                            )
                          : const SizedBox.shrink(),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.cartItem.materialInfo.materialNumber
                                      .displayMatNo,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.apply(
                                        color: ZPColors.kPrimaryColor,
                                      ),
                                ),
                                BonusDiscountLabel(
                                  materialInfo: widget.cartItem.materialInfo,
                                ),
                              ],
                            ),
                            taxDetails != null
                                ? Text(
                                    taxDetails!,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                : const SizedBox.shrink(),
                            Text(
                              widget.cartItem.materialInfo.materialDescription,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            widget.cartItem.isDefaultMDEnabled
                                ? Text(
                                    widget.cartItem.materialInfo
                                        .defaultMaterialDescription,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.apply(
                                          color: ZPColors.lightGray,
                                        ),
                                  )
                                : const SizedBox.shrink(),
                            Text(
                              widget.cartItem.materialInfo.principalData
                                  .principalName,
                              style:
                                  Theme.of(context).textTheme.subtitle2?.apply(
                                        color: ZPColors.lightGray,
                                      ),
                            ),
                            GestureDetector(
                              key: const Key('priceOverride'),
                              onTap: () async {
                                await showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return PriceSheet(
                                      item: widget.cartItem,
                                      onTap: (double newPrice) {
                                        if (widget.cartItem.salesOrgConfig
                                            .priceOverride) {
                                          context.read<PriceOverrideBloc>().add(
                                                PriceOverrideEvent.fetch(
                                                  item: widget.cartItem,
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
                                  widget.cartItem.isEnableVat
                                      ? Text(
                                          '${'Price before ${widget.taxCode}: '.tr()}${widget.cartItem.display(PriceType.unitPriceBeforeGst)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.apply(
                                                color:
                                                    widget.cartItem.isOverride
                                                        ? ZPColors.red
                                                        : ZPColors.lightGray,
                                                decoration: widget
                                                        .cartItem
                                                        .salesOrgConfig
                                                        .priceOverride
                                                    ? TextDecoration.underline
                                                    : TextDecoration.none,
                                              ),
                                        )
                                      : const SizedBox.shrink(),
                                  Text(
                                    '${'List Price: '.tr()}${widget.cartItem.display(PriceType.listPrice)}',
                                    key: const Key('listPrice'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.apply(
                                          color: widget.cartItem.isOverride
                                              ? ZPColors.red
                                              : ZPColors.lightGray,
                                          decoration: widget.cartItem
                                                  .salesOrgConfig.priceOverride
                                              ? TextDecoration.underline
                                              : TextDecoration.none,
                                        ),
                                  ),
                                  //.state.salesOrganisation.p
                                  Text(
                                    '${'Unit Price: '.tr()}${widget.cartItem.display(PriceType.unitPrice)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.apply(
                                          color: widget.cartItem.isOverride
                                              ? ZPColors.red
                                              : ZPColors.black,
                                          decoration: widget.cartItem
                                                  .salesOrgConfig.priceOverride
                                              ? TextDecoration.underline
                                              : TextDecoration.none,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      QuantityInput(
                        quantityAddKey: const Key('cartAdd'),
                        quantityDeleteKey: const Key('cartDelete'),
                        quantityTextKey: const Key('cartItem'),
                        controller: controller,
                        onFieldChange: (value) {
                          context.read<CartBloc>().add(
                                CartEvent.updateCartItem(
                                  item:
                                      widget.cartItem.copyWith(quantity: value),
                                ),
                              );
                        },
                        minusPressed: (k) {
                          if (widget.cartItem.quantity > 1) {
                            context.read<CartBloc>().add(
                                  CartEvent.addToCart(
                                    item:
                                        widget.cartItem.copyWith(quantity: -1),
                                    customerCodeInfo: context
                                        .read<CustomerCodeBloc>()
                                        .state
                                        .customerCodeInfo,
                                    doNotallowOutOfStockMaterial: context
                                        .read<EligibilityBloc>()
                                        .state
                                        .doNotAllowOutOfStockMaterials,
                                    salesOrganisation: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .salesOrganisation,
                                    salesOrganisationConfigs: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .configs,
                                    shipToInfo: context
                                        .read<ShipToCodeBloc>()
                                        .state
                                        .shipToInfo,
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
                          context.read<CartBloc>().add(
                                CartEvent.addToCart(
                                  item: widget.cartItem.copyWith(quantity: 1),
                                  customerCodeInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .customerCodeInfo,
                                  doNotallowOutOfStockMaterial: context
                                      .read<EligibilityBloc>()
                                      .state
                                      .doNotAllowOutOfStockMaterials,
                                  salesOrganisation: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrganisation,
                                  salesOrganisationConfigs: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .configs,
                                  shipToInfo: context
                                      .read<ShipToCodeBloc>()
                                      .state
                                      .shipToInfo,
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                  if (widget.cartItem.materialInfo.remarks.isNotEmpty &&
                      context.read<SalesOrgBloc>().state.configs.enableRemarks)
                    RemarksMessage(
                      message:
                          '${'Remarks: '.tr()}${widget.cartItem.materialInfo.remarks}',
                      showEditDeleteDialog: EditDeleteDialog(
                        cartItem: widget.cartItem,
                        bonusItem: widget.cartItem.materialInfo,
                        isBonus: false,
                      ),
                    ),
                ],
              ),
            ),
          ),
          widget.cartItem.materialInfo.remarks.isEmpty &&
                  context.read<SalesOrgBloc>().state.configs.enableRemarks
              ? AddRemarksButton(
                  key: const Key('addRemarks'),
                  onPressed: () {
                    AddRemarkDialog.show(
                      context: context,
                      cartItem: widget.cartItem,
                      isEdit: false,
                      bonusItem: widget.cartItem.materialInfo,
                      isBonus: false,
                    );
                  },
                )
              : const SizedBox.shrink(),
          BounsTile(
            cartItem: widget.cartItem,
          ),
        ],
      ),
    );
  }
}
