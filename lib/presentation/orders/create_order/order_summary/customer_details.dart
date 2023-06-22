import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDetailsStep extends StatelessWidget {
  const CustomerDetailsStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      key: const Key('_CustomerDetailsStepperKey'),
      buildWhen: (previous, current) =>
          previous.customerCodeInfo != current.customerCodeInfo,
      builder: (context, state) {
        return Column(
          children: [
            ..._getTextRowLevelsForCustomerInfo(
              state.customerCodeInfo,
              context.read<CustomerCodeBloc>().state.shipToInfo,
            ).map((e) {
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

  List<_OrderSummaryDetails> _getTextRowLevelsForCustomerInfo(
    CustomerCodeInfo customer,
    ShipToInfo shipToInfo,
  ) {
    return [
      _OrderSummaryDetails(
        key: 'Customer Name.'.tr(),
        value:
            '${customer.customerName.name1} ${customer.customerName.name2} ${customer.customerName.name3} ${customer.customerName.name4}',
      ),
      _OrderSummaryDetails(
        key: 'Customer Email'.tr(),
        value: customer.customerEmailAddress.tr(),
      ),
      _OrderSummaryDetails(
        key: 'Customer ship to ID'.tr(),
        value: shipToInfo.shipToCustomerCode,
      ),
      _OrderSummaryDetails(
        key: 'Customer sold to ID'.tr(),
        value: customer.customerCodeSoldTo,
      ),
      _OrderSummaryDetails(
        key: 'Customer Classification'.tr(),
        value:
            customer.customerClassification.displayCustomerClassification.tr(),
      ),
      _OrderSummaryDetails(
        key: 'Customer Local Group'.tr(),
        value: customer.customerLocalGroup,
      ),
      _OrderSummaryDetails(
        key: 'Payment Term Description'.tr(),
        value: customer.paymentTermDescription,
      ),
    ];
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
