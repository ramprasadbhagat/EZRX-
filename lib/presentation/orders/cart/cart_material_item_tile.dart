import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
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
import 'package:ezrxmobile/presentation/orders/create_order/price_override_bottomsheet.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartMaterialItemTile extends StatefulWidget {
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
  State<CartMaterialItemTile> createState() => _CartMaterialItemTileState();
}

class _CartMaterialItemTileState extends State<CartMaterialItemTile> {
  final controller = TextEditingController();
  late final String taxDetails;

  @override
  void initState() {
    controller.value = TextEditingValue(
      text: widget.cartItem.quantity.toString(),
      selection: TextSelection.collapsed(
        offset: widget.cartItem.quantity.toString().length,
      ),
    );
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
    final isPriceOverride = widget.cartItem.price.isPriceOverride;
    final enableListPrice =
        context.read<SalesOrgBloc>().state.configs.enableListPrice;
    final enableVat = context.read<SalesOrgBloc>().state.configs.enableVat;

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
                      if (widget.showCheckBox)
                        Checkbox(
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
                              .contains(
                                widget.cartItem.materialInfo.materialNumber,
                              ),
                        ),
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
                                  tenderContractNumber: widget
                                      .cartItem
                                      .tenderContract
                                      .contractNumber
                                      .displayTenderContractNumberInCart,
                                ),
                              ],
                            ),
                            Text(
                              widget.cartItem.materialInfo.materialDescription,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            if (widget.cartItem.isDefaultMDEnabled)
                              Text(
                                widget.cartItem.materialInfo
                                    .defaultMaterialDescription,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.apply(
                                      color: ZPColors.lightGray,
                                    ),
                              ),
                            Text(
                              widget.cartItem.materialInfo.principalData
                                  .principalName,
                              style:
                                  Theme.of(context).textTheme.subtitle2?.apply(
                                        color: ZPColors.lightGray,
                                      ),
                            ),
                            widget.isOrderSummaryView
                                ? Text(
                                    '${'Material type : '.tr()}${widget.cartItem.toSavedOrderMaterial().type}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.apply(
                                          color: ZPColors.lightGray,
                                        ),
                                  )
                                : const SizedBox.shrink(),
                            widget.isOrderSummaryView
                                ? Text(
                                    '${'Unit of Measurement : '.tr()}${widget.cartItem.materialInfo.unitOfMeasurement}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.apply(
                                          color: ZPColors.lightGray,
                                        ),
                                  )
                                : const SizedBox.shrink(),
                            // TODO: Jyoti - what is the point just show an empty label
                            // if (!widget.cartItem.materialInfo.hidePrice &&
                            // widget.isOrderSummaryView)
                            //   Wrap(
                            //     spacing: 8.0,
                            //     runSpacing: 4.0,
                            //     children: <Widget>[
                            //       Padding(
                            //         padding: const EdgeInsets.only(
                            //           bottom: 3.0,
                            //         ),
                            //         child: Text(
                            //           'Deals : '.tr(),
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .bodyText1
                            //               ?.apply(
                            //                 color: ZPColors.lightGray,
                            //               ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            if (widget.cartItem.price.tiers.isNotEmpty)
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 4.0,
                                children: widget.cartItem.price.priceTireItem
                                    .map((e) => Container(
                                          height: 25.0,
                                          width: 130.0,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/tierpriceback.png',
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        "${"Buy ".tr()}${e.quantity} ${"or more".tr()}: ",
                                                    style: const TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: StringUtils
                                                        .displayPrice(
                                                      context
                                                          .read<SalesOrgBloc>()
                                                          .state
                                                          .configs,
                                                      e.rate,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            if (widget
                                .cartItem.salesOrgConfig.expiryDateDisplay)
                              Text(
                                '${'Expiry Date : '.tr()}${widget.cartItem.stockInfo.expiryDate.getExpiryDate}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.apply(
                                      color: ZPColors.lightGray,
                                    ),
                              ),
                            if (!widget
                                .cartItem.salesOrgConfig.hideStockDisplay)
                              Text(
                                '${'In Stock : '.tr()}${widget.cartItem.stockInfo.inStock.getOrDefaultValue('')}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.apply(
                                      color: ZPColors.lightGray,
                                    ),
                              ),
                            // Text(
                            //   '${'Quantity: '.tr()}${widget.cartItem.quantity}',
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
                                  enableVat
                                      ? Text(
                                          '${'Price before ${widget.taxCode}: '.tr()}${widget.cartItem.display(PriceType.listPrice)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.apply(
                                                color: isPriceOverride
                                                    ? ZPColors.red
                                                    : ZPColors.black,
                                                decoration: widget
                                                        .cartItem
                                                        .salesOrgConfig
                                                        .priceOverride
                                                    ? TextDecoration.underline
                                                    : TextDecoration.none,
                                              ),
                                        )
                                      : const SizedBox.shrink(),
                                  enableListPrice
                                      ? Text(
                                          '${'List Price: '.tr()}${widget.cartItem.display(PriceType.listPrice)}',
                                          key: const Key('listPrice'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.apply(
                                                color: isPriceOverride
                                                    ? ZPColors.red
                                                    : ZPColors.black,
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
                                    '${'Unit Price: '.tr()}${widget.cartItem.display(PriceType.unitPrice)}',
                                    key: const Key('unitPrice'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.apply(
                                          color: isPriceOverride
                                              ? ZPColors.red
                                              : ZPColors.black,
                                          decoration: widget.cartItem
                                                  .salesOrgConfig.priceOverride
                                              ? TextDecoration.underline
                                              : TextDecoration.none,
                                        ),
                                  ),
                                  widget.isOrderSummaryView
                                      ? Text(
                                          '${'Total Price: '.tr()}${widget.cartItem.display(PriceType.unitPriceTotal)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.apply(
                                                color: isPriceOverride
                                                    ? ZPColors.red
                                                    : ZPColors.black,
                                                decoration: widget
                                                        .cartItem
                                                        .salesOrgConfig
                                                        .priceOverride
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
                      ),
                      QuantityInput(
                        isEnabled: widget.cartItem.tenderContract ==
                            TenderContract.empty(),
                        quantityAddKey: const Key('cartAdd'),
                        quantityDeleteKey: const Key('cartDelete'),
                        quantityTextKey: const Key('cartItem'),
                        controller: controller,
                        onFieldChange: (value) {
                          locator<CountlyService>().addCountlyEvent(
                            'changed_quantity',
                            segmentation: {
                              'materialNum': widget.cartItem.getMaterialNumber
                                  .getOrCrash(),
                              'listPrice': widget.cartItem.listPrice,
                              'price':
                                  widget.cartItem.price.finalPrice.getOrCrash(),
                            },
                          );
                          context.read<CartBloc>().add(
                                CartEvent.updateCartItem(
                                  item:
                                      widget.cartItem.copyWith(quantity: value),
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
                        minusPressed: (k) {
                          if (widget.cartItem.quantity > 1) {
                            locator<CountlyService>().addCountlyEvent(
                              'deduct_quantity',
                              segmentation: {
                                'materialNum': widget.cartItem.getMaterialNumber
                                    .getOrCrash(),
                                'listPrice': widget.cartItem.listPrice,
                                'price': widget.cartItem.price.finalPrice
                                    .getOrCrash(),
                              },
                            );
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
                          locator<CountlyService>().addCountlyEvent(
                            'add_quantity',
                            segmentation: {
                              'materialNum': widget.cartItem.getMaterialNumber
                                  .getOrCrash(),
                              'listPrice': widget.cartItem.listPrice,
                              'price':
                                  widget.cartItem.price.finalPrice.getOrCrash(),
                            },
                          );
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
          if (widget.cartItem.materialInfo.remarks.isEmpty &&
              context.read<SalesOrgBloc>().state.configs.enableRemarks)
            AddRemarksButton(
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
            ),
          BounsTile(
            cartItem: widget.cartItem,
          ),
        ],
      ),
    );
  }
}
