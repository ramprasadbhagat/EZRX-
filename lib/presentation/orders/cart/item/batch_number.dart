import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BatchNumberLabel extends StatelessWidget {
  final CartItem cartItem;
  final bool isOrderSummaryView;
  const BatchNumberLabel({
    Key? key,
    required this.cartItem,
    required this.isOrderSummaryView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final material = cartItem.materials.first;
    if (!material.salesOrgConfig.enableBatchNumber) {
      return const SizedBox.shrink();
    }

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) {
            return _BatchActionSheet(
              item: cartItem,
            );
          },
        );
      },
      child: Text(
        '${'Batch Number : '.tr()}${material.stockInfo.batch.selectOrGetBatch}',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              backgroundColor: ZPColors.extraLightGray,
              color: !material.stockInfo.batch.isValid()
                  ? ZPColors.error
                  : ZPColors.black,
            ),
      ),
    );
  }
}

class _BatchActionSheet extends StatelessWidget {
  final CartItem item;
  const _BatchActionSheet({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppBar(
          title: Text(
            'Select Batch Number'.tr(),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              key: const Key('closeButton'),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.clear,
                color: ZPColors.black,
              ),
            ),
          ],
        ),
        SafeArea(
          child: Column(
            children: item.materials.first.stockInfoList.map(
              (StockInfo stockInfo) {
                return RadioListTile<StockInfo>(
                  title: Text(
                    stockInfo.batch.getOrDefaultValue(''),
                  ),
                  groupValue: item.materials.first.stockInfo,
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (StockInfo? value) {
                    context.read<CartBloc>().add(
                          CartEvent.updateBatchInCartItem(
                            item: item,
                            stockInfo: stockInfo,
                          ),
                        );
                    context.router.pop();
                  },
                  value: stockInfo,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
