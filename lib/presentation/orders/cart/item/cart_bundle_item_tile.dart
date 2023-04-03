import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_label.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_delete_item_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBundleItemTile extends StatelessWidget {
  final CartItem cartItem;
  final String taxCode;
  final bool showCheckBox;

  const CartBundleItemTile({
    Key? key,
    required this.cartItem,
    this.taxCode = 'VAT',
    this.showCheckBox = false,
  }) : super(key: key);

  PriceAggregate get materialCommonInfo => cartItem.materials.first;

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs = context.read<SalesOrgBloc>().state.configs;
    final enableListPrice = salesOrgConfigs.enableListPrice;
    final enableMaterialLevelTax = salesOrgConfigs.enableMaterialLevelTax;

    return Card(
      key: Key('bundleCartItem${materialCommonInfo.bundle.bundleCode}'),
      child: Column(
        children: [
          CustomSlidable(
            endActionPaneActions: [
              CustomSlidableAction(
                label: 'Delete',
                icon: Icons.delete_outline,
                onPressed: (context) {
                  context.read<CartBloc>().add(
                        CartEvent.removeFromCart(item: cartItem),
                      );
                },
              ),
            ],
            borderRadius: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    showCheckBox
                        ? Checkbox(
                            onChanged: (v) {
                              context.read<CartBloc>().add(
                                    CartEvent.selectButtonTapped(
                                      cartItem: cartItem,
                                    ),
                                  );
                            },
                            value: cartItem.isSelected,
                          )
                        : const SizedBox.shrink(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: showCheckBox ? 0 : 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    materialCommonInfo.bundle.bundleName.name,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                CartDeleteItemButton(item: cartItem),
                              ],
                            ),
                            Text(
                              materialCommonInfo.bundle.bundleCode,
                              style:
                                  Theme.of(context).textTheme.titleSmall?.apply(
                                        color: ZPColors.kPrimaryColor,
                                      ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              child: CustomLabel(
                                textValue: 'Deals%',
                              ),
                            ),
                            ...materialCommonInfo.bundle.bundleInfoMessage
                                .map(
                                  (e) => Text(
                                    e,
                                    // key: const ValueKey(e),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.apply(
                                          color: ZPColors.lightGray,
                                        ),
                                  ),
                                )
                                .toList(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                enableMaterialLevelTax
                                    ? Text(
                                        '${'Price before $taxCode: '.tr()}${materialCommonInfo.display(PriceType.finalPrice)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.apply(
                                              color: materialCommonInfo
                                                      .price.isPriceOverride
                                                  ? ZPColors.red
                                                  : ZPColors.lightGray,
                                              decoration: materialCommonInfo
                                                      .salesOrgConfig
                                                      .priceOverride
                                                  ? TextDecoration.underline
                                                  : TextDecoration.none,
                                            ),
                                      )
                                    : const SizedBox.shrink(),
                                enableListPrice
                                    ? Text(
                                        '${'List Price: '.tr()}${StringUtils.displayPrice(materialCommonInfo.salesOrgConfig, cartItem.listPrice)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.apply(
                                              color: ZPColors.black,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      )
                                    : const SizedBox.shrink(),
                                Text(
                                  '${'Unit Price: '.tr()}${StringUtils.displayPrice(materialCommonInfo.salesOrgConfig, cartItem.unitPrice)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.apply(
                                        color: ZPColors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                                Text(
                                  '${cartItem.subTotalPrice.isNegative ? 'Total Discount: '.tr() : 'Total Amount: '.tr()}${StringUtils.displayPrice(materialCommonInfo.salesOrgConfig, cartItem.subTotalPrice)}',
                                  key: const Key('cartBundleItemTotal'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.apply(
                                        color: ZPColors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  color: ZPColors.darkGray,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                ),
                ...cartItem.materials
                    .map(
                      (material) => ListTile(
                        contentPadding: showCheckBox ? EdgeInsets.zero : null,
                        title: Padding(
                          padding: EdgeInsets.only(left: showCheckBox ? 40 : 0),
                          child: _BundleMaterialItem(
                            cartItem: cartItem,
                            material: material,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BundleMaterialItem extends StatefulWidget {
  const _BundleMaterialItem({
    Key? key,
    required this.material,
    required this.cartItem,
  }) : super(key: key);

  final PriceAggregate material;
  final CartItem cartItem;

  @override
  State<_BundleMaterialItem> createState() => _BundleMaterialItemState();
}

class _BundleMaterialItemState extends State<_BundleMaterialItem> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller =
        TextEditingController(text: widget.material.quantity.toString());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.material.materialInfo.materialNumber.displayMatNo,
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.kPrimaryColor,
                        ),
                  ),
                ],
              ),
              Text(
                widget.material.materialInfo.materialDescription,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              widget.material.isDefaultMDEnabled
                  ? Text(
                      widget.material.materialInfo.defaultMaterialDescription,
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              Text(
                widget.material.materialInfo.principalData.principalName
                    .getOrDefaultValue(''),
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
              Text(
                '${'Expiry Date : '.tr()}${widget.material.stockInfo.expiryDate.toValidDateString}',
                key: ValueKey(
                  'expiryDate${widget.material.getMaterialNumber.getOrDefaultValue('')}',
                ),
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
            ],
          ),
        ),
        BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return QuantityInput(
              isEnabled:
                  widget.material.tenderContract == TenderContract.empty() &&
                      !state.isFetching,
              quantityTextKey: Key('cartItem${widget.material.getMaterialNumber.getOrDefaultValue('')}'),
              controller: controller,
              onFieldChange: (value) {
                locator<CountlyService>().addCountlyEvent(
                  'changed_quantity',
                  segmentation: {
                    'materialNum':
                        widget.material.getMaterialNumber.getOrCrash(),
                    'listPrice': widget.cartItem.listPrice,
                    'price': widget.material.price.finalPrice.getOrCrash(),
                  },
                );
                context.read<CartBloc>().add(
                      CartEvent.updateMaterialQtyInCartItem(
                        currentItem: widget.cartItem,
                        updatedQtyItem:
                            widget.material.copyWith(quantity: value),
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
                        salesOrganisationConfigs:
                            context.read<SalesOrgBloc>().state.configs,
                        shipToInfo:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                      ),
                    );
              },
              minusPressed: (k) {
                locator<CountlyService>().addCountlyEvent(
                  'deduct_quantity',
                  segmentation: {
                    'materialNum':
                        widget.material.getMaterialNumber.getOrCrash(),
                    'listPrice': widget.cartItem.listPrice,
                    'price': widget.material.price.finalPrice.getOrCrash(),
                  },
                );
                context.read<CartBloc>().add(
                      CartEvent.updateMaterialQtyInCartItem(
                        currentItem: widget.cartItem,
                        updatedQtyItem: widget.material.copyWith(quantity: k),
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
                        salesOrganisationConfigs:
                            context.read<SalesOrgBloc>().state.configs,
                        shipToInfo:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                      ),
                    );
              },
              addPressed: (k) {
                locator<CountlyService>().addCountlyEvent(
                  'add_quantity',
                  segmentation: {
                    'materialNum':
                        widget.material.getMaterialNumber.getOrCrash(),
                    'listPrice': widget.cartItem.listPrice,
                    'price': widget.material.price.finalPrice.getOrCrash(),
                  },
                );
                context.read<CartBloc>().add(
                      CartEvent.updateMaterialQtyInCartItem(
                        currentItem: widget.cartItem,
                        updatedQtyItem: widget.material.copyWith(quantity: k),
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
                        salesOrganisationConfigs:
                            context.read<SalesOrgBloc>().state.configs,
                        shipToInfo:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                      ),
                    );
              },
              quantityAddKey: Key('cartAdd${widget.material.getMaterialNumber.getOrCrash()}'),
              quantityDeleteKey: Key('cartDelete${widget.material.getMaterialNumber.getOrCrash()}'),
              minimumQty: 0,
              isLoading: state.isFetching,
            );
          },
        ),
      ],
    );
  }
}
