import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/license_info.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LicenseModel extends StatelessWidget {
  const LicenseModel({
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
            if (state.licenses.isEmpty) {
              
              return  Center(child: Text('No data found'.tr()));
            }

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

class LicenseDetails {
  const LicenseDetails({
    required this.key,
    required this.value,
  });
  final String key;
  final String value;
}

List<LicenseDetails> _getTextRowLevelsForLicense(
  List<LicenseInfo> licenses,
) {
  final finalList = licenses.map((license) {
    return [
      LicenseDetails(
        key: 'License Number'.tr(),
        value: license.licenseNumber,
      ),
      LicenseDetails(
        key: 'License Type'.tr(),
        value: license.licenceType,
      ),
      LicenseDetails(
        key: 'License Description'.tr(),
        value: license.licenseDescription,
      ),
      LicenseDetails(
        key: 'Valid From'.tr(),
        value: license.validFrom,
      ),
      LicenseDetails(
        key: 'Valid To'.tr(),
        value: license.validTo,
      ),
    ];
  }).toList();

  return finalList.expand((element) => element).toList();
}
