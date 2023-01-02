import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoldToAddressInfo extends StatelessWidget {
  const SoldToAddressInfo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      key: const Key('soldToAddressStepperKey'),
      builder: (context, state) {
        return Column(
          children: [
            ..._getTextRowLevelsForSoldToInfo(state.customerCodeInfo).map(
              (e) {
                return BalanceTextRow(
                  keyText: e.key,
                  valueText: e.value,
                  keyFlex: 1,
                  valueFlex: 1,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class SoldToDetails {
  const SoldToDetails({
    required this.key,
    required this.value,
  });
  final String key;
  final String value;
}

List<SoldToDetails> _getTextRowLevelsForSoldToInfo(
  CustomerCodeInfo customer,
) {
  return [
    SoldToDetails(
      key: 'Sold to ID'.tr(),
      value: customer.customerCodeSoldTo,
    ),
    SoldToDetails(
      key: 'Sold to Customer Name'.tr(),
      value: customer.customerName.toString(),
    ),
    SoldToDetails(
      key: 'Address'.tr(),
      value: customer.customerAddress.toAddress(),
    ),
    SoldToDetails(
      key: 'Postal Code'.tr(),
      value: customer.postalCode,
    ),
    SoldToDetails(
      key: 'Country'.tr(),
      value: customer.region,
    ),
    SoldToDetails(
      key: 'Phone'.tr(),
      value: customer.telephoneNumber,
    ),
  ];
}
