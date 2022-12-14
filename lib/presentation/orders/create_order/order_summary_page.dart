import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_view_model.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_helper.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_bundle_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_material_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/orders/core/order_ship_to_info.dart';
import 'package:ezrxmobile/presentation/orders/core/order_sold_to_info.dart';
import 'package:ezrxmobile/presentation/orders/create_order/additional_details.dart';
import 'package:ezrxmobile/presentation/orders/create_order/save_template_dialog.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('Order Summary Screen');

    return Scaffold(
      key: const Key('orderSummaryKey'),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          title: const Text('Order Summary').tr(),
          actions: const [
            _SaveTemplateButton(),
          ],
        ),
      ),
      body: const _BodyContent(),
    );
  }
}

class _SaveTemplateButton extends StatelessWidget {
  const _SaveTemplateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderTemplateListBloc, OrderTemplateListState>(
      listenWhen: (previous, current) =>
          previous.apiFailureOrSuccessOption !=
          current.apiFailureOrSuccessOption,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {
              showSnackBar(
                context: context,
                message: 'Saved order template'.tr(),
              );
            },
          ),
        );
      },
      builder: (context, state) {
        return IconButton(
          key: const Key('orderSummarySaveTemplate'),
          onPressed: () => SaveTemplateDialog.show(context: context),
          icon: const Icon(
            Icons.featured_play_list_outlined,
          ),
        );
      },
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SavedOrderListBloc, SavedOrderListState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, savedOrderState) {
        if (savedOrderState.isDraftOrderCreated) {
          context.router.pushNamed('saved_order_list');
        } else {
          savedOrderState.apiFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, savedOrderState) {
        return Column(
          children: [
            const AccountSuspendedBanner(),
            Expanded(
              child: _Stepper(
                savedOrderState: savedOrderState,
              ),
            ),
          ],
        );
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

  void _validateForm({
    required BuildContext context,
  }) {
    context.read<AdditionalDetailsBloc>().add(
          AdditionalDetailsEvent.validateForm(
            config: context.read<SalesOrgBloc>().state.configs,
          ),
        );
  }

  void _saveOrder(BuildContext context) {
    context.read<SavedOrderListBloc>().add(
          SavedOrderListEvent.createDraft(
            shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            user: context.read<UserBloc>().state.user,
            cartItems: context.read<CartBloc>().state.cartItemList,
            grandTotal: context.read<CartBloc>().state.grandTotal,
            data: context
                .read<AdditionalDetailsBloc>()
                .state
                .additionalDetailsData,
            existingSavedOrderList: savedOrderState.savedOrders,
          ),
        );
  }

  void _moveToOrderHistory(BuildContext context) {
    context.read<OrderHistoryListBloc>().add(
          OrderHistoryListEvent.fetch(
            salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
            user: context.read<UserBloc>().state.user,
            orderHistoryFilter: context
                .read<OrderHistoryFilterBloc>()
                .state
                .orderHistoryFilterList,
            sortDirection: 'desc',
          ),
        );
    context.read<CartBloc>().add(const CartEvent.clearCart());
    context.router.pushNamed('order_confirmation');
  }

  void _stepTapped(BuildContext context, int step) {
    context.read<OrderSummaryBloc>().add(
          OrderSummaryEvent.stepTapped(
            step: step,
          ),
        );
  }

  void _stepContinue(BuildContext context) {
    context
        .read<OrderSummaryBloc>()
        .add(const OrderSummaryEvent.stepContinue());
  }

  void _handleError(BuildContext context, OrderSummaryState state) {
    state.apiFailureOrSuccessOption.fold(
      () {},
      (either) => either.fold(
        (failure) {
          final failureMessage = failure.toString();
          showSnackBar(
            context: context,
            message: failureMessage.tr(),
          );
        },
        (_) {},
      ),
    );
  }

  void _handleListner(BuildContext context, OrderSummaryState state) {
    if (state.isSubmitSuccess) {
      context
          .read<AdditionalDetailsBloc>()
          .add(const AdditionalDetailsEvent.flushForm());
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
      key: const Key('orderSUmmaryBlocConsumer'),
      listenWhen: (previous, current) => previous != current,
      listener: (context, orderSummaryState) {
        _handleListner(context, orderSummaryState);
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final config = context.read<SalesOrgBloc>().state.configs;
        final eligibleForOrderSubmit =
            context.read<OrderEligibilityBloc>().state.eligibleForOrderSubmit;
        final isAccountSuspended =
            context.read<EligibilityBloc>().state.isAccountSuspended;

        return Stepper(
          margin: const EdgeInsets.fromLTRB(50, 10, 10, 10),
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    key: Key(details.currentStep == state.maxSteps
                        ? 'submitButtonKey'
                        : 'continueButtonKey'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: details.currentStep == state.maxSteps
                          ? eligibleForOrderSubmit && !isAccountSuspended
                              ? ZPColors.primary
                              : ZPColors.lightGray
                          : ZPColors.primary,
                    ),
                    onPressed: () {
                      if (details.currentStep == state.maxSteps) {
                        if (eligibleForOrderSubmit) {
                          _validateForm(
                            context: context,
                          );
                        }
                      } else {
                        if (details.currentStep ==
                            state.additionalDetailsStep) {
                          _validateForm(
                            context: context,
                          );
                        } else {
                          _stepContinue(context);
                        }
                      }
                    },
                    child: details.currentStep == state.maxSteps
                        ? LoadingShimmer.withChild(
                            enabled: state.isSubmitting,
                            child: const Text('Submit').tr(),
                          )
                        : const Text('Continue').tr(),
                  ),
                  ElevatedButton(
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                ZPColors.darkGray,
                              ),
                            ),
                    onPressed: () async {
                      if (details.currentStep == state.maxSteps) {
                        _saveOrder(context);
                      } else {
                        context
                            .read<OrderSummaryBloc>()
                            .add(const OrderSummaryEvent.stepCancel());
                      }
                    },
                    child: details.currentStep == state.maxSteps
                        ? LoadingShimmer.withChild(
                            enabled: savedOrderState.isCreating,
                            child: const Text('Save').tr(),
                          )
                        : const Text('Back').tr(),
                  ),
                ],
              ),
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

bool _isDisclamerPresent(BuildContext context) {
  return context.read<SalesOrgBloc>().state.salesOrganisation.salesOrg.isSg &&
      !context.read<UserBloc>().state.user.role.type.isSalesRep;
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
      content: const _CustomerDetailsStep(),
    ),
    Step(
      title: Text('Sold to Address'.tr()),
      content: const SoldToAddressInfo(),
    ),
    Step(
      title: Text('Ship to Address'.tr()),
      content: const ShipToAddressInfo(),
    ),
    if (config.enableBillTo &&
        billToInfo.billToCustomerCode.isNotEmpty &&
        billToInfo.billToCustomerCode != customerCodeInfo.customerCodeSoldTo)
      Step(
        title: Text('Bill to Address'.tr()),
        content: _BillToCustomerStep(
          billToInfo: billToInfo,
        ),
      ),
    Step(
      title: Text('Additional Information'.tr()),
      content: const _AdditionalDetailsStep(),
    ),
    Step(
      title: Text(_isDisclamerPresent(context)
          ? 'Disclaimer & Cart Details'.tr()
          : 'Cart Details'.tr()),
      content: const _CartDetails(),
    ),
  ];
}

