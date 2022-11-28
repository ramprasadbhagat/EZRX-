import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_remark_dialog.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditDeleteDialog extends StatelessWidget {
  const EditDeleteDialog({
    Key? key,
    required this.cartItem,
    required this.bonusItem,
    required this.isBonus,
  }) : super(key: key);

  final PriceAggregate cartItem;
  final MaterialInfo bonusItem;
  final bool isBonus;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.more_vert,
        color: ZPColors.white,
        size: 15,
      ),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 'edit',
            child: Text('Edit'),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          ),
        ];
      },
      onSelected: (String value) => actionPopUpItemSelected(
        value: value,
        context: context,
        cartItem: cartItem,
        bonusItem: bonusItem,
        isBonus: isBonus,
      ),
    );
  }

  void actionPopUpItemSelected({
    required BuildContext context,
    required String value,
    required PriceAggregate cartItem,
    required MaterialInfo bonusItem,
    required bool isBonus,
  }) {
    if (value == 'edit') {
      AddRemarkDialog.show(
        context: context,
        cartItem: cartItem,
        isEdit: true,
        confirmText: 'Update',
        isBonus: isBonus,
        bonusItem: bonusItem,
      );
    } else {
      context.read<CartBloc>().add(
            const CartEvent.remarksChanged(''),
          );
      if (isBonus) {
        context.read<CartBloc>().add(
              CartEvent.addRemarksToBonusItem(
                item: cartItem,
                bonusItem: bonusItem,
                isDelete: true,
              ),
            );
      } else {
        context.read<CartBloc>().add(
              CartEvent.addRemarksToCartItem(
                item: cartItem,
                isDelete: true,
              ),
            );
      }
    }
  }
}
