import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class EditDeleteDialog extends StatelessWidget {
  const EditDeleteDialog({
    Key? key,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      key: const ValueKey('editDeleteDialog'),
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
      onSelected: (String value) {
        if (value == 'edit') {
          onEdit.call();
          // AddRemarkDialog.show(
          //   context: context,
          //   cartItem: cartItem,
          //   isEdit: true,
          //   isBonus: isBonus,
          //   bonusItem: bonusItem,
          // );
        } else {
          onDelete.call();
          // context.read<CartBloc>().add(
          //       const CartEvent.remarksChanged(''),
          //     );
          // if (isBonus) {
          //   context.read<CartBloc>().add(
          //         CartEvent.addRemarksToBonusItem(
          //           item: cartItem,
          //           bonusItem: bonusItem,
          //           isDelete: true,
          //         ),
          //       );
          // } else {
          //   context.read<CartBlocV2Bloc>().add(
          //         CartBlocV2Event.addRemarkToCartItem(
          //           item: cartItem,
          //           message: '',
          //         ),
          //       );
          //   context.read<CartBloc>().add(
          //         CartEvent.addRemarksToCartItem(
          //           item: cartItem,
          //           isDelete: true,
          //         ),
          //       );
          // }
        }
      },
    );
  }
}
