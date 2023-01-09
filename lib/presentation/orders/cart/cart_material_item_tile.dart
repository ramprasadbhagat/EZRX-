import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
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
import 'package:ezrxmobile/presentation/orders/cart/discount_override_toggle.dart';
import 'package:ezrxmobile/presentation/orders/cart/edit_delete_dialog.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_discount_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_bonus_detail_widget.dart';
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
                      Column(
                        children: [
                          _CartItemQuantityInput(cartItem: cartItem),
                          if (context
                              .read<EligibilityBloc>()
                              .state
                              .isZDP8Override)
                            BlocProvider(
                              create: (context) =>
                                  locator<DiscountOverrideBloc>()
                                    ..add(
                                      DiscountOverrideEvent.update(
                                        price: cartItem.price,
                                        showErrorMessages: false,
                                      ),
                                    ),
                              child: DiscountOverrideToggle(
                                cartItem: cartItem,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  if (isOrderSummaryView &&
                      cartItem.tenderContract != TenderContract.empty())
                    _TenderContractDetails(cartItem: cartItem),
                  if (cartItem.materialInfo.remarks.isNotEmpty &&
                      context.read<SalesOrgBloc>().state.configs.enableRemarks)
                    RemarksMessage(
                      key: Key('remarks${cartItem.materialInfo.remarks}'),
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

  bool _isPriceOverRideVisible(BuildContext context) {
    final enablePriceOverRide = context.read<EligibilityBloc>().state;
    final disablePriceOverRide = context.read<OrderEligibilityBloc>().state;

    return enablePriceOverRide.isPriceOverrideEnable ||
        !disablePriceOverRide.isDisablePriceOverRide;
  }

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
          if (isOrderSummaryView)
            Text(
              '${'Material type : '.tr()}${cartItem.toSavedOrderMaterial().type}',
              style: Theme.of(context).textTheme.bodyText1?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          if (isOrderSummaryView)
            Text(
              '${'Unit of Measurement : '.tr()}${cartItem.materialInfo.unitOfMeasurement}',
              style: Theme.of(context).textTheme.bodyText1?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
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
            BonusDetails(cartItem: cartItem),
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
          InkWell(
            key: const Key('priceOverride'),
            onTap: () async {
              if (_isPriceOverRideVisible(context)) {
                await showModalBottomSheet<void>(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return PriceSheet(
                      key: const Key('priceSheet'),
                      item: cartItem,
                      onTap: (double newPrice) {
                        if (cartItem.salesOrgConfig.priceOverride) {
                          context.read<PriceOverrideBloc>().add(
                                PriceOverrideEvent.fetch(
                                  item: cartItem,
                                  newPrice: newPrice,
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
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (enableVat)
                  Text(
                    '${'Price before $taxCode: '.tr()}${cartItem.display(PriceType.finalPrice)}',
                    style: Theme.of(context).textTheme.bodyText1?.apply(
                          color:
                              isPriceOverride ? ZPColors.red : ZPColors.black,
                          decoration: _isPriceOverRideVisible(context)
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                  ),
                if (enableListPrice)
                  Text(
                    '${'List Price: '.tr()}${cartItem.display(PriceType.listPrice)}',
                    key: const Key('listPrice'),
                    style: Theme.of(context).textTheme.bodyText1?.apply(
                          color:
                              isPriceOverride ? ZPColors.red : ZPColors.black,
                          decoration: _isPriceOverRideVisible(context)
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                  ),
                Text(
                  '${'Unit Price: '.tr()}${cartItem.display(PriceType.unitPrice)}',
                  key: const Key('unitPrice'),
                  style: Theme.of(context).textTheme.bodyText1?.apply(
                        color: isPriceOverride ? ZPColors.red : ZPColors.black,
                        decoration: _isPriceOverRideVisible(context)
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                ),
                if (isOrderSummaryView)
                  Text(
                    '${'Total Price: '.tr()}${cartItem.display(PriceType.unitPriceTotal)}',
                    style: Theme.of(context).textTheme.bodyText1?.apply(
                          color:
                              isPriceOverride ? ZPColors.red : ZPColors.black,
                          decoration: _isPriceOverRideVisible(context)
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TenderContractDetails extends StatelessWidget {
  final PriceAggregate cartItem;

  const _TenderContractDetails({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 20,
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contract:  ${cartItem.tenderContract.contractNumber.displayTenderContractNumber}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.black,
                    ),
              ),
              !cartItem.tenderContract.tenderOrderReason.isEmpty
                  ? Text(
                      '${cartItem.tenderContract.tenderOrderReason.displayTenderContractReason} : Tender with Contract',
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              Text(
                'Tender Price: ${cartItem.tenderContract.tenderPrice.tenderPriceByPricingUnit(cartItem.tenderContract.pricingUnit)}',
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Contact Reference',
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
            ),
            Expanded(
              child: Text(
                cartItem
                    .tenderContract.contractReference.displayContractReference,
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.black,
                    ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Package Description',
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
            ),
            Expanded(
              child: Text(
                cartItem.tenderContract.tenderPackageDescription
                    .displayTenderPackageDescription,
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.black,
                    ),
              ),
            ),
          ],
        ),
      ],
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
        offset: controller.selection.base.offset,
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
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return QuantityInput(
          isEnabled: widget.cartItem.tenderContract == TenderContract.empty() &&
              !state.isFetching,
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
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      doNotallowOutOfStockMaterial: context
                          .read<EligibilityBloc>()
                          .state
                          .doNotAllowOutOfStockMaterials,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      salesOrganisationConfigs:
                          context.read<SalesOrgBloc>().state.configs,
                      shipToInfo:
                          context.read<ShipToCodeBloc>().state.shipToInfo,
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
          isLoading: state.isFetching,
        );
      },
    );
  }
}
