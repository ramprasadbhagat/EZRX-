import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitContinueButton extends StatelessWidget {
  final ControlsDetails details;
  final bool eligibleForOrderSubmit;
  final bool isAccountSuspended;
  final OrderSummaryState orderSummaryState;
  const SubmitContinueButton({
    required this.details,
    required this.eligibleForOrderSubmit,
    required this.isAccountSuspended,
    required this.orderSummaryState,
    Key? key,
  }) : super(key: key);

  void _validateForm({
    required BuildContext context,
  }) {
    context.read<AdditionalDetailsBloc>().add(
      AdditionalDetailsEvent.validateForm(
        config: context.read<SalesOrgBloc>().state.configs,
      ),
    );
  }

  void _stepContinue(BuildContext context) {
    context
        .read<OrderSummaryBloc>()
        .add(const OrderSummaryEvent.stepContinue());
  }

  bool _isCustomerEDI(BuildContext context) {
    final orderType = context.read<OrderDocumentTypeBloc>().state;
    final eligibilityState = context.read<EligibilityBloc>().state;

    return eligibilityState.customerCodeInfo.status.isEDI
        ? eligibilityState.user.role.type.isSalesRepRole &&
        orderType.isSpecialOrderType
        : true;
  }

  void _submitOrder(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    if (cartBloc.state.batchNotSelected) {
      showSnackBar(
        context: context,
        message: 'Batch Number is empty'.tr(),
      );

      return;
    }
    trackMixpanelEvent(
      MixpanelEvents.submitOrder,
    );
    final isMYMarketSalesRep =
        context.read<EligibilityBloc>().state.isMYMarketSalesRep;

    context.read<OrderSummaryBloc>().add(OrderSummaryEvent.submitOrder(
      config: context.read<SalesOrgBloc>().state.configs,
      shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
      customerCodeInfo:
      context.read<CustomerCodeBloc>().state.customerCodeInfo,
      salesOrganisation:
      context.read<SalesOrgBloc>().state.salesOrganisation,
      user: context.read<UserBloc>().state.user,
      cartItems: cartBloc.state.selectedCartItems.validMaterials,
      grandTotal: cartBloc.state.grandTotal(
        isMYMarketSalesRep: isMYMarketSalesRep,
      ),
      orderDocumentType:
      context.read<OrderDocumentTypeBloc>().state.selectedOrderType,
      data:
      context.read<AdditionalDetailsBloc>().state.additionalDetailsData,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdditionalDetailsBloc, AdditionalDetailsState>(
      listenWhen: (previous, current) =>
      previous.isValidated != current.isValidated ||
          previous.showErrorMessages != current.showErrorMessages,
      listener: (context, state) {
        final orderSummaryBloc = context.read<OrderSummaryBloc>();
        final orderSummaryState = orderSummaryBloc.state;
        if (state.isValidated) {
          orderSummaryState.step == orderSummaryState.additionalDetailsStep
              ? orderSummaryBloc.add(const OrderSummaryEvent.stepContinue())
              : _submitOrder(context);
        } else if (!state.isValidated && state.showErrorMessages) {
          orderSummaryBloc.add(
            OrderSummaryEvent.stepTapped(
              step: orderSummaryState.additionalDetailsStep,
            ),
          );
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return ElevatedButton(
          key: Key(details.currentStep == orderSummaryState.maxSteps
              ? 'submitButtonKey'
              : 'continueButtonKey'),
          style: ElevatedButton.styleFrom(
            backgroundColor: details.currentStep == orderSummaryState.maxSteps
                ? eligibleForOrderSubmit &&
                !isAccountSuspended &&
                _isCustomerEDI(context)
                ? ZPColors.primary
                : ZPColors.lightGray
                : ZPColors.primary,
          ),
          onPressed: () {
            details.currentStep == orderSummaryState.maxSteps
                ? eligibleForOrderSubmit &&
                !isAccountSuspended &&
                _isCustomerEDI(context)
                ? _validateForm(
              context: context,
            )
                : null
                : details.currentStep == orderSummaryState.additionalDetailsStep
                ? _validateForm(
              context: context,
            )
                : _stepContinue(context);
          },
          child: details.currentStep == orderSummaryState.maxSteps
              ? LoadingShimmer.withChild(
            enabled: orderSummaryState.isSubmitting,
            child: const Text('Submit').tr(),
          )
              : const Text('Continue').tr(),
        );
      },
    );
  }
}