import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_view_model.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_helper.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_bundle_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_material_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/orders/core/order_ship_to_info.dart';
import 'package:ezrxmobile/presentation/orders/core/order_sold_to_info.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_type_selector.dart';
import 'package:ezrxmobile/presentation/orders/create_order/save_template_dialog.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

GlobalKey<FormState> _additionalDetailsFormKey = GlobalKey<FormState>();

enum AdditionalInfoLabelList {
  customerPoReference,
  specialInstruction,
  referenceNote,
  collectiveNumber,
  contactPerson,
  contactNumber,
  paymentTerm,
  deliveryDate
}

final Map<AdditionalInfoLabelList, String> data = {
  AdditionalInfoLabelList.customerPoReference: '',
  AdditionalInfoLabelList.specialInstruction: '',
  AdditionalInfoLabelList.referenceNote: '',
  AdditionalInfoLabelList.collectiveNumber: '',
  AdditionalInfoLabelList.contactPerson: '',
  AdditionalInfoLabelList.contactNumber: '',
  AdditionalInfoLabelList.paymentTerm: '',
  AdditionalInfoLabelList.deliveryDate: '',
};

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

  void _saveAdditionalInformation(
    String value,
    AdditionalInfoLabelList lavel,
  ) {
    data[lavel] = value;
  }

  String? _validateAdditionalInformation(
    String value,
    AdditionalInfoLabelList label,
  ) {
    if (value.isEmpty) {
      switch (label) {
        case AdditionalInfoLabelList.customerPoReference:
          return 'Customer PO Reference Required'.tr();
        case AdditionalInfoLabelList.contactPerson:
          return 'Please enter contact person'.tr();
        case AdditionalInfoLabelList.contactNumber:
          return 'Please enter valid contact number'.tr();
        case AdditionalInfoLabelList.paymentTerm:
          return 'Please Select Payment Term'.tr();
        default:
      }
    }

    return null;
  }

  bool _performFormAction() {
    var isValid = false;
    if (_additionalDetailsFormKey.currentState!.validate()) {
      _additionalDetailsFormKey.currentState!.save();
      isValid = true;
    }

    return isValid;
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
            data: data,
            existingSavedOrderList: savedOrderState.savedOrders,
          ),
        );
  }

  void _submitOrder({
    required List<PriceAggregate> cartItems,
    required User user,
    required double grandTotal,
    required BuildContext context,
    required OrderSummaryState state,
  }) {
    if (_performFormAction()) {
      context.read<OrderSummaryBloc>().add(
            OrderSummaryEvent.submitOrder(
              shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              salesOrganisation:
                  context.read<SalesOrgBloc>().state.salesOrganisation,
              user: context.read<UserBloc>().state.user,
              cartItems: context.read<CartBloc>().state.cartItemList,
              grandTotal: context.read<CartBloc>().state.grandTotal,
              data: data,
              orderType: '',
              config: context.read<SalesOrgBloc>().state.configs,
            ),
          );
    } else {
      context.read<OrderSummaryBloc>().add(
            OrderSummaryEvent.stepTapped(
              step: state.additionalDetailsStep,
            ),
          );
    }
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
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      listener: (context, orderSummaryState) {
        if (orderSummaryState.isSubmitSuccess) {
          context.read<OrderHistoryListBloc>().add(
                OrderHistoryListEvent.fetch(
                  salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                  customerCodeInfo: customerCodeInfo,
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
        } else {
          orderSummaryState.apiFailureOrSuccessOption.fold(
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
                        if (eligibleForOrderSubmit && !isAccountSuspended) {
                          _submitOrder(
                            cartItems:
                                context.read<CartBloc>().state.cartItemList,
                            user: context.read<UserBloc>().state.user,
                            grandTotal:
                                context.read<CartBloc>().state.grandTotal,
                            context: context,
                            state: state,
                          );
                        }
                      } else {
                        final shouldStepContinue =
                            details.currentStep == state.additionalDetailsStep
                                ? _performFormAction()
                                : true;
                        shouldStepContinue
                            ? context
                                .read<OrderSummaryBloc>()
                                .add(const OrderSummaryEvent.stepContinue())
                            : null;
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
            context
                .read<OrderSummaryBloc>()
                .add(OrderSummaryEvent.stepTapped(step: step));
          },
          currentStep: context.read<OrderSummaryBloc>().state.step,
          steps: _getSteps(
            context: context,
            config: config,
            billToInfo: billToInfo,
            customerCodeInfo: customerCodeInfo,
            savedFunction: _saveAdditionalInformation,
            validateFunction: _validateAdditionalInformation,
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
  required Function savedFunction,
  required Function validateFunction,
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
      content: _AdditionalInformationStep(
        saveData: savedFunction,
        validateData: validateFunction,
      ),
    ),
    Step(
      title: Text(_isDisclamerPresent(context)
          ? 'Disclaimer & Cart Details'.tr()
          : 'Cart Details'.tr()),
      content: const _CartDetails(),
    ),
  ];
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
    const _OrderSummaryDetails(
      key: 'Payment Term Description',
      value: 'NA',
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

class _AdditionalInformationStep extends StatelessWidget {
  final Function saveData;
  final Function validateData;

  const _AdditionalInformationStep({
    required this.saveData,
    required this.validateData,
    Key? key,
  }) : super(key: key);

  String? emptyValidator(
    String value,
    AdditionalInfoLabelList lavel,
  ) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrgBloc, SalesOrgState>(
      key: const Key('_additionalDetailsFormKey'),
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Form(
          key: _additionalDetailsFormKey,
          child: Column(
            children: [
              _TextFormField(
                keyText: 'customerPOReferenceKey',
                labelText: 'Customer PO Reference',
                maxLength: 35,
                saveData: saveData,
                label: AdditionalInfoLabelList.customerPoReference,
                validateData:
                    state.configs.ponRequired ? validateData : emptyValidator,
              ),
              state.configs.enableSpecialInstructions
                  ? _TextFormField(
                      keyText: 'specialInstruction',
                      labelText: 'Special Instructions',
                      keyboardType: TextInputType.multiline,
                      maxLength: 132,
                      saveData: saveData,
                      label: AdditionalInfoLabelList.specialInstruction,
                      validateData: emptyValidator,
                    )
                  : const SizedBox.shrink(),
              state.configs.enableReferenceNote
                  ? _TextFormField(
                      keyText: 'referenceNote',
                      labelText: 'Reference Note',
                      maxLength: 50,
                      keyboardType: TextInputType.multiline,
                      saveData: saveData,
                      label: AdditionalInfoLabelList.referenceNote,
                      validateData: emptyValidator,
                    )
                  : const SizedBox.shrink(),
              state.configs.enableCollectiveNumber &&
                      context.read<UserBloc>().state.user.role.type.isSalesRep
                  ? _TextFormField(
                      keyText: 'collectiveNumber',
                      labelText: 'Collective Number',
                      maxLength: 10,
                      saveData: saveData,
                      label: AdditionalInfoLabelList.collectiveNumber,
                      validateData: emptyValidator,
                    )
                  : const SizedBox.shrink(),
              state.configs.enableMobileNumber
                  ? _TextFormField(
                      keyText: 'contactPersonKey',
                      labelText: 'Contact Person',
                      maxLength: 50,
                      saveData: saveData,
                      label: AdditionalInfoLabelList.contactPerson,
                      validateData: validateData,
                    )
                  : const SizedBox.shrink(),
              state.configs.enableMobileNumber
                  ? _TextFormField(
                      keyText: 'contactNumberKey',
                      labelText: 'Contact Number',
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      saveData: saveData,
                      label: AdditionalInfoLabelList.contactNumber,
                      validateData: validateData,
                    )
                  : const SizedBox.shrink(),
              state.configs.enableFutureDeliveryDay
                  ? _DatePickerField(
                      futureDeliveryDay: context
                          .read<SalesOrgBloc>()
                          .state
                          .configs
                          .futureDeliveryDay,
                      saveData: saveData,
                    )
                  : const SizedBox.shrink(),
              state.configs.enablePaymentTerms
                  ? _PaymentTerm(
                      validateData: validateData,
                      saveData: saveData,
                    )
                  : const SizedBox.shrink(),
              //OrderType
              context.read<EligibilityBloc>().state.isOrderTypeEnable
                  ? Container(
                      margin: const EdgeInsets.only(top: 18),
                      child: const OrderTypeSelector(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
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
      key: const Key('disclaimerKey'),
      children: [
        context.read<SalesOrgBloc>().state.salesOrganisation.salesOrg.isSg &&
                !context.read<UserBloc>().state.user.role.type.isSalesRep
            ? RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'To avoid delays to your PPE Orders, please\n\n\u2022 Order the quantity as stated in the MOH Order template\n\n\u2022 Do not place NON PPE items in the same Order\nNote: Minimum Order value is waived for MOH PPE Orders only',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 15,
        ),
        //displayNote()
      ],
    );
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

class _TextFormField extends StatelessWidget {
  final String keyText;
  final String labelText;
  final AdditionalInfoLabelList label;
  final int maxLength;
  final TextInputType keyboardType;
  final Function saveData;
  final Function validateData;

  const _TextFormField({
    required this.keyText,
    required this.labelText,
    required this.label,
    required this.maxLength,
    this.keyboardType = TextInputType.text,
    required this.saveData,
    required this.validateData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: Key(keyText),
          keyboardType: keyboardType,
          initialValue: data[label],
          maxLength: maxLength,
          maxLines: keyboardType == TextInputType.multiline ? null : 1,
          validator: (value) {
            return validateData(value, label);
          },
          onSaved: (value) {
            saveData(value, label);
          },
          decoration: InputDecoration(
            labelText: labelText.tr(),
            // labelStyle: const TextStyle(fontSize: 12.0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class _PaymentTerm extends StatefulWidget {
  final Function validateData;
  final Function saveData;

  const _PaymentTerm({
    required this.validateData,
    required this.saveData,
  });

  @override
  State<_PaymentTerm> createState() => _PaymentTermState();
}

class _PaymentTermState extends State<_PaymentTerm> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller =
        TextEditingController(text: data[AdditionalInfoLabelList.paymentTerm]);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentTermBloc, PaymentTermState>(
      key: const Key('_paymentTermKey'),
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return TextFormField(
          key: const Key('_paymentTermTextKey'),
          controller: _controller,
          onSaved: (value) {
            widget.saveData(value, AdditionalInfoLabelList.paymentTerm);
          },
          validator: (value) {
            return widget.validateData(
              value,
              AdditionalInfoLabelList.paymentTerm,
            );
          },
          onTap: () => showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) {
              return PlatformAlertDialog(
                title: const Text('Please Select Payment Term').tr(),
                actions: state.paymentTermsDisplayLevels.map((e) {
                  return e.isNotEmpty
                      ? PlatformDialogAction(
                          key: Key('paymentterm-$e'),
                          child: Text(e),
                          onPressed: () async {
                            _controller.text = e;
                            await context.router.pop();
                          },
                        )
                      : const SizedBox.shrink();
                }).toList(),
              );
            },
          ),
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Select Payment Term'.tr(),
            // labelStyle: const TextStyle(fontSize: 12.0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down,
              color: ZPColors.darkGray,
            ),
          ),
        );
      },
    );
  }
}

class _DatePickerField extends StatefulWidget {
  final String futureDeliveryDay;
  final Function saveData;

  const _DatePickerField({
    required this.futureDeliveryDay,
    required this.saveData,
    Key? key,
  }) : super(key: key);

  @override
  State<_DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<_DatePickerField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController.fromValue(TextEditingValue(
      text: widget.futureDeliveryDay.isEmpty
          ? DateFormat('yyyy-MM-dd')
              .format(DateTime.now().add(const Duration(days: 1)))
          : DateFormat('yyyy-MM-dd').format(DateTime.now()
              .add(Duration(days: int.parse(widget.futureDeliveryDay)))),
    ));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('_DatePickerFieldKey'),
      children: [
        InkWell(
          onTap: () async {
            final dateTime = await getDateFromDatePicker(
              true,
              widget.futureDeliveryDay,
              context,
            );
            controller.text = DateFormat('yyyy-MM-dd').format(dateTime);
          },
          child: IgnorePointer(
            child: TextFormField(
              enabled: true,
              keyboardType: TextInputType.datetime,
              controller: controller,
              onSaved: (value) {
                widget.saveData(value, AdditionalInfoLabelList.deliveryDate);
              },
              decoration: InputDecoration(
                labelText: 'Requested Delivery Date'.tr(),
                // labelStyle: const TextStyle(fontSize: 12.0),
                suffixIcon: const Icon(
                  Icons.calendar_month,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Future<DateTime> getDateFromDatePicker(
    enableFutureDevlieryDay,
    futureDeliveryDay,
    BuildContext context,
  ) async {
    final orderDate = await showPlatformDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 100)),
      lastDate: DateTime.now().add(const Duration(days: 100)),
      initialDate: DateTime.now(),
    );

    return orderDate ?? DateTime.now();
  }
}
