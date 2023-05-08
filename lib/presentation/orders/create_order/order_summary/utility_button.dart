import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UtilityButton extends StatelessWidget {
  final ControlsDetails details;
  final OrderSummaryState orderSummaryState;
  final SavedOrderListState savedOrderState;
  const UtilityButton({
    Key? key,
    required this.details,
    required this.orderSummaryState,
    required this.savedOrderState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoAttachmentBloc, PoAttachmentState>(
      buildWhen: (previous, current) =>
      previous.isFetching != current.isFetching,
      builder: (context, poAttachmentState) {
        return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
          buildWhen: (previous, current) =>
          previous.isLoading != current.isLoading,
          builder: (context, additionalDetailsState) {
            final isUpdateOrder = additionalDetailsState.orderId.isNotEmpty;
            final isLoading = savedOrderState.isCreating ||
                additionalDetailsState.isLoading ||
                poAttachmentState.isFetching;

            return ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: MaterialStateProperty.all(
                  ZPColors.darkGray,
                ),
              ),
              onPressed: () async {
                if (details.currentStep == orderSummaryState.maxSteps) {
                  if (isLoading) return;
                  isUpdateOrder
                      ? _saveOrder(context, isUpdate: true)
                      : _saveOrder(context);
                } else {
                  context.read<OrderSummaryBloc>().add(
                    const OrderSummaryEvent.stepCancel(),
                  );
                }
              },
              child: details.currentStep == orderSummaryState.maxSteps
                  ? LoadingShimmer.withChild(
                enabled: isLoading,
                child: Text(
                  isUpdateOrder ? 'Update' : 'Save',
                  key: Key(isUpdateOrder ? 'Update' : 'Save'),
                ).tr(),
              )
                  : const Text(
                'Back',
                key: Key('stepBack'),
              ).tr(),
            );
          },
        );
      },
    );
  }

  void _saveOrder(BuildContext context, {bool isUpdate = false}) {
    trackMixpanelEvent(
      MixpanelEvents.saveOrder,
    );

    final isMYMarketSalesRep =
        context.read<EligibilityBloc>().state.isMYMarketSalesRep;
    isUpdate
        ? context.read<SavedOrderListBloc>().add(
      SavedOrderListEvent.updateDraft(
        shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
        customerCodeInfo:
        context.read<CustomerCodeBloc>().state.customerCodeInfo,
        salesOrganisation:
        context.read<SalesOrgBloc>().state.salesOrganisation,
        user: context.read<UserBloc>().state.user,
        cartItems: context.read<CartBloc>().state.selectedCartItems,
        grandTotal: context.read<CartBloc>().state.grandTotal(
          isMYMarketSalesRep: isMYMarketSalesRep,
        ),
        data: context
            .read<AdditionalDetailsBloc>()
            .state
            .additionalDetailsData,
        orderId: context.read<AdditionalDetailsBloc>().state.orderId,
      ),
    )
        : context.read<SavedOrderListBloc>().add(
      SavedOrderListEvent.createDraft(
        shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
        customerCodeInfo:
        context.read<CustomerCodeBloc>().state.customerCodeInfo,
        salesOrganisation:
        context.read<SalesOrgBloc>().state.salesOrganisation,
        user: context.read<UserBloc>().state.user,
        cartItems: context.read<CartBloc>().state.selectedCartItems,
        grandTotal: context.read<CartBloc>().state.grandTotal(
          isMYMarketSalesRep: isMYMarketSalesRep,
        ),
        data: context
            .read<AdditionalDetailsBloc>()
            .state
            .additionalDetailsData,
      ),
    );
  }
}

