import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/presentation/orders/create_order/save_template_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SaveTemplateDialog {
  static void show({
    required BuildContext context,
  }) {
    showPlatformDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        context.read<OrderTemplateListBloc>().add(
              const OrderTemplateListEvent.templateNameChanged(''),
            );

        return BlocConsumer<OrderTemplateListBloc, OrderTemplateListState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting && !current.isSubmitting,
          listener: (context, state) {
            if (!state.showErrorMessages && state.templateName.isValid()) {
              context.router.pop();
            }
          },
          buildWhen: (previous, current) =>
              previous.showErrorMessages != current.showErrorMessages,
          builder: (context, state) {
            return PlatformAlertDialog(
              key: const Key('saveTemplateDialog'),
              title: const Text('Save as Template').tr(),
              content: const SaveTemplateTextField(),
              actions: [
                PlatformDialogAction(
                  key: const Key('closeButton'),
                  child: const Text('Close'),
                  onPressed: () => context.router.pop(),
                ),
                PlatformDialogAction(
                  key: const Key('saveButton'),
                  onPressed: () => state.isSubmitting
                      ? null
                      : saveButtonPressed(
                          context,
                          state.templateName.getValue(),
                        ),
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  static void saveButtonPressed(BuildContext context, templateName) {
    final templateList =
        context.read<OrderTemplateListBloc>().state.orderTemplateList;
    final cartItem = context.read<CartBloc>().state.cartItems;
    final userID = context.read<UserBloc>().state.user.id;
    context.read<OrderTemplateListBloc>().add(
          OrderTemplateListEvent.save(
            templateName: templateName,
            userID: userID,
            cartList: cartItem,
            templateList: templateList,
          ),
        );
  }
}
