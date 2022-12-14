import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/orders/core/order_license_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShipToAddressInfo extends StatelessWidget {
  const ShipToAddressInfo({
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
                                    final paymentCustomerInformationState = context
                                        .read<PaymentCustomerInformationBloc>()
                                        .state;
                                    locator<CountlyService>().addCountlyEvent(
                                        'view_license_info',
                                        segmentation: {
                                          'NumLicenseAttached':
                                            paymentCustomerInformationState
                                            .licenses.length,
                                          'LicenseType': 
                                            paymentCustomerInformationState
                                            .getLicensesType,
                                        },);
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (_) {
                                        return SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.6,
                                          child: const LicenseModel(),
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

class ShipToDetails {
  const ShipToDetails({
    required this.key,
    required this.value,
  });
  final String key;
  final String value;
}

List<ShipToDetails> _getTextRowLevelsForShipToInfo(ShipToInfo shipToInfo) {
  return [
    ShipToDetails(
      key: 'Ship to ID'.tr(),
      value: shipToInfo.shipToCustomerCode,
    ),
    ShipToDetails(
      key: 'Address'.tr(),
      value: shipToInfo.shipToAddress.toAddress(),
    ),
    ShipToDetails(
      key: 'Postal Code'.tr(),
      value: shipToInfo.postalCode,
    ),
    ShipToDetails(
      key: 'Country'.tr(),
      value: shipToInfo.region,
    ),
    ShipToDetails(
      key: 'Phone'.tr(),
      value: shipToInfo.telephoneNumber,
    ),
    ShipToDetails(
      key: 'License'.tr(),
      value: 'View license info'.tr(),
    ),
  ];
}
