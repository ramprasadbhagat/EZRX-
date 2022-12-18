import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_view_model.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_label.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus_tile.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_discount_label.dart';
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
                onPressed: (context) {
                  for (final material in cartItem.materials) {
                    context.read<CartBloc>().add(
                          CartEvent.removeFromCart(item: material),
                        );
                  }
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
                              for (final cartItem in cartItem.materials) {
                                context.read<CartBloc>().add(
                                      CartEvent.updateSelectedItem(
                                        item: cartItem,
                                      ),
                                    );
                              }
                            },
                            value: context
                                .read<CartBloc>()
                                .state
                                .selectedItemsMaterialNumber
                                .contains(materialCommonInfo
                                    .materialInfo.materialNumber),
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
                              children: [
                                Text(
                                  materialCommonInfo.bundle.bundleCode,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.apply(
                                        color: ZPColors.kPrimaryColor,
                                      ),
                                ),
                              ],
                            ),
                            Text(
                              materialCommonInfo.bundle.bundleName.name,
                              style: Theme.of(context).textTheme.bodyText1,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
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
                                enableVat
                                    ? Text(
                                        '${'Price before $taxCode: '.tr()}${materialCommonInfo.display(PriceType.listPrice)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
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
                                            .bodyText1
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
                                      .bodyText1
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
                      (cartItem) => ListTile(
                        contentPadding: showCheckBox ? EdgeInsets.zero : null,
                        title: Padding(
                          padding: EdgeInsets.only(left: showCheckBox ? 40 : 0),
                          child: _BundleMaterialItem(
                            cartItem: cartItem,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          BounsTile(
            cartItem: materialCommonInfo,
          ),
        ],
      ),
    );
  }
}

class _BundleMaterialItem extends StatefulWidget {
  const _BundleMaterialItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final PriceAggregate cartItem;

  @override
  State<_BundleMaterialItem> createState() => _BundleMaterialItemState();
}

class _BundleMaterialItemState extends State<_BundleMaterialItem> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller =
        TextEditingController(text: widget.cartItem.quantity.toString());
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
                    widget.cartItem.materialInfo.materialNumber.displayMatNo,
                    style: Theme.of(context).textTheme.subtitle2?.apply(
                          color: ZPColors.kPrimaryColor,
                        ),
                  ),
                  BonusDiscountLabel(
                    materialInfo: widget.cartItem.materialInfo,
                    tenderContractNumber: widget.cartItem.tenderContract
                        .contractNumber.displayTenderContractNumberInCart,
                  ),
                ],
              ),
              Text(
                widget.cartItem.materialInfo.materialDescription,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              widget.cartItem.isDefaultMDEnabled
                  ? Text(
                      widget.cartItem.materialInfo.defaultMaterialDescription,
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              Text(
                widget.cartItem.materialInfo.principalData.principalName,
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
            ],
          ),
        ),
        QuantityInput(
          isEnabled: widget.cartItem.tenderContract == TenderContract.empty(),
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
                    CartEvent.removeFromCart(item: widget.cartItem),
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
          quantityAddKey: const Key('cartAdd'),
          quantityDeleteKey: const Key('cartDelete'),
        ),
      ],
    );
  }
}
