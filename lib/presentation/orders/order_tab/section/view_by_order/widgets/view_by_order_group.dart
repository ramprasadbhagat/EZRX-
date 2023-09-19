part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class _ViewByOrderGroup extends StatelessWidget {
  final ViewByOrdersGroup viewByOrdersItem;
  final OrderHistoryItem orderHistoryItem;

  final bool showDivider;
  final bool showBanner;

  const _ViewByOrderGroup({
    Key? key,
    required this.viewByOrdersItem,
    required this.showDivider,
    required this.showBanner,
    required this.orderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showBanner)
          InfoLabel(
            textValue:
                'Order history is limited to the last 6 months from today'.tr(),
            mainColor: ZPColors.blueAccent,
            margin: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(top: 16.0),
          ),
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  '${'Ordered on'.tr()} ${viewByOrdersItem.createdDate.dateString}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              Column(
                children: viewByOrdersItem.orderHeaders
                    .map(
                      (e) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) =>
                                locator<ViewByOrderDetailsBloc>(),
                          ),
                          BlocProvider(
                            create: (context) =>
                                locator<ReOrderPermissionBloc>(),
                          ),
                        ],
                        child: _ViewByOrder(
                          viewByOrderHistoryItem: e,
                          orderHistoryItem: orderHistoryItem,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