class _AdditionalDetailsStep extends StatelessWidget {
  const _AdditionalDetailsStep();

  void _submitOrder(BuildContext context) {
    context.read<OrderSummaryBloc>().add(OrderSummaryEvent.submitOrder(
          config: context.read<SalesOrgBloc>().state.configs,
          shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
          customerCodeInfo:
              context.read<CustomerCodeBloc>().state.customerCodeInfo,
          salesOrganisation:
              context.read<SalesOrgBloc>().state.salesOrganisation,
          user: context.read<UserBloc>().state.user,
          cartItems: context.read<CartBloc>().state.cartItemList,
          grandTotal: context.read<CartBloc>().state.grandTotal,
          orderType: '',
          data:
              context.read<AdditionalDetailsBloc>().state.additionalDetailsData,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdditionalDetailsBloc, AdditionalDetailsState>(
      key: const Key('additionalDetailsFormKey'),
      listenWhen: (previous, current) => previous != current,
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
        return AdditionalDetails(
          config: context.read<SalesOrgBloc>().state.configs,
          state: state,
        );
      },
    );
  }
}

class _OrderSummaryDetails {
  const _OrderSummaryDetails({
    required this.key,
    required this.value,
  });

  final String key;
  final String value;
}

List<_OrderSummaryDetails> _getTextRowLevelsForCustomerInfo(
  CustomerCodeInfo customer,
) {
  return [
    _OrderSummaryDetails(
      key: 'Customer Name',
      value:
          '${customer.customerName.name1} ${customer.customerName.name2} ${customer.customerName.name3} ${customer.customerName.name4}',
    ),
    _OrderSummaryDetails(
      key: 'Customer Email',
      value: customer.customerEmailAddress,
    ),
    _OrderSummaryDetails(
      key: 'Customer ship to ID',
      value: customer.shipToInfos[0].shipToCustomerCode,
    ),
    _OrderSummaryDetails(
      key: 'Customer sold to ID',
      value: customer.customerCodeSoldTo,
    ),
    _OrderSummaryDetails(
      key: 'Customer Classification',
      value: customer.customerClassification,
    ),
    _OrderSummaryDetails(
      key: 'Customer Local Group',
      value: customer.customerLocalGroup,
    ),
    _OrderSummaryDetails(
      key: 'Payment Term Description',
      value: customer.paymentTermDescription,
    ),
  ];
}

class _BillToCustomerStep extends StatelessWidget {
  final BillToInfo billToInfo;

