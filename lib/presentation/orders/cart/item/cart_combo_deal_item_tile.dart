import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_delete_item_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartComboDealItem extends StatelessWidget {
  final CartItem cartItem;
  final bool showCheckBox;

  const CartComboDealItem({
    Key? key,
    required this.cartItem,
    this.showCheckBox = false,
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
                onPressed: (context) {
                  context.read<CartBloc>().add(
                        CartEvent.removeFromCart(item: cartItem),
                      );
                },
              ),
            ],
            borderRadius: 8,
            child: GestureDetector(
              onTap: () {
                final priceComboDeal = cartItem.materials.firstPriceComboDeal;
                final comboDealType = priceComboDeal.category.type;

                if (comboDealType.isMaterialNumber) {
                  context.router.push(
                    ComboDealMaterialDetailPageRoute(
                      comboItems: cartItem.materials,
                      isEdit: true,
                    ),
                  );
                } else if (comboDealType.isPrinciple) {
                  context.router.push(
                    ComboDealPrincipleDetailPageRoute(
                      comboDeal: priceComboDeal,
                      initialComboItems: cartItem.materials,
                    ),
                  );
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showCheckBox)
                    Checkbox(
                      onChanged: (v) {
                        context.read<CartBloc>().add(
                              CartEvent.selectButtonTapped(
                                cartItem: cartItem,
                              ),
                            );
                      },
                      value: cartItem.isSelected,
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: showCheckBox
                              ? EdgeInsets.zero
                              : const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Combo Deals - ${cartItem.materials.first.comboDeal.scheme.name.toUpperCase()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.apply(
                                            color: ZPColors.kPrimaryColor,
                                          ),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              CartDeleteItemButton(item: cartItem),
                            ],
                          ),
                        ),
                        ...List.generate(
                          cartItem.materials.length,
                          (index) {
                            final material = cartItem.materials[index];

                            return Column(
                              children: [
                                ListTile(
                                  contentPadding:
                                      showCheckBox ? EdgeInsets.zero : null,
                                  title: _ComboDealItem(
                                    material: material,
                                    comboGroup: cartItem,
                                  ),
                                ),
                                if (index != cartItem.materials.length - 1)
                                  Container(
                                    height: 2,
                                    color: ZPColors.darkGray,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      left: showCheckBox ? 0 : 20,
                                      right: 20,
                                    ),
                                  ),
                              ],
                            );
                          },
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
    );
  }
}

class _ComboDealItem extends StatelessWidget {
  const _ComboDealItem({
    Key? key,
    required this.material,
    required this.comboGroup,
  }) : super(key: key);

  final PriceAggregate material;
  final CartItem comboGroup;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      material.materialInfo.materialNumber.displayMatNo,
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.kPrimaryColor,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          material.materialInfo.materialDescription,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        if (material.isDefaultMDEnabled)
                          Text(
                            material.materialInfo.defaultMaterialDescription,
                            style:
                                Theme.of(context).textTheme.titleSmall?.apply(
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
                        if (material.salesOrgConfig.expiryDateDisplay)
                          Text(
                            '${'Expiry Date : '.tr()}${material.stockInfo.expiryDate.toValidDateString}',
                            style:
                                Theme.of(context).textTheme.titleSmall?.apply(
                                      color: ZPColors.lightGray,
                                    ),
                          ),
                        BlocBuilder<CartBloc, CartState>(
                          buildWhen: (previous, current) =>
                              previous.isFetching != current.isFetching,
                          builder: (context, state) {
                            if (state.isFetching) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: LoadingShimmer.tile(),
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: LoadingShimmer.tile(),
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: LoadingShimmer.tile(),
                                  ),
                                ],
                              );
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (!material.salesOrgConfig.hideStockDisplay)
                                  Text(
                                    '${'In Stock : '.tr()}${material.stockInfo.inStock.getOrDefaultValue('')}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.apply(
                                          color: ZPColors.lightGray,
                                        ),
                                  ),
                                Text(
                                  'List Price: ${StringUtils.displayPrice(
                                    material.salesOrgConfig,
                                    material.comboDealListPrice,
                                  )}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: ZPColors.lightGray,
                                      ),
                                ),
                                Text(
                                  'Unit Price: ${StringUtils.displayPrice(
                                    material.salesOrgConfig,
                                    material.comboDealUnitPrice(
                                      discount: comboGroup.comboDealRate(
                                        material: material,
                                      ),
                                    ),
                                  )}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: ZPColors.black,
                                      ),
                                ),
                                Text(
                                  'Qty: ${material.quantity}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: ZPColors.black,
                                      ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
