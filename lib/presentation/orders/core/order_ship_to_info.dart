import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
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
          key: const ValueKey('shipToAddressInfoStepperKey'),
          children: [
            ..._getTextRowLevelsForShipToInfo(state.shipToInfo).map(
              (e) {
                return e.key != 'License'
                    ? BalanceTextRow(
                        keyText: e.key,
                        valueText: e.value,
                        keyFlex: 1,
                        valueFlex: 1,
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Text(
                              e.key,
                              style:
                                  Theme.of(context).textTheme.titleSmall?.apply(
                                        color: ZPColors.darkGray,
                                      ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              key: const ValueKey('shipToAddressInfo_license'),
                              onTap: () {
                                trackMixpanelEvent(
                                  MixpanelEvents.viewLicenseInfo,
                                );
                                showModalBottomSheet(
                                  context: context,
                                  builder: (_) {
                                    return const LicenseModel();
                                  },
                                );
                              },
                              child: Wrap(children: [
                                Text(
                                  ': ',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(
                                  e.value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.apply(color: ZPColors.secondary),
                                ),
                              ]),
                            ),
                          ),
                        ],
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
      value: shipToInfo.country,
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
