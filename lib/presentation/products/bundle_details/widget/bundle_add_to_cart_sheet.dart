import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_error_section_for_covid.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/price_component.dart';

class BundlesAddToCartSheet extends StatelessWidget {
  const BundlesAddToCartSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bundleAddToCartState = context.read<BundleAddToCartBloc>().state;

    return Padding(
      key: WidgetKeys.bundleAddToCartSheet,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.tr('Add bundle to cart'),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          InfoLabel(
            textValue:
                '${context.tr('Please note that the minimum total purchase quantity for this bundle offer is')} ${bundleAddToCartState.bundle.bundle.minimumQuantityBundleMaterial.quantity}.',
            key: WidgetKeys.addBundleMinimumQty,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bundleAddToCartState.bundleMaterials.length,
              itemBuilder: (context, index) => _BundleMaterialListTile(
                materialInfo:
                    bundleAddToCartState.bundleMaterials.elementAt(index),
              ),
            ),
          ),
          const _BundleSheetFooter(),
        ],
      ),
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
  void initState() {
    super.initState();
    context.read<BundleAddToCartBloc>().add(
          const BundleAddToCartEvent.validateQuantity(
            isError: false,
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final addOosMaterials = eligibilityState.salesOrgConfigs.addOosMaterials;
    final validateOutOfStockValue = eligibilityState.validateOutOfStockValue;

    return Row(
      key: WidgetKeys.bundleMaterialItem(
        widget.materialInfo.materialNumber.displayMatNo,
      ),
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
                  Expanded(
                    child: Text(
                      widget.materialInfo.combinationCode(
                        showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
                      ),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  if (!widget.materialInfo.inStock) ...[
                    const SizedBox(
                      width: 5,
                    ),
                    StatusLabel(
                      status: StatusType(
                        addOosMaterials.productTag(validateOutOfStockValue),
                      ),
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
                key: WidgetKeys.genericKey(
                  key:
                      'bundle${widget.materialInfo.materialNumber.displayMatNo}${_controller.text}quantity',
                ),
                isEnabled: widget.materialInfo.inStock ||
                    (!widget.materialInfo.inStock && validateOutOfStockValue),
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ZPColors.lightGray,
          ),
        ),
      ),
      child: BlocBuilder<BundleAddToCartBloc, BundleAddToCartState>(
        buildWhen: (previous, current) =>
            previous.totalCount != current.totalCount ||
            previous.showErrorMessage != current.showErrorMessage,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total quantity: ${state.totalCount}',
                style: Theme.of(context).textTheme.bodyLarge,
                key: WidgetKeys.addBundleTotalQty,
              ),
              if (state.displayErrorMessage)
                ErrorTextWithIcon(
                  key: WidgetKeys.addBundleInvalidQtyWarning,
                  textPadding: EdgeInsets.zero,
                  valueText:
                      '${context.tr('Minimum total purchase qty')}: ${state.bundle.bundle.minimumQuantityBundleMaterial.quantity}',
                ),
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: state.bundleOffer.rate.toString(),
                type: PriceStyle.bundlePrice,
                trailingText: context.tr('per item'),
                key: WidgetKeys.addBundleRate,
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
                      child: Text(context.tr('Cancel')),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: BlocConsumer<CartBloc, CartState>(
                      listenWhen: (previous, current) =>
                          previous.isUpserting != current.isUpserting,
                      listener: (context, cartState) {
                        cartState.apiFailureOrSuccessOption.fold(
                          () {
                            if (!cartState.isUpserting &&
                                cartState.cartProducts.isNotEmpty) {
                              _trackAddToCartSuccess(context, state);
                              context.router.popForced();
                              CustomSnackBar(
                                messageText: context
                                    .tr('Bundle has been added to cart.'),
                              ).show(context);
                            }
                          },
                          (either) {
                            either.fold(
                              (failure) =>
                                  _trackAddToCartFailure(context, failure),
                              (_) {},
                            );
                            context.router.pop();
                          },
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
                          key: WidgetKeys.bundleAddToCartSheetSubmitButton,
                          onPressed: () => _addBundlesToCart(
                            context,
                            state: state,
                            stateCart: stateCart,
                            materialInCart: materialInCart,
                          ),
                          child: LoadingShimmer.withChild(
                            enabled: stateCart.isUpserting,
                            child: Text(
                              context.tr('Add to cart'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void _trackAddToCartSuccess(
    BuildContext context,
    BundleAddToCartState state,
  ) {
    final bundle = state.bundle;
    final props = <String, dynamic>{
      MixpanelProps.productName: bundle.name,
      MixpanelProps.productCode: bundle.materialNumber.getOrDefaultValue(''),
      MixpanelProps.productManufacturer: bundle.manufactured,
      MixpanelProps.productTotalPrice:
          state.bundleOffer.rate * state.totalCount,
      MixpanelProps.productQty: state.totalCount,
      MixpanelProps.clickAt:
          RouterUtils.buildRouteTrackingName(context.router.currentPath),
    };

    trackMixpanelEvent(MixpanelEvents.addToCartSuccess, props: props);
  }

  void _trackAddToCartFailure(BuildContext context, ApiFailure failure) =>
      trackMixpanelEvent(
        MixpanelEvents.addToCartFailed,
        props: {
          MixpanelProps.errorMessage: failure.failureMessage,
          MixpanelProps.viewFrom:
              RouterUtils.buildRouteTrackingName(context.router.currentPath),
        },
      );

  void _addBundlesToCart(
    BuildContext context, {
    required BundleAddToCartState state,
    required CartState stateCart,
    required PriceAggregate materialInCart,
  }) {
    context.read<BundleAddToCartBloc>().add(
          BundleAddToCartEvent.validateQuantity(
            isError: !state.isBundleCountSatisfied,
          ),
        );

    if (!state.isBundleCountSatisfied || stateCart.isUpserting) return;

    if (stateCart.containFocMaterialInCartProduct) {
      _showCovidWarningMessageBottomSheet(
        context: context,
      );

      return;
    }

    context.read<CartBloc>().add(
          CartEvent.upsertCartItems(
            priceAggregate: PriceAggregate.empty().copyWith(
              bundle: Bundle.empty().copyWith(
                materials: state.selectedMaterialInfo(
                  materialInCart,
                ),
                bundleCode: state.bundle.materialNumber.getValue(),
                bundleName: BundleName(
                  state.bundle.materialDescription,
                ),
              ),
            ),
          ),
        );
  }

  void _showCovidWarningMessageBottomSheet({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      builder: (_) {
        return const AddToCartErrorSection();
      },
    );
  }
}
