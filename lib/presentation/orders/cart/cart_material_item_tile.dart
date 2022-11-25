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
import 'package:ezrxmobile/presentation/orders/cart/bonus_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/edit_delete_dialog.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_discount_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_override_bottomsheet.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartMaterialItemTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final controller =
        TextEditingController(text: cartItem.quantity.toString());

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
              key: Key(
                'cartItem${cartItem.materialInfo.materialNumber}',
              ),
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
                      showCheckBox
                          ? BlocBuilder<CartBloc, CartState>(
                              buildWhen: ((previous, current) =>
                                  previous.selectedItemsMaterialNumber.length !=
                                  current.selectedItemsMaterialNumber.length),
                              builder: (context, state) {
                                return Checkbox(
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
                                );
                              },
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
                                  cartItem
                                      .materialInfo.materialNumber.displayMatNo,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.apply(
                                        color: ZPColors.kPrimaryColor,
                                      ),
                                ),
                                BonusDiscountLabel(
                                  materialInfo: cartItem.materialInfo,
                                ),
                              ],
                            ),
                            Text(
                              cartItem.materialInfo.materialDescription,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            cartItem.isDefaultMDEnabled
                                ? Text(
                                    cartItem.materialInfo
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
                              cartItem.materialInfo.principalData.principalName,
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
                                      item: cartItem,
                                      onTap: (double newPrice) {
                                        if (cartItem
                                            .salesOrgConfig.priceOverride) {
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
                                  !cartItem.salesOrgConfig.hideStockDisplay
                                      ? Text(
                                          '${'In Stock: '.tr()}${cartItem.stockInfo.inStock.getOrCrash()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.apply(
                                                color: ZPColors.lightGray,
                                              ),
                                        )
                                      : const SizedBox.shrink(),
                                  cartItem.salesOrgConfig.expiryDateDisplay
                                      ? Text(
                                          '${'Expiry date: '.tr()}${cartItem.stockInfo.expiryDate}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.apply(
                                                color: ZPColors.lightGray,
                                              ),
                                        )
                                      : const SizedBox.shrink(),
                                  cartItem.isEnableVat
                                      ? Text(
                                          '${'Price before $taxCode: '.tr()}${cartItem.display(PriceType.unitPriceBeforeGst)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.apply(
                                                color: cartItem.isOverride
                                                    ? ZPColors.red
                                                    : ZPColors.lightGray,
                                                decoration: cartItem
                                                        .salesOrgConfig
                                                        .priceOverride
                                                    ? TextDecoration.underline
                                                    : TextDecoration.none,
                                              ),
                                        )
                                      : const SizedBox.shrink(),
                                  Text(
                                    '${'List Price: '.tr()}${cartItem.display(PriceType.listPrice)}',
                                    key: const Key('listPrice'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.apply(
                                          color: cartItem.isOverride
                                              ? ZPColors.red
                                              : ZPColors.lightGray,
                                          decoration: cartItem
                                                  .salesOrgConfig.priceOverride
                                              ? TextDecoration.underline
                                              : TextDecoration.none,
                                        ),
                                  ),
                                  //.state.salesOrganisation.p
                                  Text(
                                    '${'Unit Price: '.tr()}${cartItem.display(PriceType.unitPrice)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.apply(
                                          color: cartItem.isOverride
                                              ? ZPColors.red
                                              : ZPColors.black,
                                          decoration: cartItem
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
                      Column(
                        children: [
                          QuantityInput(
                            quantityAddKey: const Key('cartAdd'),
                            quantityDeleteKey: const Key('cartDelete'),
                            quantityTextKey: const Key('cartItem'),
                            controller: controller,
                            onFieldChange: (value) {
                              context.read<CartBloc>().add(
                                    CartEvent.updateCartItem(
                                      item: cartItem.copyWith(quantity: value),
                                    ),
                                  );
                            },
                            minusPressed: (k) {
                              if (cartItem.quantity > 1) {
                                context.read<CartBloc>().add(
                                      CartEvent.addToCart(
                                        item: cartItem.copyWith(quantity: -1),
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
                                      CartEvent.removeFromCart(item: cartItem),
                                    );
                              }
                            },
                            addPressed: (k) {
                              context.read<CartBloc>().add(
                                    CartEvent.addToCart(
                                      item: cartItem.copyWith(quantity: 1),
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
                          cartItem.materialInfo.remarks.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: InkWell(
                                    key: const Key('addRemarks'),
                                    onTap: () {
                                      AddRemarkDialog.show(
                                        context: context,
                                        cartItem: cartItem,
                                        isEdit: false,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5.0,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: ZPColors.kPrimaryColor,
                                          ),
                                          Flexible(
                                            child: const Text(
                                              'Add Remarks',
                                              style: TextStyle(
                                                color: ZPColors.kPrimaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ).tr(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),

                      // isThreeLine: true,
                      // trailing: IconButton(
                      //   onPressed: () {
                      //     context
                      //         .read<CartBloc>()
                      //         .add(CartEvent.removeFromCart(item: cartItem));
                      //   },
                      //   icon: const Icon(Icons.delete),
                      // ),
                    ],
                  ),
                  if (cartItem.materialInfo.remarks.isNotEmpty)
                    RemarksMessage(
                      message:
                          '${'Remarks: '.tr()}${cartItem.materialInfo.remarks}',
                      showEditDeleteDialog: EditDeleteDialog(
                        cartItem: cartItem,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              BounsTile(
                cartItem: cartItem,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
