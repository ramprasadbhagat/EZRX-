import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/cart_item_remark.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/add_remark_dialog.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/add_remark_button.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/cart_item_bonus_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/discount_override_toggle.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/update_remark_dialog.dart';
import 'package:ezrxmobile/presentation/core/tender_contract_details_tile.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_discount_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_bonus_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/price_override_bottomsheet.dart';
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
              key: Key('cartItem${material.materialInfo.materialNumber}'),
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
                  : const SizedBox.shrink(),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          material.materialInfo.materialDescription,
                          style: Theme.of(context).textTheme.titleSmall?.apply(
                                color: ZPColors.kPrimaryColor,
                              ),
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.only(right: 8),
                        constraints: const BoxConstraints(),
                        key: const Key('deleteFromCart'),
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
                        material.materialInfo.materialNumber.displayMatNo,
                        style: Theme.of(context).textTheme.titleSmall?.apply(
                              color: ZPColors.lightGray,
                            ),
                      ),
                      BonusDiscountLabel(
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
                              .isZDP8Override)
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
                      context.read<SalesOrgBloc>().state.configs.enableRemarks)
                    RemarksMessage(
                      key: Key('remarks${material.materialInfo.remarks}'),
                      message:
                          '${'Remarks: '.tr()}${material.materialInfo.remarks}',
                      showEditDeleteDialog: EditDeleteDialog(
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
              key: const Key('addRemarks'),
              onPressed: () {
                AddRemarkDialog.cartItem(
                  context: context,
                  cartItem: cartItem,
                );
              },
            ),
          if (material.notHavingContract)
            BounsTile(
              material: material,
              cartItem: cartItem,
            ),
        ],
      ),
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
    final enablePriceOverRide = context.read<EligibilityBloc>().state;
    final disablePriceOverRide = context.read<OrderEligibilityBloc>().state;

    if (disablePriceOverRide.isDisablePriceOverRide) return false;

    return enablePriceOverRide.isPriceOverrideEnable;
  }

  @override
  Widget build(BuildContext context) {
    final isPriceOverride = material.price.isPriceOverride;
    final enableListPrice =
        context.read<SalesOrgBloc>().state.configs.enableListPrice;
    final enableVat = context.read<SalesOrgBloc>().state.configs.enableVat;

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
              '${'Material type : '.tr()}${material.toSavedOrderMaterial().type.getOrDefaultValue('')}',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          if (isOrderSummaryView)
            Text(
              '${'Unit of Measurement : '.tr()}${material.materialInfo.unitOfMeasurement}',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          if (!material.materialInfo.hidePrice && isOrderSummaryView)
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
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.lightGray,
                        ),
                  ),
                ),
              ],
            ),
          if (material.price.tiers.isNotEmpty && isOrderSummaryView)
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: material.price.priceTireItem
                  .map<Widget>(
                    (e) => PriceTierLabel(priceTierItem: e),
                  )
                  .toList(),
            ),
          if (material.price.isBonusDealEligible && isOrderSummaryView)
            BonusDetails(cartItem: material),
          if (material.salesOrgConfig.expiryDateDisplay)
            Text(
              '${'Expiry Date : '.tr()}${material.stockInfo.expiryDate.naIfEmptyDateTime}',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          if (!material.salesOrgConfig.hideStockDisplay)
            Text(
              '${'In Stock : '.tr()}${material.stockInfo.inStock.getOrDefaultValue('')}',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          InkWell(
            key: const Key('priceOverride'),
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
                if (enableVat)
                  Text(
                    '${'Price before $taxCode: '.tr()}${material.display(PriceType.finalPrice)}',
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color:
                              isPriceOverride ? ZPColors.red : ZPColors.black,
                          decoration: _isPriceOverRideVisible(context)
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                  ),
                if (enableListPrice)
                  Text(
                    '${'List Price: '.tr()}${material.display(PriceType.listPrice)}',
                    key: const Key('listPrice'),
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color:
                              isPriceOverride ? ZPColors.red : ZPColors.black,
                          decoration: _isPriceOverRideVisible(context)
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                  ),
                Text(
                  '${'Unit Price: '.tr()}${material.display(PriceType.unitPrice)}',
                  key: const Key('unitPrice'),
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: isPriceOverride ? ZPColors.red : ZPColors.black,
                        decoration: _isPriceOverRideVisible(context)
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                ),
                if (isOrderSummaryView)
                  Text(
                    '${'Total Price: '.tr()}${material.display(PriceType.unitPriceTotal)}',
                    style: Theme.of(context).textTheme.titleSmall?.apply(
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
        controller.text = widget.cartItem.quantity.toString();

        return QuantityInput(
          isEnabled: !widget.cartItem.materialInfo.hasValidTenderContract &&
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
                  ),
                );
          },
          minusPressed: (k) {
            locator<CountlyService>().addCountlyEvent(
              'deduct_quantity',
              segmentation: {
                'materialNum': widget.cartItem.getMaterialNumber.getOrCrash(),
                'listPrice': widget.cartItem.listPrice,
                'price': widget.cartItem.price.finalPrice.getOrCrash(),
              },
            );
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
                  ),
                );
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
                  ),
                );
          },
          isLoading: state.isFetching,
        );
      },
    );
  }
}
