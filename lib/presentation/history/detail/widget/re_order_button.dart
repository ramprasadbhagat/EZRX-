import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/text_button_shimmer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReOrderButton extends StatelessWidget {
  final bool fromTopMenu;

  const ReOrderButton({
    Key? key,
    required this.fromTopMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!context.read<UserBloc>().state.userCanCreateOrder) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.isValidating != current.isValidating,
      builder: (context, priceState) {
        final isLoadingPrice = priceState.isFetching || priceState.isValidating;

        return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
          builder: (context, state) {
            final isLoading = state.isLoading ||
                isLoadingPrice ||
                !state.loadingTenderContractSuccess;

            return fromTopMenu
                ? isLoading
                    ? TextButtonShimmer(
                        key: const ValueKey('reorder'),
                        title: 'Reorder'.tr(),
                      )
                    : TextButton(
                        key: const ValueKey('addToCartPressed'),
                        onPressed: () => _addToCartPressed(
                          context,
                          priceState,
                          state,
                        ),
                        child: Text(
                          'Reorder'.tr(),
                          style: const TextStyle(
                            color: ZPColors.kPrimaryColor,
                          ),
                        ),
                      )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      key: const ValueKey('reOrderButton'),
                      onPressed: isLoading
                          ? null
                          : () => _addToCartPressed(
                                context,
                                priceState,
                                state,
                              ),
                      child: LoadingShimmer.withChild(
                        enabled: state.isLoading,
                        child: const Text('Re-order').tr(),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }

  void _addToCartPressed(
    BuildContext context,
    MaterialPriceDetailState priceState,
    OrderHistoryDetailsState orderState,
  ) {
    trackMixpanelEvent(
      MixpanelEvents.reOrder,
    );
    final eligibilityState = context.read<EligibilityBloc>().state;
    final orderHistoryDetails =
        context.read<OrderHistoryDetailsBloc>().state.orderHistoryDetails;

    final items =
        orderHistoryDetails.allItemQueryInfo.map<PriceAggregate>((queryInfo) {
      final itemInfo = priceState.materialDetails[queryInfo];
      final material = orderState.materials[queryInfo];
      if (itemInfo != null && material != null) {
        return material.copyWith(
          salesOrgConfig: eligibilityState.salesOrgConfigs,
          materialInfo: itemInfo.info,
          price: itemInfo.price,
        );
      }

      return PriceAggregate.empty();
    }).toList();

    context.read<CartBloc>().add(CartEvent.replaceWithOrderItems(
          items: _getUniqueItems(items: items),
          customerCodeInfo: eligibilityState.customerCodeInfo,
          salesOrganisationConfigs: eligibilityState.salesOrgConfigs,
          salesOrganisation: eligibilityState.salesOrganisation,
          shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
          doNotallowOutOfStockMaterial:
              eligibilityState.doNotAllowOutOfStockMaterials,
        ));

    context.read<AdditionalDetailsBloc>().add(
          AdditionalDetailsEvent.initiateFromHistory(
            data: AdditionalDetailsData.fromOrderHistory(
              orderHistoryDetails: orderHistoryDetails,
            ),
            customerCodeInfo: eligibilityState.customerCodeInfo,
          ),
        );
    context.router.pushAndPopUntil(
      const CartPageRoute(),
      predicate: (route) => route.settings.name == 'HomeNavigationTabbarRoute',
    );
  }

  List<CartItem> _getUniqueItems({required List<PriceAggregate> items}) => items
      .groupListsBy((item) => item.materialNumberString)
      .entries
      .map(
        (entry) => entry.value.first.copyWith(
          quantity: entry.value.fold<int>(
            0,
            (sum, item) => sum + item.quantity,
          ),
        ),
      )
      .toList()
      .map((e) => CartItem.material(e))
      .toList();
}
