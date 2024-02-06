import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/entities/soa_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_month_picker.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/payments/widgets/new_payment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:ezrxmobile/presentation/core/value_range_error.dart';

part 'widgets/soa_tile.dart';
part 'widgets/filter_bottom_sheet.dart';
part 'widgets/header.dart';
part 'widgets/filter_button.dart';

class StatementAccountsPage extends StatefulWidget {
  const StatementAccountsPage({Key? key}) : super(key: key);

  @override
  State<StatementAccountsPage> createState() => _StatementAccountsPageState();
}

class _StatementAccountsPageState extends State<StatementAccountsPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.soaPage,
      appBar: CustomAppBar.commonAppBar(
        title: Text(
          context.tr('Statement of accounts'),
        ),
        customerBlocked:
            context.read<EligibilityBloc>().state.shipToInfo.customerBlock,
      ),
      floatingActionButton: NewPaymentButton.scale(
        controller: _scrollController,
      ),
      body: BlocConsumer<SoaBloc, SoaState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.filterList != current.filterList,
        builder: (context, state) {
          final eligibilityState = context.read<EligibilityBloc>().state;

          return AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: ScrollList<Soa>(
              header: Column(
                children: const [
                  _Header(),
                  _Filter(),
                ],
              ),
              noRecordFoundWidget: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06,
                ),
                child: const NoRecordFound(
                  key: WidgetKeys.soaNotFoundRecordKey,
                  title: 'No statements available',
                  subTitle: '',
                  svgImage: SvgImage.emptyBox,
                ),
              ),
              controller: _scrollController,
              onRefresh: () => context.read<SoaBloc>().add(
                    SoaEvent.fetch(
                      customerCodeInfo: eligibilityState.customerCodeInfo,
                      salesOrg: eligibilityState.salesOrg,
                    ),
                  ),
              onLoadingMore:
                  () {}, // Need to remove this as thisSoaBloc has no onLoadingMore function
              isLoading: state.isFetching,
              itemBuilder: (context, index, itemInfo) {
                return _SoaTile(
                  key: WidgetKeys.genericKey(key: 'SoaItem#$index'),
                  soa: itemInfo,
                );
              },
              items: state.filterList,
            ),
          );
        },
      ),
    );
  }
}
