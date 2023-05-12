import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/orders/core/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/save_template_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/wrap_stepper.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('orderSummaryKey'),
      appBar: AppBar(
        title: const Text('Order Summary').tr(),
        actions: const [
          SaveTemplateButton(),
        ],
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: const _BodyContent(),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SavedOrderListBloc, SavedOrderListState>(
      listenWhen: (previous, current) =>
          previous.isCreating != current.isCreating,
      listener: (context, savedOrderState) {
        if (!savedOrderState.isCreating &&
            savedOrderState.apiFailureOrSuccessOption == none()) {
          showSnackBar(
            context: context,
            message: 'Saved order updated successfully'.tr(),
          );

          context.router.pushAndPopUntil(
            const SavedOrderListPageRoute(),
            predicate: (route) =>
                route.settings.name == 'HomeNavigationTabbarRoute',
          );
        } else {
          savedOrderState.apiFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, savedOrderState) {
        return Column(
          children: [
            const EdiUserBanner(),
            const AccountSuspendedBanner(),
            Expanded(
              child: WrapStepper(
                savedOrderState: savedOrderState,
              ),
            ),
          ],
        );
      },
    );
  }
}