  const _BillToCustomerStep({
    Key? key,
    required this.billToInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('billToCustomer'),
      children: WidgetHelper.getBillToCustomerDetails(billToInfo),
    );
  }
}

class _CustomerDetailsStep extends StatelessWidget {
  const _CustomerDetailsStep();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      key: const Key('_CustomerDetailsStepperKey'),
      buildWhen: (previous, current) =>
          previous.customerCodeInfo != current.customerCodeInfo,
      builder: (context, state) {
        return Column(
          children: [
            ..._getTextRowLevelsForCustomerInfo(state.customerCodeInfo)
                .map((e) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BalanceTextRow(
                  keyText: e.key,
                  valueText: e.value,
                  keyFlex: 1,
                  valueFlex: 1,
                ),
              );
            }),
          ],
        );
      },
    );
  }
}

class _Disclaimer extends StatelessWidget {
  const _Disclaimer();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      key: const Key('disclaimerKey'),
      children: [
        context.read<EligibilityBloc>().state.isOrderSummaryPPEDisclaimerEnable
            ? RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'To avoid delays to your PPE Orders, please\n\n\u2022 Order the quantity as stated in the MOH Order template\n\n\u2022 Do not place NON PPE items in the same Order\nNote: Minimum Order value is waived for MOH PPE Orders only\n',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        const _MarketMessage(),
        const SizedBox(
          height: 15,
        ),
        //displayNote()
      ],
    );
  }
}

class _MarketMessage extends StatelessWidget {
  const _MarketMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderMarketMessage =
        context.read<SalesOrgBloc>().state.configs.orderSummaryDisclaimer;
    final orderType =
        context.read<OrderDocumentTypeBloc>().state.selectedOrderType;

    return !(orderType.isZPFB || orderType.isZPFC)
        ? RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: orderMarketMessage,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}

class _CartDetails extends StatelessWidget {
  const _CartDetails();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      key: const Key('_cartDetailsKey'),
      listenWhen: (previous, current) =>
          previous.cartItemList != current.cartItemList,
      listener: (context, state) {
        if (state.cartItemList.isEmpty) {
          // context.router.pop();
        }
      },
      buildWhen: (previous, current) =>
          previous.cartItemList != current.cartItemList,
      builder: (context, state) {
        final salesOrgConfig = context.read<SalesOrgBloc>().state.configs;
        final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;
        final selectedMaterialList =
            context.read<CartBloc>().state.selectedItemsMaterialNumber;

        return Column(
          children: [
            const _Disclaimer(),
            BalanceTextRow(
              keyText: 'Subtotal'.tr(),
              valueText: StringUtils.displayPrice(
                salesOrgConfig,
                state.subtotal,
              ),
            ),
            salesOrgConfig.enableVat || salesOrgConfig.enableTaxAtTotalLevelOnly
                ? BalanceTextRow(
                    keyText: '$taxCode in %'.tr(),
                    valueText: '${salesOrgConfig.vatValue}%',
                  )
                : const SizedBox.shrink(),
            salesOrgConfig.enableVat || salesOrgConfig.enableTaxAtTotalLevelOnly
                ? BalanceTextRow(
                    keyText: taxCode.tr(),
                    valueText: StringUtils.displayPrice(
                      salesOrgConfig,
                      state.vatTotal,
                    ),
                  )
                : const SizedBox.shrink(),
            BalanceTextRow(
              keyText: 'Min. Order Value'.tr(),
              valueText: StringUtils.displayPrice(
                salesOrgConfig,
                double.parse(salesOrgConfig.minOrderAmount),
              ),
            ),
            BalanceTextRow(
              keyText: 'Grand Total'.tr(),
              valueText: StringUtils.displayPrice(
                salesOrgConfig,
                state.grandTotal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...state.displayCartItems.map((item) {
              switch (item.itemType) {
                case CartItemType.material:
                  return selectedMaterialList
                          .contains(item.materials.first.getMaterialNumber)
                      ? CartMaterialItemTile(
                          cartItem: item.materials.first,
                          taxCode: taxCode,
                        )
                      : const SizedBox.shrink();
                case CartItemType.bundle:
                  return CartBundleItemTile(
                    cartItem: item,
                    taxCode: taxCode,
                  );
              }
            }),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
