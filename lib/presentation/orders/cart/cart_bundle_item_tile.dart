import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/presentation/core/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_label.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_discount_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_override_bottomsheet.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBundleItemTile extends StatelessWidget {
  final List<PriceAggregate> materialItems;
  final String taxCode;
  final bool showCheckBox;

  const CartBundleItemTile({
    Key? key,
    required this.materialItems,
    this.taxCode = 'VAT',
    this.showCheckBox = false,
  }) : super(key: key);

  Bundle get bundleInfo => materialItems.first.bundle;
  PriceAggregate get materialCommonInfo => materialItems.first;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CustomSlidable(
        endActionPaneActions: [
          CustomSlidableAction(
            label: 'Delete',
            icon: Icons.delete_outline,
            onPressed: (context) {
              for (final material in materialItems) {
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
                    ? BlocBuilder<CartBloc, CartState>(
                        buildWhen: ((previous, current) =>
                            previous.selectedItemsMaterialNumber.length !=
                            current.selectedItemsMaterialNumber.length),
                        builder: (context, state) {
                          return Checkbox(
                            onChanged: (v) {
                              for (final cartItem in materialItems) {
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
                          );
                        },
                      )
                    : const SizedBox.shrink(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              bundleInfo.bundleCode,
                              style:
                                  Theme.of(context).textTheme.subtitle2?.apply(
                                        color: ZPColors.kPrimaryColor,
                                      ),
                            ),
                          ],
                        ),
                        Text(
                          bundleInfo.bundleName.name,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          child: CustomLabel(
                            textValue: 'Deals%',
                          ),
                        ),
                        ...bundleInfo
                            .bundleInfoMessage()
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
                        GestureDetector(
                          key: const Key('priceOverride'),
                          onTap: () async {
                            await showModalBottomSheet<void>(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return PriceSheet(
                                  item: materialCommonInfo,
                                  onTap: (double newPrice) {
                                    if (materialCommonInfo
                                        .salesOrgConfig.priceOverride) {
                                      for (final material in materialItems) {
                                        context.read<PriceOverrideBloc>().add(
                                              PriceOverrideEvent.fetch(
                                                item: material,
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
                              materialCommonInfo.isEnableVat
                                  ? Text(
                                      '${'Price before $taxCode: '.tr()}${materialCommonInfo.display(PriceType.unitPriceBeforeGst)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.apply(
                                            color: materialCommonInfo.isOverride
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
                              Text(
                                '${'List Price: '.tr()}${materialCommonInfo.display(PriceType.listPrice)}',
                                key: const Key('listPrice'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.apply(
                                      color: materialCommonInfo.isOverride
                                          ? ZPColors.red
                                          : ZPColors.lightGray,
                                      decoration: materialItems.first
                                              .salesOrgConfig.priceOverride
                                          ? TextDecoration.underline
                                          : TextDecoration.none,
                                    ),
                              ),
                              //.state.salesOrganisation.p
                              Text(
                                '${'Unit Price: '.tr()}${materialCommonInfo.display(PriceType.unitPrice)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.apply(
                                      color: materialCommonInfo.isOverride
                                          ? ZPColors.red
                                          : ZPColors.black,
                                      decoration: materialCommonInfo
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
                ),
              ],
            ),
            Container(
              height: 2,
              color: ZPColors.darkGray,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
            ),
            ...materialItems
                .map(
                  (cartItem) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ListTile(
                      contentPadding: showCheckBox ? EdgeInsets.zero : null,
                      onTap: () {
                        CartBottomSheet.showUpdateCartBottomSheet(
                          context: context,
                          cartItem: cartItem,
                        );
                      },
                      trailing: SizedBox(
                        width: 50,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              cartItem.quantity.toString().padLeft(2, '0'),
                              key: Key(
                                'itemCount${cartItem.materialInfo.materialNumber}',
                              ),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (cartItem.quantity > 1) {
                                      context.read<CartBloc>().add(
                                            CartEvent.addToCart(
                                              item: cartItem.copyWith(
                                                quantity: -1,
                                              ),
                                              customerCodeInfo: context
                                                  .read<CustomerCodeBloc>()
                                                  .state
                                                  .customerCodeInfo,
                                              salesOrganisationConfigs: context
                                                  .read<SalesOrgBloc>()
                                                  .state
                                                  .configs,
                                              shipToInfo: context
                                                  .read<ShipToCodeBloc>()
                                                  .state
                                                  .shipToInfo,
                                              doNotallowOutOfStockMaterial: context
                                                  .read<EligibilityBloc>()
                                                  .state
                                                  .doNotAllowOutOfStockMaterials,
                                              salesOrganisation: context
                                                  .read<SalesOrgBloc>()
                                                  .state
                                                  .salesOrganisation,
                                            ),
                                          );
                                    } else {
                                      context.read<CartBloc>().add(
                                            CartEvent.removeFromCart(
                                              item: cartItem,
                                            ),
                                          );
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      color: ZPColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: ZPColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<CartBloc>().add(
                                          CartEvent.addToCart(
                                            item: cartItem.copyWith(
                                              quantity: 1,
                                            ),
                                            customerCodeInfo: context
                                                .read<CustomerCodeBloc>()
                                                .state
                                                .customerCodeInfo,
                                            salesOrganisationConfigs: context
                                                .read<SalesOrgBloc>()
                                                .state
                                                .configs,
                                            shipToInfo: context
                                                .read<ShipToCodeBloc>()
                                                .state
                                                .shipToInfo,
                                            doNotallowOutOfStockMaterial: context
                                                .read<EligibilityBloc>()
                                                .state
                                                .doNotAllowOutOfStockMaterials,
                                            salesOrganisation: context
                                                .read<SalesOrgBloc>()
                                                .state
                                                .salesOrganisation,
                                          ),
                                        );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: const BoxDecoration(
                                      color: ZPColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                        color: ZPColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      title: Column(
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
                                  cartItem
                                      .materialInfo.defaultMaterialDescription,
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
                            style: Theme.of(context).textTheme.subtitle2?.apply(
                                  color: ZPColors.lightGray,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
