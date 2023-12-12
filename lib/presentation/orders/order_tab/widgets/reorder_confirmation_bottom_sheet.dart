import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReOrderConfirmationBottomSheet extends StatelessWidget {
  final List<MaterialInfo> validOrderItems;
  const ReOrderConfirmationBottomSheet({
    Key? key,
    required this.validOrderItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 60,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Reorder for this delivery address?'),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            context.tr(
              'By proceeding, items currently tagged to a different delivery address in your cart will be removed.',
            ),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          _ReOrderConfirmationButtons(
            validOrderItems: validOrderItems,
          ),
        ],
      ),
    );
  }
}

class _ReOrderConfirmationButtons extends StatelessWidget {
  final List<MaterialInfo> validOrderItems;
  const _ReOrderConfirmationButtons({
    Key? key,
    required this.validOrderItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.isClearing != current.isClearing,
      listener: (context, state) {
        if (!state.isClearing) {
          state.apiFailureOrSuccessOption.fold(
            () {
              context.router.pop();
              context.read<CartBloc>().add(
                    CartEvent.addHistoryItemsToCart(
                      items: validOrderItems,
                      counterOfferDetails: RequestCounterOfferDetails.empty(),
                    ),
                  );
              context.read<ReOrderPermissionBloc>().add(
                    ReOrderPermissionEvent.resetOrderNumberWillUpsert(
                      orderNumberWillUpsert: OrderNumber(''),
                    ),
                  );
              context.router.pushNamed('orders/cart');
            },
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.isClearing != current.isClearing ||
          previous.isBuyAgain != current.isBuyAgain,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  context.read<ReOrderPermissionBloc>().add(
                        ReOrderPermissionEvent.resetOrderNumberWillUpsert(
                          orderNumberWillUpsert: OrderNumber(''),
                        ),
                      );
                  context.router.pop();
                },
                child: Text(context.tr('Cancel')),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(
                        const CartEvent.clearCart(),
                      );
                },
                child: LoadingShimmer.withChild(
                  enabled: state.isClearing,
                  child: Text(
                    context.tr('Proceed'),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
