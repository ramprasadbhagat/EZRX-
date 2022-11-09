import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/license_info.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_list_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          title: const Text('Order Summary').tr(),
        ),
      ),
      body: const _BodyContent(),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
      builder: (context, state) {
        return Stepper(
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (details.currentStep == 5) {
                        //code to submit
                      } else {
                        context
                            .read<OrderSummaryBloc>()
                            .add(const OrderSummaryEvent.stepContinue());
                      }
                    },
                    child: details.currentStep == 5
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
                    onPressed: () {
                      if (details.currentStep == 5) {
                        //code to save
                      } else {
                        context
                            .read<OrderSummaryBloc>()
                            .add(const OrderSummaryEvent.stepCancel());
                      }
                    },
                    child: details.currentStep == 5
                        ? const Text('Save').tr()
                        : const Text('Cancel').tr(),
                  ),
                ],
              ),
            );
          },
          physics: const BouncingScrollPhysics(),
          key: const Key('orderSummaryKey'),
          type: StepperType.vertical,
          onStepTapped: (step) {
            context
                .read<OrderSummaryBloc>()
                .add(OrderSummaryEvent.stepTapped(step: step));
          },
          onStepCancel: () {
            context
                .read<OrderSummaryBloc>()
                .add(const OrderSummaryEvent.stepCancel());
          },
          onStepContinue: () {
            context
                .read<OrderSummaryBloc>()
                .add(const OrderSummaryEvent.stepContinue());
          },
          currentStep: context.read<OrderSummaryBloc>().state.step,
          steps: [
            Step(
              title: Text('Customer Details'.tr()),
              content: const _CustomerDetailsStep(),
            ),
            Step(
              title: Text('Sold to Address'.tr()),
              content: const _SoldToAddressStep(),
            ),
            Step(
              title: Text('Ship to Address'.tr()),
              content: const _ShipToAddressStep(),
            ),
            Step(
              title: Text('Additional Information'.tr()),
              content: const _AdditionalInformationStep(),
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

List<_OrderSummaryDetails> _getTextRowLevelsForSoldToInfo(
  CustomerCodeInfo customer,
) {
  return [
    _OrderSummaryDetails(
      key: 'Sold to ID',
      value: customer.customerCodeSoldTo,
    ),
    _OrderSummaryDetails(
      key: 'Sold to Customer Name',
      value:
          '${customer.customerName.name1} ${customer.customerName.name2} ${customer.customerName.name3} ${customer.customerName.name4}',
    ),
    _OrderSummaryDetails(
      key: 'Address',
      value:
          '${customer.customerAddress.street1} ${customer.customerAddress.street2} ${customer.customerAddress.street3} ${customer.customerAddress.street4} ${customer.customerAddress.street5}',
    ),
    _OrderSummaryDetails(
      key: 'Postal Code',
      value: customer.postalCode,
    ),
    _OrderSummaryDetails(
      key: 'Country',
      value: customer.region,
    ),
    const _OrderSummaryDetails(
      key: 'Phone',
      value: 'NA',
    ),
  ];
}

List<_OrderSummaryDetails> _getTextRowLevelsForLicense(
  List<LicenseInfo> licenses,
) {
  final finalList = licenses.map((license) {
    return [
      _OrderSummaryDetails(
        key: 'License Number'.tr(),
        value: license.licenseNumber,
      ),
      _OrderSummaryDetails(
        key: 'License Type'.tr(),
        value: license.licenceType,
      ),
      _OrderSummaryDetails(
        key: 'License Description'.tr(),
        value: license.licenseDescription,
      ),
      _OrderSummaryDetails(
        key: 'Valid From'.tr(),
        value: license.validFrom,
      ),
      _OrderSummaryDetails(
        key: 'Valid To'.tr(),
        value: license.validTo,
      ),
    ];
  }).toList();

  return finalList.expand((element) => element).toList();
}

List<_OrderSummaryDetails> _getTextRowLevelsForShipToInfo(ShipToInfo ship) {
  return [
    _OrderSummaryDetails(
      key: 'Ship to ID',
      value: ship.shipToCustomerCode,
    ),
    _OrderSummaryDetails(
      key: 'Address',
      value:
          '${ship.shipToAddress.street} ${ship.shipToAddress.street2} ${ship.shipToAddress.street3} ${ship.shipToAddress.street4} ${ship.shipToAddress.street5} ${ship.city2} ${ship.city1}',
    ),
    _OrderSummaryDetails(
      key: 'Postal Code',
      value: ship.postalCode,
    ),
    _OrderSummaryDetails(
      key: 'Country',
      value: ship.region,
    ),
    _OrderSummaryDetails(
      key: 'Phone',
      value: ship.telephoneNumber,
    ),
    _OrderSummaryDetails(
      key: 'License',
      value: 'View license info'.tr(),
    ),
  ];
}

class _CustomerDetailsStep extends StatelessWidget {
  const _CustomerDetailsStep({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
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

class _SoldToAddressStep extends StatelessWidget {
  const _SoldToAddressStep({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      builder: (context, state) {
        return Column(
          children: [
            ..._getTextRowLevelsForSoldToInfo(state.customerCodeInfo).map(
              (e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: BalanceTextRow(
                    keyText: e.key,
                    valueText: e.value,
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _ShipToAddressStep extends StatelessWidget {
  const _ShipToAddressStep({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShipToCodeBloc, ShipToCodeState>(
      builder: (context, state) {
        return Column(
          children: [
            ..._getTextRowLevelsForShipToInfo(state.shipToInfo).map(
              (e) {
                return e.key != 'License'
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: BalanceTextRow(
                          keyText: e.key,
                          valueText: e.value,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  e.key,
                                  style: const TextStyle(
                                    color: ZPColors.darkGray,
                                    fontSize: 12.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (_) {
                                        return SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.6,
                                          child: const _LicenseModal(),
                                        );
                                      },
                                    );
                                  },
                                  child: Wrap(children: [
                                    const Text(
                                      ': ',
                                      style: TextStyle(
                                        color: ZPColors.black,
                                        fontSize: 12.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      e.value,
                                      style: const TextStyle(
                                        color: ZPColors.secondary,
                                        fontSize: 12.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          ],
        );
      },
    );
  }
}

class _AdditionalInformationStep extends StatelessWidget {
  const _AdditionalInformationStep({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShipToCodeBloc, ShipToCodeState>(
      builder: (context, state) {
        return Column(
          children: [
            const _TextFormField(
              labelText: 'Customer PO Reference (Max length: 35 Characters)',
              maxLength: 35,
            ),
            context.read<SalesOrgBloc>().state.configs.enableSpecialInstructions
                ? const _TextFormField(
                    labelText:
                        'Special Instructions (Max length: 132 Characters)',
                    maxLength: 132,
                  )
                : const SizedBox.shrink(),
            context.read<SalesOrgBloc>().state.configs.enableReferenceNote
                ? const _TextFormField(
                    labelText: 'Reference Note',
                    maxLength: 50,
                  )
                : const SizedBox.shrink(),
            context.read<SalesOrgBloc>().state.configs.enableCollectiveNumber &&
                    context.read<UserBloc>().state.user.role.type.isSalesRep
                ? const _TextFormField(
                    labelText: 'Collective Number (Max length: 10 Characters)',
                    maxLength: 10,
                  )
                : const SizedBox.shrink(),
            context.read<SalesOrgBloc>().state.configs.enableMobileNumber
                ? const _TextFormField(
                    labelText: 'Contact Person',
                    maxLength: 50,
                  )
                : const SizedBox.shrink(),
            context.read<SalesOrgBloc>().state.configs.enableMobileNumber
                ? const _TextFormField(
                    labelText: 'Contact Number',
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
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
          ],
        );
      },
    );
  }
}

class _Disclaimer extends StatelessWidget {
  const _Disclaimer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.read<SalesOrgBloc>().state.salesOrganisation.salesOrg.country ==
                    'SG' &&
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
  const _CartDetails({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
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
            ...state.cartItemList.map((e) => CartItemListTile(cartItem: e)),
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
  final int maxLength;
  final TextInputType? keyboardType;
  const _TextFormField({
    required this.labelText,
    required this.maxLength,
    this.keyboardType,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: keyboardType ?? TextInputType.text,
          initialValue: '',
          maxLength: maxLength,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            border: InputBorder.none,
            labelText: labelText.tr(),
            labelStyle: const TextStyle(fontSize: 12.0),
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
  const _PaymentTerm({
    Key? key,
  }) : super(key: key);

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
      builder: (context, state) {
        return TextFormField(
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
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            border: InputBorder.none,
            labelText: 'Select Payment Term'.tr(),
            labelStyle: const TextStyle(fontSize: 12.0),
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
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0,
                ),
                border: InputBorder.none,
                labelText: 'YYYY-MM-DD'.tr(),
                labelStyle: const TextStyle(fontSize: 12.0),
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

class _LicenseModal extends StatelessWidget {
  const _LicenseModal({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'Licenses'.tr(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PaymentCustomerInformationBloc,
            PaymentCustomerInformationState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: BalanceTextRow(
                    keyText:
                        _getTextRowLevelsForLicense(state.licenses)[index].key,
                    valueText:
                        _getTextRowLevelsForLicense(state.licenses)[index]
                            .value,
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return (index + 1) % 5 == 0
                    ? const Divider()
                    : const SizedBox.shrink();
              },
              itemCount: _getTextRowLevelsForLicense(state.licenses).length,
            );
          },
        ),
      ),
    );
  }
}
