part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';

class _BonusItemSection extends StatelessWidget {
  const _BonusItemSection({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<ReturnMaterial> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const SizedBox.shrink()
        : ExpandableInfo(
            labelText: 'Bonus details'.tr(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: ZPColors.extraLightGrey3,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                e.materialNumber.displayMatNo,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: ZPColors.primary,
                                ),
                                child: Text(
                                  'Bonus'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: ZPColors.white,
                                        fontSize: 10,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            e.materialDescription,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${'Batch'.tr()} ${e.batch} (${'Expires'.tr()} ${e.expiryDate.dateString})',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: ZPColors.darkGray,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                              Text(
                                'x ${e.balanceQuantity.apiParameterValue} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: ZPColors.skyBlueColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
