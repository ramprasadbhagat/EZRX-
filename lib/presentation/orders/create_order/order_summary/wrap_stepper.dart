import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/orders/core/edi_user_continue_note.dart';
import 'package:ezrxmobile/presentation/orders/core/order_ship_to_info.dart';
import 'package:ezrxmobile/presentation/orders/core/order_sold_to_info.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/additional_details_step.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/bill_to_customer.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/cart_details.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/customer_details.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/mov_check_message.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/special_order_material_warning.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/submit_continue_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/utility_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WrapStepper extends StatelessWidget {
  final SavedOrderListState savedOrderState;
  const WrapStepper({
    required this.savedOrderState,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.grandTotal != current.grandTotal,
      builder: (context, state) {
        return _Stepper(savedOrderState: savedOrderState);
      },
    );
  }
}


class _Stepper extends StatelessWidget {
  final SavedOrderListState savedOrderState;

  const _Stepper({
    required this.savedOrderState,
    Key? key,
  }) : super(key: key);

  void _moveToOrderHistory(BuildContext context) {
    context.read<OrderHistoryListBloc>().add(
      OrderHistoryListEvent.fetch(
        salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
        customerCodeInfo:
        context.read<CustomerCodeBloc>().state.customerCodeInfo,
        shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
        user: context.read<UserBloc>().state.user,
        orderHistoryFilter:
        context.read<OrderHistoryFilterBloc>().state.orderHistoryFilter,
        sortDirection: 'desc',
      ),
    );
    final selectedItemIds = context
        .read<CartBloc>()
        .state
        .cartItems
        .where((e) => e.isSelected)
        .map((e) => e.id)
        .toList();
    context.read<CartBloc>().add(
      CartEvent.clearSelectedItemsFromCart(
        selectedItemIds: selectedItemIds,
      ),
    );
    context.router.pushAndPopUntil(
      const OrderSuccessPageRoute(),
      predicate: (route) => route.settings.name == 'HomeNavigationTabbarRoute',
    );
  }

  void _stepTapped(BuildContext context, int step) {
    context.read<OrderSummaryBloc>().add(
      OrderSummaryEvent.stepTapped(
        step: step,
      ),
    );
  }

  void _handleError(BuildContext context, OrderSummaryState state) {
    state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
        },
            (_) {},
      ),
    );
  }

  void _handleListener(BuildContext context, OrderSummaryState state) {
    if (state.isSubmitSuccess) {
      context.read<AdditionalDetailsBloc>().add(
        AdditionalDetailsEvent.initialized(
          config: context.read<SalesOrgBloc>().state.configs,
          customerCodeInfo:
          context.read<CustomerCodeBloc>().state.customerCodeInfo,
        ),
      );
      _moveToOrderHistory(context);
    }
    _handleError(context, state);
  }

  @override
  Widget build(BuildContext context) {
    final customerCodeInfo =
        context.read<CustomerCodeBloc>().state.customerCodeInfo;
    final billToInfo = customerCodeInfo.billToInfos.isNotEmpty
        ? customerCodeInfo.billToInfos.first
        : BillToInfo.empty();

    return BlocConsumer<OrderSummaryBloc, OrderSummaryState>(
      key: const Key('orderSummaryBlocConsumer'),
      listenWhen: (previous, current) => previous != current,
      listener: (context, orderSummaryState) {
        _handleListener(context, orderSummaryState);
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final config = context.read<SalesOrgBloc>().state.configs;
        final isAccountSuspended =
            context.read<EligibilityBloc>().state.isAccountSuspended;
        final orderEligibilityState = context.read<OrderEligibilityBloc>().state;

        return Stepper(
          margin: const EdgeInsets.fromLTRB(50, 10, 10, 10),
          controlsBuilder: (context, details) {
            return Column(
              children: [
                EdiUserContinueNote(
                  maxStepsReached: details.currentStep == state.maxSteps,
                ),
                ContainsSpecialOrderMaterialWarning(
                  containsSpecialOrderMaterial: !orderEligibilityState.validateRegularOrderType,
                  maxStepsReached: details.currentStep == state.maxSteps,
                ),
                MovCheckMessage(
                  isMovQualified: orderEligibilityState.isMinOrderValuePassed,
                  maxStepsReached: details.currentStep == state.maxSteps,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SubmitContinueButton(
                        details: details,
                        eligibleForOrderSubmit: orderEligibilityState.eligibleForOrderSubmit &&
                            !context.read<PoAttachmentBloc>().state.isFetching,
                        isAccountSuspended: isAccountSuspended,
                        orderSummaryState: state,
                      ),
                      UtilityButton(
                        orderSummaryState: state,
                        savedOrderState: savedOrderState,
                        details: details,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          physics: const BouncingScrollPhysics(),
          key: const Key('orderSummaryStepperKey'),
          type: StepperType.vertical,
          onStepTapped: (step) {
            _stepTapped(context, step);
          },
          currentStep: context.read<OrderSummaryBloc>().state.step,
          steps: _getSteps(
            context: context,
            config: config,
            billToInfo: billToInfo,
            customerCodeInfo: customerCodeInfo,
          ),
        );
      },
    );
  }
}


List<Step> _getSteps({
  required BuildContext context,
  required SalesOrganisationConfigs config,
  required BillToInfo billToInfo,
  required CustomerCodeInfo customerCodeInfo,
}) {
  return [
    Step(
      title: Text('Customer Details'.tr()),
      content: const CustomerDetailsStep(),
    ),
    Step(
      title: Text('Sold to Address'.tr()),
      content: const SoldToAddressInfo(),
    ),
    Step(
      title: Text('Ship to Address'.tr()),
      content: const ShipToAddressInfo(),
    ),
    if (context.read<EligibilityBloc>().state.isBillToInfo)
      Step(
        title: Text('Bill to Address'.tr()),
        content: BillToCustomerStep(
          billToInfo: billToInfo,
        ),
      ),
    Step(
      title: Text('Additional Information'.tr()),
      content: const AdditionalDetailsStep(),
    ),
    Step(
      title: Text(_isDisclaimerPresent(context)
          ? 'Disclaimer & Cart Details'.tr()
          : 'Cart Details'.tr()),
      content: const CartDetails(),
    ),
  ];
}

bool _isDisclaimerPresent(BuildContext context) {
  return context.read<SalesOrgBloc>().state.salesOrganisation.salesOrg.isSg &&
      !context.read<UserBloc>().state.user.role.type.isSalesRepRole;
}
