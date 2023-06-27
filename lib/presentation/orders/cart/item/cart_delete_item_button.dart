//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartDeleteItemButton extends StatelessWidget {
  final CartItem item;
  const CartDeleteItemButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(right: 8),
      constraints: const BoxConstraints(),
      key: const Key('deleteFromCart'),
      onPressed: () {
        CustomDialogs.confirmationDialog(
          context: context,
          title: 'Delete Item?',
          message: 'Are you sure you want to delete this item from cart?',
          confirmText: 'Yes',
          cancelText: 'No',
          onAcceptPressed: () async {
            context.read<CartBloc>().add(
                  CartEvent.removeFromCart(
                    item: item,
                  ),
                );
          },
        );
      },
      icon: const Icon(
        Icons.delete,
        color: ZPColors.darkGray,
      ),
    );
  }
}
