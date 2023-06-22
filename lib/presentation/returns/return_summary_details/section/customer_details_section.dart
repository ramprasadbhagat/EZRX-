import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnSummaryCustomerDetailsSection extends StatelessWidget {
  const ReturnSummaryCustomerDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shipToInfo = context.read<CustomerCodeBloc>().state.shipToInfo;

    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      builder: (context, state) {
        return custom.ExpansionTile(
          initiallyExpanded: true,
          keepHeaderBorder: true,
          title: Text(
            'Customer Details'.tr(),
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
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 5,
              keyText: 'Sold To'.tr(),
              valueText:
                  '${state.customerCodeInfo.customerCodeSoldTo}  \n${shipToInfo.shipToAddress} ${state.customerCodeInfo.postalCode}',
            ),
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 5,
              keyText: 'Ship To'.tr(),
              valueText:
                  '${shipToInfo.shipToCustomerCode}  \n${shipToInfo.shipToAddress} ${state.customerCodeInfo.postalCode}',
            ),
          ],
        );
      },
    );
  }
}
