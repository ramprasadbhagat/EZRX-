import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/remarks_form/remarks_form_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/remark_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AddRemarkDialog {
  static void cartItem({
    required BuildContext context,
    required CartItem cartItem,
    bool isEdit = false,
  }) {
    _show(
      isEdit: isEdit,
      context: context,
      remarks: cartItem.materials.first.materialInfo.remarks,
      onSubmit: (state) {
        context.read<CartBloc>().add(
              CartEvent.addRemarkToCartItem(
                item: cartItem,
                message: state.remarks.getOrCrash(),
              ),
            );
      },
    );
  }

  static void bonusItem({
    required BuildContext context,
    required CartItem cartItem,
    required MaterialItemBonus bonusItem,
    bool isEdit = false,
  }) {
    _show(
      isEdit: isEdit,
      context: context,
      remarks: bonusItem.materialInfo.remarks,
      onSubmit: (state) {
        context.read<CartBloc>().add(
              CartEvent.addRemarkToBonusItem(
                bonusItem: bonusItem,
                item: cartItem,
                message: state.remarks.getOrCrash(),
              ),
            );
      },
    );
  }

  static void _show({
    required bool isEdit,
    required BuildContext context,
    required String remarks,
    required Function(RemarksFormState state) onSubmit,
  }) {
    const cancelText = 'Cancel';
    final confirmText = isEdit ? 'Update' : 'Add';
    showPlatformDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => RemarksFormBloc()
            ..add(
              RemarksFormEvent.remarksChanged(
                remarks,
              ),
            ),
          child: BlocListener<RemarksFormBloc, RemarksFormState>(
            listenWhen: (previous, current) =>
                previous.isSubmitting && !current.isSubmitting,
            listener: (context, state) {
              if (!state.showErrorMessages) {
                context.router.pop();
                onSubmit(state);
              }
            },
            child: Builder(builder: (context) {
              return PlatformAlertDialog(
                key: const Key('addRemarksDialog'),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(isEdit ? 'Update Remarks' : 'Add Remarks').tr(),
                ),
                content: RemarksForm(currentRemarkData: remarks),
                actions: [
                  PlatformDialogAction(
                    key: Key(cancelText.toLowerCase()),
                    child: const Text(cancelText).tr(),
                    onPressed: () => context.router.pop(),
                  ),
                  PlatformDialogAction(
                    key: Key(confirmText.toLowerCase()),
                    onPressed: () => context.read<RemarksFormBloc>().add(
                          const RemarksFormEvent.submit(),
                        ),
                    child: Text(confirmText).tr(),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
