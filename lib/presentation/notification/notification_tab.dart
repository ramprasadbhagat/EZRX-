import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/notification/entities/notification_data.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/notification/widgets/notification_list.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'.tr()),
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 8,
        backgroundColor: ZPColors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.read<NotificationBloc>().add(
                    const NotificationEvent.deleteAllNotifications(),
                  );
            },
            icon: const Icon(
              Icons.delete_outline,
              color: ZPColors.red,
            ),
          ),
        ],
      ),
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listenWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        listener: (context, state) {
          state.notificationFailureOrSuccessOption.fold(
            () {
              if (state.isDeletedAllSuccess) {
                CustomSnackBar(
                  messageText: 'Notification has been deleted'.tr(),
                ).show(context);
              }
            },
            (either) => {},
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.isDeletedAllSuccess != current.isDeletedAllSuccess ||
            previous.isReadNotification != current.isReadNotification,
        builder: (context, state) {
          if (state.isFetching &&
              state.notificationList.notificationData.isEmpty) {
            return LoadingShimmer.logo(
              key: WidgetKeys.loaderImage,
            );
          }

          return ScrollList<NotificationData>(
            controller: ScrollController(),
            isLoading: state.isFetching,
            noRecordFoundWidget: const NoRecordFound(
              key: WidgetKeys.notificationNotFoundRecordKey,
              title: 'No notifications to show',
              subTitle: 'We\'ll notify you when there is something',
              svgImage: SvgImage.notification,
            ),
            itemBuilder: (context, index, item) => _NotificationList(
              key: WidgetKeys.genericKey(key: item.description),
              notificationData: item,
            ),
            items: state.notificationList.notificationData,
            onRefresh: () => context
                .read<NotificationBloc>()
                .add(const NotificationEvent.fetch()),
            onLoadingMore: () => context
                .read<NotificationBloc>()
                .add(const NotificationEvent.loadMore()),
          );
        },
      ),
    );
  }
}
