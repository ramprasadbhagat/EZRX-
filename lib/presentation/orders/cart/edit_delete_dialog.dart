import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_remark_dialog.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditDeleteDialog extends StatelessWidget {
  const EditDeleteDialog({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final PriceAggregate cartItem;

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
        value,
        context,
        cartItem,
      ),
    );
  }

  void actionPopUpItemSelected(
    String value,
    BuildContext context,
    PriceAggregate cartItem,
  ) {
    if (value == 'edit') {
      AddRemarkDialog.show(
        context: context,
        cartItem: cartItem,
        isEdit: true,
        confirmText: 'Update',
      );
    } else {
      context.read<CartBloc>().add(
            const CartEvent.remarksChanged(''),
          );
      context.read<CartBloc>().add(
            CartEvent.addRemarksToCartItem(
              item: cartItem,
              isDelete: true,
            ),
          );
    }
  }
}
