import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
        return Theme(
          data: ThemeData(
            canvasColor: ZPColors.white,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: ZPColors.primary,
                  background: ZPColors.primary,
                  secondary: ZPColors.primary,
                ),
          ),
          child: Stepper(
            physics: const BouncingScrollPhysics(),
            key: const Key('orderSummaryKey'),
            type: StepperType.vertical,
            onStepTapped: (step) {
              context
                  .read<OrderSummaryBloc>()
                  .add(const OrderSummaryEvent.stepContinue());
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
            ],
          ),
        );
      },
    );
  }
}

final _customerDetails = [
  'Customer Name',
  'Customer ship to ID',
  'Customer sold to ID',
  'Customer Classification',
  'Customer Local Group',
  'Payment Term Description',
];

final _soldToDetails = [
  'Sold to ID',
  'Sold to Customer Name',
  'Address',
  'Postal Code',
  'Country',
  'Phone',
];

final _shipToDetails = [
  'Ship to ID',
  'Address',
  'Postal Code',
  'Country',
  'Phone',
  'License',
];

String _getTextRowLevelsForCustomerInfo(int index, CustomerCodeInfo customer) {
  switch (index) {
    case 0:
      return customer.customerName.toString();
    case 1:
      return customer.customerCodeSoldTo;
    case 2:
      return customer.customerCodeSoldTo;
    case 3:
      return customer.customerClassification;
    case 4:
      return customer.customerLocalGroup;
    case 5:
      return customer.paymentTermDescription;
  }

  return '';
}

String _getTextRowLevelsForSoldToInfo(int index, CustomerCodeInfo customer) {
  switch (index) {
    case 0:
      return customer.customerCodeSoldTo;
    case 1:
      return customer.customerName.name1;
    case 2:
      return customer.customerAddress.toString();
    case 3:
      return customer.postalCode;
    case 4:
      return 'NA';
    case 5:
      return 'NA';
  }

  return '';
}

String _getTextRowLevelsForShipToInfo(int index, ShipToInfo ship) {
  switch (index) {
    case 0:
      return ship.shipToCustomerCode;
    case 1:
      return ship.shipToAddress.toString();
    case 2:
      return ship.postalCode;
    case 3:
      return 'NA';
    case 4:
      return ship.telephoneNumber;
    case 5:
      return 'NA';
  }

  return '';
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
            for (var index = 0; index < _customerDetails.length; index++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BalanceTextRow(
                  keyText: _customerDetails[index],
                  valueText: _getTextRowLevelsForCustomerInfo(
                    index,
                    state.customerCodeInfo,
                  ),
                  keyFlex: 1,
                  valueFlex: 1,
                ),
              ),
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
            for (var index = 0; index < _soldToDetails.length; index++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BalanceTextRow(
                  keyText: _soldToDetails[index],
                  valueText: _getTextRowLevelsForSoldToInfo(
                    index,
                    state.customerCodeInfo,
                  ),
                  keyFlex: 1,
                  valueFlex: 1,
                ),
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
            for (var index = 0; index < _shipToDetails.length; index++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BalanceTextRow(
                  keyText: _shipToDetails[index],
                  valueText: _getTextRowLevelsForShipToInfo(
                    index,
                    state.shipToInfo,
                  ),
                  keyFlex: 1,
                  valueFlex: 1,
                ),
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
                      style: Theme.of(context).textTheme.bodyText1,
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

class _TextFormField extends StatelessWidget {
  final String labelText;
  final int maxLength;
  const _TextFormField({
    required this.labelText,
    required this.maxLength,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
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

class _PaymentTerm extends StatelessWidget {
  const _PaymentTerm({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentTermBloc, PaymentTermState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: ZPColors.darkGray, width: 2.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: TextButton(
            onPressed: () => showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) {
                return CupertinoActionSheet(
                  title: Text(
                    'Please Select Payment Term'.tr(),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  actions: state.paymentTerms
                      .map<CupertinoActionSheetAction>(
                        (i) => CupertinoActionSheetAction(
                          child: Text(
                            paymentTermDisplay('$i'),
                            style: const TextStyle(
                              color: ZPColors.primary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          onPressed: () {
                            final event = {
                              'key': 'Select Payment Term',
                              'count': 1,
                            };
                            context.router.pop();
                            //_changeorderPaymentTerm(i);
                          },
                        ),
                      )
                      .toList(),
                );
              },
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Select Payment Term'.tr(),
                              style: const TextStyle(
                                color: ZPColors.lightGray,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String paymentTermDisplay(item) {
    var tempText = '';
    try {
      final parts = item.split('-');
      if (parts.length > 0) {
        tempText = parts.length > 1
            ? parts[0].trim() + '-' + parts[1].trim().toString().tr()
            : parts[0].trim();
      }
    } catch (e) {
      tempText = '';
    }

    return tempText;
  }
}

class _DatePickerField extends StatelessWidget {
  final String futureDeliveryDay;
  const _DatePickerField({
    required this.futureDeliveryDay,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            getDateFromDatePicker(true, futureDeliveryDay, context);
          },
          child: IgnorePointer(
            child: TextFormField(
              enabled: true,
              keyboardType: TextInputType.datetime,
              controller: TextEditingController.fromValue(
                const TextEditingValue(
                  text: '2022-06-10',
                ),
              ),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10.0,
                ),
                border: InputBorder.none,
                labelText: 'YYYY-MM-DD'.tr(),
                labelStyle: const TextStyle(fontSize: 12.0),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/svg/Calendar.svg',
                    height: 20,
                  ),
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

  bool dateSelectionPredicate(day, enableFutureDevlieryDay, futureDeliveryDay) {
    if (enableFutureDevlieryDay) {
      if (day.difference(DateTime.now()).inDays <=
          int.parse(futureDeliveryDay) - 1) {
        return true;
      }

      return false;
    } else {
      if (day.difference(DateTime.now()).inDays == 0) {
        return true;
      }

      return false;
    }
  }

  Future<void> getDateFromDatePicker(
    enableFutureDevlieryDay,
    futureDeliveryDay,
    BuildContext context,
  ) async {
    final orderDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //checkoutdate
      firstDate: DateTime.now().subtract(const Duration(days: 0)),
      lastDate: DateTime(2030),
      selectableDayPredicate: (DateTime day) => dateSelectionPredicate(
        day,
        enableFutureDevlieryDay,
        futureDeliveryDay,
      ),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            canvasColor: ZPColors.white,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: ZPColors.primary,
                ),
          ),
          child: child!,
        );
      },
    );
    if (orderDate != null) {
      //update checkout date
    }
  }
}
