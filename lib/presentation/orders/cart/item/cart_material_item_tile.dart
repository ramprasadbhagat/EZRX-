import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/cart_item_bonus_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/batch_number.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/price_override_bottomsheet.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/cart_item_remark.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/add_remark_dialog.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/add_remark_button.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/discount_override_toggle.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/update_remark_dialog.dart';
import 'package:ezrxmobile/presentation/core/tender_contract_details_tile.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_discount_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_bonus_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_tier_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartMaterialItemTile extends StatelessWidget {
  final CartItem cartItem;

  final String taxCode;
  final bool showCheckBox;
  final bool isOrderSummaryView;

  PriceAggregate get material => cartItem.materials.first;

  const CartMaterialItemTile({
    Key? key,
    required this.cartItem,
    this.taxCode = 'VAT',
    this.showCheckBox = false,
    this.isOrderSummaryView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tenderContractNumber = material.tenderContract.contractNumber;

    return BlocBuilder<OrderDocumentTypeBloc, OrderDocumentTypeState>(
      buildWhen: (previous, current) =>
          previous.selectedOrderType != current.selectedOrderType,
      builder: (context, state) {
        final isSpecialOrderType =
            context.read<OrderDocumentTypeBloc>().state.isSpecialOrderType;

        return Card(
          child: Column(
            children: [
              CustomSlidable(
                endActionPaneActions: [
                  CustomSlidableAction(
                    label: 'Delete',
                    icon: Icons.delete_outline,
                    onPressed: (context) => context.read<CartBloc>().add(
                          CartEvent.removeFromCart(item: cartItem),
                        ),
                  ),
                ],
                borderRadius: 8,
                child: ListTile(
                  contentPadding: showCheckBox ? EdgeInsets.zero : null,
                  key: Key(
                    'materialCartItem${material.materialInfo.materialNumber.getOrDefaultValue('')}',
                  ),
                  onTap: () {
                    CartBottomSheet.showUpdateCartBottomSheet(
                      context: context,
                      cartItem: material,
                    );
                  },
                  leading: showCheckBox
                      ? Checkbox(
                          onChanged: (value) {
                            if (value == null) return;
                            context.read<CartBloc>().add(
                                  CartEvent.selectButtonTapped(
                                    cartItem: cartItem,
                                  ),
                                );
                          },
                          value: cartItem.isSelected,
                        )
                      : null,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              material.materialInfo.materialDescription,
                              style:
                                  Theme.of(context).textTheme.titleSmall?.apply(
                                        color: ZPColors.kPrimaryColor,
                                      ),
                            ),
                          ),
                          IconButton(
                            padding: const EdgeInsets.only(right: 8),
                            constraints: const BoxConstraints(),
                            key: Key(
                              'deleteFromCart${material.materialInfo.materialNumber.getOrDefaultValue('')}',),
                            onPressed: () {
                              context.read<CartBloc>().add(
                                    CartEvent.removeFromCart(
                                      item: cartItem,
                                    ),
                                  );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            material.materialInfo.materialNumber.displayMatNo.tr(),
                            style:
                                Theme.of(context).textTheme.titleSmall?.apply(
                                      color: ZPColors.lightGray,
                                    ),
                          ),
                          isSpecialOrderType
                              ? const SizedBox.shrink()
                              : BonusDiscountLabel(
                                  price: material.price,
                                  materialInfo: material.materialInfo,
                                  tenderContractNumber: tenderContractNumber
                                      .displayTenderContractNumberInCart,
                                ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CartMaterialItemTileDetails(
                            material: material,
                            taxCode: taxCode,
                            isOrderSummaryView: isOrderSummaryView,
                            cartItem: cartItem,
                          ),
                          Column(
                            children: [
                              _CartItemQuantityInput(cartItem: material),
                              if (context
                                      .read<EligibilityBloc>()
                                      .state
                                      .isZDP8Override &&
                                  !isSpecialOrderType)
                                BlocProvider(
                                  create: (context) =>
                                      locator<DiscountOverrideBloc>()
                                        ..add(
                                          DiscountOverrideEvent.update(
                                            price: material.price,
                                            showErrorMessages: false,
                                          ),
                                        ),
                                  child: DiscountOverrideToggle(
                                    cartItem: material,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      if (isOrderSummaryView &&
                          material.tenderContract != TenderContract.empty())
                        TenderContractDetailsTile(
                          tenderContract: material.tenderContract,
                        ),
                      if (material.materialInfo.remarks.isNotEmpty &&
                          context
                              .read<SalesOrgBloc>()
                              .state
                              .configs
                              .enableRemarks)
                        RemarksMessage(
                          key: Key('remarks${material.materialInfo.remarks}'),
                          message:
                              '${'Remarks: '.tr()}${material.materialInfo.remarks}',
                          showEditDeleteDialog: EditDeleteDialog(
                            key: Key('editDeleteDialog${material.materialInfo.materialNumber.getOrDefaultValue('')}'),
                            onDelete: () {
                              context.read<CartBloc>().add(
                                    CartEvent.addRemarkToCartItem(
                                      item: cartItem,
                                      message: '',
                                    ),
                                  );
                            },
                            onEdit: () {
                              AddRemarkDialog.cartItem(
                                context: context,
                                cartItem: cartItem,
                                isEdit: true,
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (material.materialInfo.remarks.isEmpty &&
                  context.read<SalesOrgBloc>().state.configs.enableRemarks)
                AddRemarksButton(
                  key: Key(
                    'addRemarks${material.materialInfo.materialNumber.getOrDefaultValue('')}',),
                  onPressed: () {
                    AddRemarkDialog.cartItem(
                      context: context,
                      cartItem: cartItem,
                    );
                  },
                ),
              if (material.notHavingContract && !isSpecialOrderType)
                BounsTile(
                  material: material,
                  cartItem: cartItem,
                ),
            ],
          ),
        );
      },
    );
  }
}

class CartMaterialItemTileDetails extends StatelessWidget {
  final PriceAggregate material;
  final CartItem cartItem;
  final String taxCode;
  final bool isOrderSummaryView;

  const CartMaterialItemTileDetails({
    Key? key,
    required this.material,
    required this.taxCode,
    required this.isOrderSummaryView,
    required this.cartItem,
  }) : super(key: key);

  bool _isPriceOverRideVisible(BuildContext context) {
    if (context.read<EligibilityBloc>().state.isOrderTypeEligible &&
        context.read<OrderDocumentTypeBloc>().state.isSpecialOrderType) {
      return false;
    }

    return context.read<EligibilityBloc>().state.isPriceOverrideEnable;
  }

  @override
  Widget build(BuildContext context) {
    final isPriceOverride = material.price.isPriceOverride;
    final salesOrgConfigs = context.read<SalesOrgBloc>().state.configs;
    final enableListPrice = salesOrgConfigs.enableListPrice;
    final enableMaterialLevelTax = salesOrgConfigs.enableMaterialLevelTax;
    final isSpecialOrderType =
        context.read<OrderDocumentTypeBloc>().state.isSpecialOrderType;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (material.isDefaultMDEnabled)
            Text(
              material.materialInfo.defaultMaterialDescription,
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          Text(
            material.materialInfo.principalData.principalName
                .getOrDefaultValue(''),
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: ZPColors.lightGray,
                ),
          ),
          if (isOrderSummaryView)
            Text(
              '${'Material type'.tr()} : ${material.toSavedOrderMaterial().type.getOrDefaultValue('')}',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          _GenericMaterialNameDisplayWidget(
            material: material,
          ),
          if (isOrderSummaryView)
            Text(
              '${'Unit of Measurement'.tr()} : ${material.materialInfo.unitOfMeasurement}',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          if (!material.materialInfo.hidePrice &&
              isOrderSummaryView &&
              !isSpecialOrderType)
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 3.0,
                  ),
                  child: Text(
                    'Deals :'.tr(),
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.lightGray,
                        ),
                  ),
                ),
              ],
            ),
          if (material.price.tiers.isNotEmpty &&
              isOrderSummaryView &&
              !isSpecialOrderType)
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: material.price.priceTireItem
                  .map<Widget>(
                    (e) => PriceTierLabel(priceTierItem: e),
                  )
                  .toList(),
            ),
          if (material.price.isBonusDealEligible &&
              isOrderSummaryView &&
              !isSpecialOrderType)
            BonusDetails(cartItem: material),
          if (material.salesOrgConfig.expiryDateDisplay)
            Text(
              '${'Expiry Date :'.tr()}${material.stockInfo.expiryDate.toValidDateString}',
              key: Key(
                'expiryDate${material.materialInfo.materialNumber.getOrDefaultValue('')}',
              ),
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          if (!material.salesOrgConfig.hideStockDisplay)
            Text(
              '${'In Stock : '.tr()}${material.stockInfo.inStock.getOrDefaultValue('')}',
              key: Key(
                'Stock${material.materialInfo.materialNumber.getOrDefaultValue('')}${material.stockInfo.inStock.getOrDefaultValue('')}',
              ),
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          BatchNumberLabel(
            key: ValueKey(
              'batchNumber_${cartItem.materials.first.materialNumberString}',
            ),
            cartItem: cartItem,
            isOrderSummaryView: isOrderSummaryView,
          ),
          !material.isSpecialOrderTypeNotTH
              ? InkWell(
                  key: Key(
                    'priceOverride${material.materialInfo.materialNumber.getOrDefaultValue('')}',
                  ),
                  onTap: () async {
                    if (_isPriceOverRideVisible(context)) {
                      final cartBloc = context.read<CartBloc>();
                      final result = await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return PriceSheet(
                            key: const Key('priceSheet'),
                            item: material,
                          );
                        },
                      );
                      if (result is List<Price>) {
                        cartBloc.add(
                          CartEvent.overrideCartItemPrice(
                            overridenPrice: result,
                            cartItem: cartItem,
                          ),
                        );
                      }
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (enableMaterialLevelTax)
                        Text(
                          '${'Price before $taxCode: '.tr()}${material.display(PriceType.finalPrice).tr()}',
                          key: Key(
                            'pricebefore${material.getMaterialNumber.getOrDefaultValue('')}',
                          ),
                          style: Theme.of(context).textTheme.titleSmall?.apply(
                                color: isPriceOverride
                                    ? ZPColors.red
                                    : ZPColors.black,
                                decoration: _isPriceOverRideVisible(context)
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                        ),
                      if (enableListPrice)
                        Text(
                          '${'List Price:'.tr()} ${material.display(PriceType.listPrice).tr()}',
                          key: const Key('listPrice'),
                          style: Theme.of(context).textTheme.titleSmall?.apply(
                                color: isPriceOverride
                                    ? ZPColors.red
                                    : ZPColors.black,
                                decoration: _isPriceOverRideVisible(context)
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                        ),
                      Text(
                        '${'Unit Price:'.tr()} ${material.display(PriceType.unitPrice).tr()}',
                        key: const Key('unitPrice'),
                        style: Theme.of(context).textTheme.titleSmall?.apply(
                              color: isPriceOverride
                                  ? ZPColors.red
                                  : ZPColors.black,
                              decoration: _isPriceOverRideVisible(context)
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            ),
                      ),
                      if (isOrderSummaryView)
                        Text(
                          '${'Total Price'.tr()}: ${material.display(PriceType.unitPriceTotal).tr()}',
                          style: Theme.of(context).textTheme.titleSmall?.apply(
                                color: isPriceOverride
                                    ? ZPColors.red
                                    : ZPColors.black,
                                decoration: _isPriceOverRideVisible(context)
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                              ),
                        ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
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
    final isSpecialOrderType =
        context.read<OrderDocumentTypeBloc>().state.isSpecialOrderType;

    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        controller.text = widget.cartItem.quantity.toString();

        return QuantityInput(
          isEnabled: !widget.cartItem.materialInfo.hasValidTenderContract &&
              !state.isFetching,
          quantityAddKey: Key(
            'cartAdd${widget.cartItem.getMaterialNumber.getOrDefaultValue('')}',
          ),
          quantityDeleteKey: Key(
            'cartDelete${widget.cartItem.getMaterialNumber.getOrDefaultValue('')}',
          ),
          quantityTextKey: Key(
            'cartItem${widget.cartItem.getMaterialNumber.getOrDefaultValue('')}',
          ),
          controller: controller,
          onFieldChange: (value) {
            context.read<CartBloc>().add(
                  CartEvent.addMaterialToCart(
                    item: widget.cartItem.copyWith(quantity: value),
                    overrideQty: true,
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
                    isSpecialOrderType: isSpecialOrderType,
                  ),
                );
          },
          minusPressed: (k) {
            context.read<CartBloc>().add(
                  CartEvent.addMaterialToCart(
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
                    isSpecialOrderType: isSpecialOrderType,
                  ),
                );
          },
          addPressed: (k) {
            context.read<CartBloc>().add(
                  CartEvent.addMaterialToCart(
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
                    isSpecialOrderType: isSpecialOrderType,
                  ),
                );
          },
          isLoading: state.isFetching,
        );
      },
    );
  }
}

class _GenericMaterialNameDisplayWidget extends StatelessWidget {
  final PriceAggregate material;

  const _GenericMaterialNameDisplayWidget({Key? key, required this.material})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return material.displayGenericMaterialName
        ? Text(
            '${'Generic Material Name :'.tr()}${material.materialInfo.genericMaterialName}',
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: ZPColors.lightGray,
                ),
          )
        : const SizedBox.shrink();
  }
}
