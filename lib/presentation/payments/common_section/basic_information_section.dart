import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter_bloc/flutter_bloc.dart';

class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      builder: (context, state) {
        return custom.ExpansionTile(
          initiallyExpanded: true,
          keepHeaderBorder: true,
          title: Text(
            'Basic Information'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          children: [
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 5,
              keyText: 'Customer Name'.tr(),
              valueText: state.customerCodeInfo.customerName.name1,
            ),
            const SizedBox(height: 8),
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 5,
              keyText: 'Payer'.tr(),
              valueText: state.customerCodeInfo.customerCodeSoldTo,
            ),
            const SizedBox(height: 8),
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 5,
              keyText: 'Ship To'.tr(),
              valueText:
                  '${state.customerCodeInfo.shipToInfos.isNotEmpty ? state.customerCodeInfo.shipToInfos[0].shipToCustomerCode : ''}: ${state.customerCodeInfo.customerName.name1}, ${state.customerCodeInfo.customerAddress.street1} ${state.customerCodeInfo.customerAddress.street2}, ${state.customerCodeInfo.postalCode}',
            ),
          ],
        );
      },
    );
  }
}
