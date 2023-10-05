part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';

class _InvoiceNumber extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  const _InvoiceNumber({Key? key, required this.orderHistoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
      buildWhen: (previous, current) =>
          previous.isFetchingInvoices != current.isFetchingInvoices,
      builder: (context, state) {
        if (!state.isFetchingInvoices &&
            orderHistoryItem.invoiceData.invoiceNumberIsEmpty) {
          return const SizedBox.shrink();
        }

        return LoadingShimmer.withChild(
          enabled: state.isFetchingInvoices,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const Divider(
                  color: ZPColors.accentColor,
                  height: 15,
                  indent: 0,
                  endIndent: 0,
                ),
                Text(
                  '${context.tr('Invoice')} #${orderHistoryItem.invoiceData.invoiceNumber.getOrDefaultValue('')}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
