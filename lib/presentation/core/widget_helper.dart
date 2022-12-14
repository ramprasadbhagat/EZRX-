import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';

class WidgetHelper {
  static List<Widget> getBillToCustomerDetails(BillToInfo billToInfo) {
    return _getTextRowLevelsForBillToCustomer(billToInfo: billToInfo).map(
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
    ).toList();
  }

  static List<_KeyValuePair> _getTextRowLevelsForBillToCustomer({
    required BillToInfo billToInfo,
  }) {
    return [
      _KeyValuePair(
        key: 'Bill to Customer Code'.tr(),
        value: billToInfo.billToCustomerCode,
      ),
      _KeyValuePair(
        key: 'Bill to Customer Name'.tr(),
        value: billToInfo.billToName.toString(),
      ),
      _KeyValuePair(
        key: 'Email'.tr(),
        value: billToInfo.emailAddresses.join(','),
      ),
      _KeyValuePair(
        key: 'Tax Number'.tr(),
        value: billToInfo.taxNumber,
      ),
      _KeyValuePair(
        key: 'Address'.tr(),
        value: billToInfo.billToAddress.toAddress(),
      ),
      _KeyValuePair(
        key: 'Postal Code'.tr(),
        value: billToInfo.postalCode,
      ),
      _KeyValuePair(
        key: 'Country'.tr(),
        value: billToInfo.country,
      ),
      _KeyValuePair(
        key: 'Phone'.tr(),
        value: billToInfo.telephoneNumber,
      ),
    ];
  }
}

class _KeyValuePair {
  const _KeyValuePair({
    required this.key,
    required this.value,
  });

  final String key;
  final String value;
}
