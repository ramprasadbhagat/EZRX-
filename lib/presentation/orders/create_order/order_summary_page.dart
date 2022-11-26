import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/core/order_sold_to_info.dart';
import 'package:ezrxmobile/presentation/orders/core/order_ship_to_info.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_material_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_type_selector.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              final failureMessage = failure.failureMessage;
              showSnackBar(
                context: context,
                message: failureMessage.tr(),
              );
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
          onPressed: () => showSaveTemplateDialog(context),
          icon: const Icon(
            Icons.featured_play_list_outlined,
          ),
        );
      },
    );
  }

  void showSaveTemplateDialog(BuildContext context) {
    final templateNameTextController = TextEditingController();
    showPlatformDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => PlatformAlertDialog(
        title: const Text('Save as Template').tr(),
        content: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: PlatformTextField(
            controller: templateNameTextController,
            maxLength: 35,
            hintText: 'Enter template name',
            material: (context, platform) => MaterialTextFieldData(
              decoration: const InputDecoration(
                counterText: '',
              ),
            ),
            cupertino: (context, platform) => CupertinoTextFieldData(
              maxLength: 35,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
            ),
          ),
        ),
        actions: [
          PlatformDialogAction(
            key: const Key('saveButton'),
            child: const Text('Save'),
            onPressed: () =>
                saveButtonPressed(context, templateNameTextController.text),
          ),
          PlatformDialogAction(
            key: const Key('closeButton'),
            child: const Text('Close'),
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
    );
  }

  void saveButtonPressed(BuildContext context, templateName) {
    context.router.pop();
    final templateList =
        context.read<OrderTemplateListBloc>().state.orderTemplateList;
    final priceAggregateList = context.read<CartBloc>().state.cartItemList;
    final userID = context.read<UserBloc>().state.user.id;
    final cartList = <OrderTemplateMaterial>[];
    priceAggregateList
        .map((cartItem) => cartList.add(cartItem.toOrderTemplateMaterial()))
        .toList();
    context.read<OrderTemplateListBloc>().add(
          OrderTemplateListEvent.save(
            templateName: templateName,
            userID: userID,
            cartList: cartList,
            templateList: templateList,
          ),
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
      builder: (context, savedOrderState) {
        return _Stepper(
          savedOrderState: savedOrderState,
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
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
                    onPressed: () {
                      if (details.currentStep == state.maxSteps) {
                        //code to submit
                      } else {
                        if (details.currentStep == 3) {
                          _additionalDetailsFormKey.currentState?.save();
                        }
                        context
                            .read<OrderSummaryBloc>()
                            .add(const OrderSummaryEvent.stepContinue());
                      }
                    },
                    child: details.currentStep == state.maxSteps
                        ? const Text('Submit').tr()
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
                      if (details.currentStep == 5) {
                        context.read<SavedOrderListBloc>().add(
                              SavedOrderListEvent.createDraft(
                                shipToInfo: context
                                    .read<ShipToCodeBloc>()
                                    .state
                                    .shipToInfo,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                salesOrganisation: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation,
                                user: context.read<UserBloc>().state.user,
                                cartItems:
                                    context.read<CartBloc>().state.cartItemList,
                                grandTotal:
                                    context.read<CartBloc>().state.grandTotal,
                                data: data,
                                existingSavedOrderList:
                                    savedOrderState.savedOrders,
                              ),
                            );
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
          steps: [
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
            Step(
              title: Text('Additional Information'.tr()),
              content: _AdditionalInformationStep(
                saveData: _saveAdditionalInformation,
              ),
            ),
            Step(
              title: Text('Disclaimer'.tr()),
              content: const _Disclaimer(),
            ),
            Step(
              title: Text('Cart Details'.tr()),
              content: const _CartDetails(),
            ),
          ],
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
    const _OrderSummaryDetails(
      key: 'Payment Term Description',
      value: 'NA',
    ),
  ];
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
  const _AdditionalInformationStep({
    required this.saveData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Biswaranjan - can we use SalesOrgBloc builder here instead of ShipToCodeBloc
    return BlocBuilder<ShipToCodeBloc, ShipToCodeState>(
      key: const Key('_additionalDetailsFormKey'),
      buildWhen: (previous, current) =>
          previous.shipToInfo != current.shipToInfo,
      builder: (context, state) {
        return Form(
          key: _additionalDetailsFormKey,
          child: Column(
            children: [
              _TextFormField(
                labelText: 'Customer PO Reference',
                maxLength: 35,
                saveData: saveData,
                label: AdditionalInfoLabelList.customerPoReference,
              ),
              context
                      .read<SalesOrgBloc>()
                      .state
                      .configs
                      .enableSpecialInstructions
                  ? _TextFormField(
                      labelText: 'Special Instructions',
                      keyboardType: TextInputType.multiline,
                      maxLength: 132,
                      saveData: saveData,
                      label: AdditionalInfoLabelList.specialInstruction,
                    )
                  : const SizedBox.shrink(),
              context.read<SalesOrgBloc>().state.configs.enableReferenceNote
                  ? _TextFormField(
                      labelText: 'Reference Note',
                      maxLength: 50,
                      keyboardType: TextInputType.multiline,
                      saveData: saveData,
                      label: AdditionalInfoLabelList.referenceNote,
                    )
                  : const SizedBox.shrink(),
              context
                          .read<SalesOrgBloc>()
                          .state
                          .configs
                          .enableCollectiveNumber &&
                      context.read<UserBloc>().state.user.role.type.isSalesRep
                  ? _TextFormField(
                      labelText: 'Collective Number',
                      maxLength: 10,
                      saveData: saveData,
                      label: AdditionalInfoLabelList.collectiveNumber,
                    )
                  : const SizedBox.shrink(),
              context.read<SalesOrgBloc>().state.configs.enableMobileNumber
                  ? _TextFormField(
                      labelText: 'Contact Person',
                      maxLength: 50,
                      saveData: saveData,
                      label: AdditionalInfoLabelList.contactPerson,
                    )
                  : const SizedBox.shrink(),
              context.read<SalesOrgBloc>().state.configs.enableMobileNumber
                  ? _TextFormField(
                      labelText: 'Contact Number',
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      saveData: saveData,
                      label: AdditionalInfoLabelList.contactNumber,
                    )
                  : const SizedBox.shrink(),
              context.read<SalesOrgBloc>().state.configs.enableFutureDeliveryDay
                  ? _DatePickerField(
                      futureDeliveryDay: context
                          .read<SalesOrgBloc>()
                          .state
                          .configs
                          .futureDeliveryDay,
                    )
                  : const SizedBox.shrink(),
              context.read<SalesOrgBloc>().state.configs.enablePaymentTerms
                  ? const _PaymentTerm()
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
                          'To avoid delays to your PPE Orders, please\n \u2022 Order the quantity as stated in the MOH Order template\n \u2022 Do not place NON PPE items in the same Order\nNote: Minimum Order value is waived for MOH PPE Orders only',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
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

        return Column(
          children: [
            BalanceTextRow(
              keyText: 'Subtotal'.tr(),
              valueText: _displayPrice(salesOrgConfig, state.subtotal),
            ),
            salesOrgConfig.enableVat
                ? BalanceTextRow(
                    keyText: '$taxCode in %'.tr(),
                    valueText: '${salesOrgConfig.vatValue}%',
                  )
                : const SizedBox.shrink(),
            salesOrgConfig.enableVat
                ? BalanceTextRow(
                    keyText: taxCode.tr(),
                    valueText: _displayPrice(salesOrgConfig, state.vatTotal),
                  )
                : const SizedBox.shrink(),
            BalanceTextRow(
              keyText: 'Grand Total'.tr(),
              valueText: _displayPrice(salesOrgConfig, state.grandTotal),
            ),
            const SizedBox(
              height: 20,
            ),
            ...state.cartItemList.map((e) => CartMaterialItemTile(
                  cartItem: e,
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}

String _displayPrice(SalesOrganisationConfigs salesOrgConfig, double price) {
  if (salesOrgConfig.currency.isVN) {
    return '${price.toStringAsFixed(2)} ${salesOrgConfig.currency.code}';
  }

  return '${salesOrgConfig.currency.code} ${price.toStringAsFixed(2)}';
}

class _TextFormField extends StatelessWidget {
  final String labelText;
  final AdditionalInfoLabelList label;
  final int maxLength;
  final TextInputType keyboardType;
  final Function saveData;
  const _TextFormField({
    required this.labelText,
    required this.label,
    required this.maxLength,
    this.keyboardType = TextInputType.text,
    required this.saveData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: keyboardType,
          initialValue: data[label],
          maxLength: maxLength,
          maxLines: keyboardType == TextInputType.multiline ? null : 1,
          onSaved: (value) {
            saveData(value, label);
          },
          decoration: InputDecoration(
            // border: InputBorder.none,
            labelText: labelText.tr(),
            // labelStyle: const TextStyle(fontSize: 12.0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ZPColors.primary, width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ZPColors.darkGray, width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
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
  const _PaymentTerm();

  @override
  State<_PaymentTerm> createState() => _PaymentTermState();
}

class _PaymentTermState extends State<_PaymentTerm> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
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
      key: const Key('_PaymentTermKey'),
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return TextFormField(
          key: const Key('_PaymentTermTextKey'),
          controller: _controller,
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
            border: InputBorder.none,
            labelText: 'Select Payment Term'.tr(),
            // labelStyle: const TextStyle(fontSize: 12.0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ZPColors.primary, width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ZPColors.darkGray, width: 2.0),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
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

  const _DatePickerField({
    required this.futureDeliveryDay,
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
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Requested Delivery Date'.tr(),
                // labelStyle: const TextStyle(fontSize: 12.0),
                suffixIcon: const Icon(
                  Icons.calendar_month,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ZPColors.primary, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ZPColors.darkGray, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
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
