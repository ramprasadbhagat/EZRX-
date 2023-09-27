part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _ReturnMaterialWidget extends StatelessWidget {
  final ReturnMaterial item;
  final ReturnItemDetails detail;
  const _ReturnMaterialWidget({
    Key? key,
    required this.item,
    required this.detail,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(item.uuid) !=
          current.getReturnItemDetails(item.uuid),
      builder: (context, state) {
        return CustomCard(
          showBorder: true,
          showShadow: false,
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageWithLabel(materialNumber: item.materialNumber),
                  Expanded(
                    child: MaterialInfoWidget(data: item),
                  ),
                  IconButton(
                    visualDensity: const VisualDensity(vertical: -4),
                    onPressed: () => _removeItem(
                      context,
                      state.selectedItems.length,
                    ),
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: ZPColors.red,
                    ),
                  ),
                ],
              ),
              MaterialQuantityAndPrice(
                quantity: item.balanceQuantity.getOrDefaultValue(0),
                unitPrice: item.unitPrice.getOrDefaultValue(0),
              ),
              MaterialDetailsSection(
                data: item,
                expandable: true,
              ),
              _MaterialReturnDetailsSection(
                item: item,
                detail: detail,
              ),
              _BonusItemSection(
                items: item.bonusItems,
              ),
            ],
          ),
        );
      },
    );
  }

  Future _removeItem(BuildContext context, int itemsLength) async {
    final confirmed = await _showConfirmBottomSheet(context);
    if (confirmed ?? false) {
      if (itemsLength == 1) {
        if (context.mounted) {
          await AutoTabsRouter.of(context)
              .navigate(const ReturnItemsTabRoute());
        }
      }
      if (context.mounted) {
        context.read<NewRequestBloc>().add(
              NewRequestEvent.toggleReturnItem(
                selected: false,
                item: item,
              ),
            );
      }
    }
  }

  Future<bool?> _showConfirmBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (_) => const ConfirmBottomSheet(
        title: 'Remove item?',
        content: 'This action cannot be undone',
        confirmButtonText: 'Remove',
      ),
    );
  }
}
