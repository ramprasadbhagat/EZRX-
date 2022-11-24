import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/orders/cart/remarks_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AddRemarkDialog {
  static void show({
    required BuildContext context,
    required PriceAggregate cartItem,
    required bool isEdit,
    String confirmText = 'Add',
    String cancelText = 'Cancel',
  }) {
    showPlatformDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        context.read<CartBloc>().add(
              CartEvent.remarksChanged(
                cartItem.materialInfo.remarks,
              ),
            );

        return BlocConsumer<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.isRemarksAdding && !current.isRemarksAdding,
          listener: (context, state) {
            if (!state.showErrorMessages && !state.remarks.isValid()) {
              context.router.pop();
            }
          },
          buildWhen: (previous, current) =>
              previous.showErrorMessages != current.showErrorMessages,
          builder: (context, state) {
            return PlatformAlertDialog(
              key: const Key('addRemarksDialog'),
              title: Text(isEdit?'Update Remarks':'Add Remarks').tr(),
              content: RemarksForm(
                currentRemarkData: cartItem.materialInfo.remarks,
              ),
              actions: [
                PlatformDialogAction(
                  key: Key(cancelText),
                  child: Text(cancelText).tr(),
                  onPressed: () {
                    context.router.pop();
                  },
                ),
                PlatformDialogAction(
                  key: Key(confirmText),
                  onPressed: state.isRemarksAdding
                      ? null
                      : () {
                          context.read<CartBloc>().add(
                                CartEvent.addRemarksToCartItem(
                                  item: cartItem,
                                  isDelete: false,
                                ),
                              );
                        },
                  child: Text(confirmText).tr(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
