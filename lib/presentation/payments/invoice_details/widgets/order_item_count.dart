part of 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';

class _OrderItemCount extends StatelessWidget {
  const _OrderItemCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Text(
        '${context.tr('Order items')} (${context.read<CreditAndInvoiceDetailsBloc>().state.details.length})',
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
