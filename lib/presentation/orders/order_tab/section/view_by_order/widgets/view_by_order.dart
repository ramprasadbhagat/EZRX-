part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class _ViewByOrder extends StatefulWidget {
  final OrderHistoryDetailsOrderHeader viewByOrderHistoryItem;
  final OrderHistoryItem orderHistoryItem;

  const _ViewByOrder({
    Key? key,
    required this.viewByOrderHistoryItem,
    required this.orderHistoryItem,
  }) : super(key: key);

  @override
  State<_ViewByOrder> createState() => _ViewByOrderState();
}

class _ViewByOrderState extends State<_ViewByOrder> {
  @override
  void initState() {
    context.read<ViewByOrderDetailsBloc>().add(
          ViewByOrderDetailsEvent.fetch(
            user: context.read<UserBloc>().state.user,
            orderHeader: widget.viewByOrderHistoryItem,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return CustomCard(
      child: ListTile(
        onTap: () {
          context.router.push(
            ViewByOrderDetailsPageRoute(
              viewByOrderHistoryItem: widget.viewByOrderHistoryItem,
            ),
          );
        },
        contentPadding: const EdgeInsets.all(10),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${'Order #'.tr()}${widget.viewByOrderHistoryItem.orderNumber.getOrDefaultValue('')}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.viewByOrderHistoryItem.itemCount} ${'items'.tr()}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  PriceComponent(
                    salesOrgConfig: salesOrgConfigs,
                    price: widget.viewByOrderHistoryItem.orderValue.toString(),
                    title: 'Order total : ',
                    priceLabelStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.darkGray,
                            ),
                  ),
                ],
              ),
            ),
            _BuyAgainButton(
              viewByOrderHistoryItem: widget.viewByOrderHistoryItem,
            ),
          ],
        ),
      ),
    );
  }
}
