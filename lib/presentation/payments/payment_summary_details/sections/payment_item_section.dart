import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_item/payment_item_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentItemSection extends StatelessWidget {
  const PaymentItemSection({
    Key? key,
    required this.paymentItemState,
    required this.isSuccessful,
  }) : super(key: key);
  final PaymentItemState paymentItemState;
  final bool isSuccessful;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...paymentItemState.paymentItemList.map(
          (e) => _PaymentItem(
            paymentItem: e,
            showDivider: paymentItemState.paymentItemList.indexOf(e) != 0,
          ),
        ),
      ],
    );
  }
}

class _PaymentItem extends StatelessWidget {
  const _PaymentItem({
    Key? key,
    required this.paymentItem,
    required this.showDivider,
  }) : super(key: key);
  final PaymentItem paymentItem;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Column(
        children: [
          if (showDivider)
            const Divider(
              indent: 0,
              height: 20,
              endIndent: 0,
              color: ZPColors.lightGray2,
            ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            title: Text(
              '${paymentItem.postingKeyName} #${paymentItem.searchKey}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    paymentItem.documentDate.dateString,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  PriceComponent(
                    salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                    price: paymentItem.paymentAmountInDisplayCrcy.toString(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
