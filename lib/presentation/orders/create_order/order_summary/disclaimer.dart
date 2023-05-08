
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      key: const Key('disclaimerKey'),
      children: [
        context.read<EligibilityBloc>().state.isOrderSummaryPPEDisclaimerEnable
            ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To avoid delays to your PPE Orders, please.',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.lightGray,
              ),
            ),
            Text(
              '\u2022 Order the quantity as stated in the MOH Order template',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.lightGray,
              ),
            ),
            Text(
              '\u2022 Do not place NON PPE items in the same Order',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.lightGray,
              ),
            ),
            Text(
              'Note: Minimum Order value is waived for MOH PPE Orders only\n',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.lightGray,
              ),
            ),
          ],
        )
            : const SizedBox.shrink(),
        const _MarketMessage(),
        const SizedBox(
          height: 15,
        ),
        //displayNote()
      ],
    );
  }
}

class _MarketMessage extends StatelessWidget {
  const _MarketMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDocumentTypeBloc, OrderDocumentTypeState>(
      buildWhen: (previous, current) =>
      previous.selectedOrderType != current.selectedOrderType,
      builder: (context, state) {
        final orderMarketMessage =
            context.read<SalesOrgBloc>().state.configs.orderSummaryDisclaimer;
        final orderType =
            context.read<OrderDocumentTypeBloc>().state.selectedOrderType;

        return !orderType.documentType.isSpecialOrderType
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Note'.tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            RichText(
              key: const Key('minimumOrderAmount'),
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: orderMarketMessage,
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
            : const SizedBox.shrink();
      },
    );
  }
}
