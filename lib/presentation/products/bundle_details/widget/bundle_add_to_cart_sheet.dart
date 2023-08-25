import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BundlesAddToCartSheet extends StatelessWidget {
  const BundlesAddToCartSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BundleAddToCartBloc, BundleAddToCartState>(
      buildWhen: (previous, current) =>
          previous.bundleMaterials != current.bundleMaterials,
      builder: (context, state) {
        return Padding(
          key: WidgetKeys.bundleAddToCartSheet,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add bundle to cart'.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              InfoLabel(
                textValue:
                    'Please note that the minimum total purchase quantity for this bundle offer is ${state.bundle.bundle.minimumQuantityBundleMaterial.quantity}.',
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.bundleMaterials.length,
                  itemBuilder: (context, index) => _BundleMaterialListTile(
                    materialInfo: state.bundleMaterials.elementAt(index),
                  ),
                ),
              ),
              const _BundleSheetFooter(),
            ],
          ),
        );
      },
    );
  }
}

class _BundleMaterialListTile extends StatefulWidget {
  final MaterialInfo materialInfo;
  const _BundleMaterialListTile({
    Key? key,
    required this.materialInfo,
  }) : super(key: key);

  @override
  State<_BundleMaterialListTile> createState() =>
      _BundleMaterialListTileState();
}

class _BundleMaterialListTileState extends State<_BundleMaterialListTile> {
  final TextEditingController _controller = TextEditingController(text: '0');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addOosMaterials =
        context.read<SalesOrgBloc>().state.configs.addOosMaterials;

    return Row(
      key: WidgetKeys.bundleMaterialListItem,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCard(
          showShadow: false,
          showBorder: true,
          child: ProductImage(
            materialNumber: widget.materialInfo.materialNumber,
            height: MediaQuery.of(context).size.height * 0.1,
            width: Responsive.isLargerThan(context, Breakpoint.desktop)
                ? MediaQuery.of(context).size.width * 0.16
                : MediaQuery.of(context).size.width * 0.22,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.materialInfo.materialNumber.displayMatNo,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (!widget.materialInfo.inStock) ...[
                    const SizedBox(
                      width: 5,
                    ),
                    StatusLabel(
                      status: StatusType(addOosMaterials.oosMaterialTag),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 5),
              Text(
                widget.materialInfo.displayDescription,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 8),
              CartItemQuantityInput(
                isEnabled: widget.materialInfo.inStock ||
                    (!widget.materialInfo.inStock &&
                        addOosMaterials.isOutOfStock),
                quantityAddKey: WidgetKeys.bundleInputAddKey,
                quantityDeleteKey: WidgetKeys.bundleInputDeleteKey,
                quantityTextKey: WidgetKeys.bundleQuantityTextKey,
                controller: _controller,
                onFieldChange: (quantity) =>
                    context.read<BundleAddToCartBloc>().add(
                          BundleAddToCartEvent.updateQuantity(
                            materialNumber: widget.materialInfo.materialNumber,
                            quantity: quantity,
                          ),
                        ),
                minusPressed: (quantity) =>
                    context.read<BundleAddToCartBloc>().add(
                          BundleAddToCartEvent.updateQuantity(
                            materialNumber: widget.materialInfo.materialNumber,
                            quantity: quantity,
                          ),
                        ),
                addPressed: (quantity) =>
                    context.read<BundleAddToCartBloc>().add(
                          BundleAddToCartEvent.updateQuantity(
                            materialNumber: widget.materialInfo.materialNumber,
                            quantity: quantity,
                          ),
                        ),
                onSubmit: (k) {},
                isLoading: false,
                returnZeroOnFieldEmpty: true,
                minimumQty: 1,
                maximumQty: 999999,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BundleSheetFooter extends StatelessWidget {
  const _BundleSheetFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BundleAddToCartBloc, BundleAddToCartState>(
      buildWhen: (previous, current) =>
          previous.totalCount != current.totalCount,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: ZPColors.lightGray,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total quantity: ${state.totalCount}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'MYR ${state.bundleOffer.rate} per item',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: ZPColors.skyBlueColor),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: Text('Cancel'.tr()),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: BlocConsumer<CartBloc, CartState>(
                      listenWhen: (previous, current) =>
                          previous.isUpserting != current.isUpserting,
                      listener: (context, state) {
                        state.apiFailureOrSuccessOption.fold(
                          () {
                            if (!state.isUpserting &&
                                state.cartProducts.isNotEmpty) {
                              Navigator.pop(context);
                              CustomSnackBar(
                                messageText: 'Item has been added to cart'.tr(),
                              ).show(context);
                            }
                          },
                          (either) => Navigator.pop(context),
                        );
                      },
                      builder: (context, stateCart) {
                        final materialInCart = stateCart.cartProducts
                                .where(
                                  (element) =>
                                      element.bundle.bundleCode ==
                                      context
                                          .read<BundleAddToCartBloc>()
                                          .state
                                          .bundle
                                          .materialNumber
                                          .getValue(),
                                )
                                .firstOrNull ??
                            PriceAggregate.empty();

                        return ElevatedButton(
                          onPressed: state.totalCount <
                                      state
                                          .bundle
                                          .bundle
                                          .minimumQuantityBundleMaterial
                                          .quantity ||
                                  stateCart.isUpserting
                              ? null
                              : () {
                                  context.read<CartBloc>().add(
                                        CartEvent.upsertCartItems(
                                          salesOrganisation: context
                                              .read<SalesOrgBloc>()
                                              .state
                                              .salesOrganisation,
                                          customerCodeInfo: context
                                              .read<CustomerCodeBloc>()
                                              .state
                                              .customerCodeInfo,
                                          shipToInfo: context
                                              .read<CustomerCodeBloc>()
                                              .state
                                              .shipToInfo,
                                          priceAggregate:
                                              PriceAggregate.empty().copyWith(
                                            bundle: Bundle.empty().copyWith(
                                              materials:
                                                  state.bundleMaterialsSelected
                                                      .map(
                                                        (e) => e.copyWith(
                                                          quantity: e.quantity +
                                                              (materialInCart
                                                                      .bundle
                                                                      .materials
                                                                      .where(
                                                                        (element) =>
                                                                            element.materialNumber ==
                                                                            e.materialNumber,
                                                                      )
                                                                      .firstOrNull
                                                                      ?.quantity ??
                                                                  0),
                                                        ),
                                                      )
                                                      .toList(),
                                              bundleCode: state
                                                  .bundle.materialNumber
                                                  .getValue(),
                                              bundleName: BundleName(
                                                state
                                                    .bundle.materialDescription,
                                              ),
                                            ),
                                          ),
                                          salesOrganisationConfigs: context
                                              .read<SalesOrgBloc>()
                                              .state
                                              .configs,
                                        ),
                                      );
                                },
                          child: LoadingShimmer.withChild(
                            enabled: stateCart.isUpserting,
                            child: const Text('Add To Cart').tr(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
