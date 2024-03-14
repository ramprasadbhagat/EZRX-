import 'package:ezrxmobile/application/payments/download_e_credit/download_e_credit_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/payments/widgets/new_payment_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_group.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';

part 'package:ezrxmobile/presentation/payments/all_credits/widgets/credit_group.dart';
part 'package:ezrxmobile/presentation/payments/all_credits/widgets/credit_item.dart';

final GlobalKey _allCreditScaffold = GlobalKey<ScaffoldState>();

class AllCreditsPage extends StatefulWidget {
  const AllCreditsPage({Key? key}) : super(key: key);

  @override
  State<AllCreditsPage> createState() => _AllCreditsPageState();
}

class _AllCreditsPageState extends State<AllCreditsPage> {
  final _controller = ScrollController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _allCreditScaffold,
      body: AnnouncementBanner(
        key: WidgetKeys.allCreditsPage,
        currentPath: context.router.currentPath,
        child: Column(
          children: [
            BlocConsumer<AllCreditsBloc, AllCreditsState>(
              listenWhen: (previous, current) =>
                  previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption,
              listener: (BuildContext context, state) {
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
                  previous.isLoading != current.isLoading,
              builder: (context, state) {
                return Expanded(
                  child: state.isLoading && state.items.groupList.isEmpty
                      ? LoadingShimmer.logo(
                          key: WidgetKeys.loaderImage,
                        )
                      : ScrollList<CreditAndInvoiceGroup>(
                          noRecordFoundWidget: const NoRecordFound(
                            title: 'No credit found',
                          ),
                          controller: _controller,
                          onRefresh: () => context.read<AllCreditsBloc>().add(
                                AllCreditsEvent.fetch(
                                  appliedFilter: AllCreditsFilter.empty(),
                                ),
                              ),
                          onLoadingMore: () =>
                              context.read<AllCreditsBloc>().add(
                                    const AllCreditsEvent.loadMore(),
                                  ),
                          isLoading: state.isLoading,
                          itemBuilder: (context, index, item) => _CreditGroup(
                            data: item,
                            showDivider: index != 0,
                          ),
                          items: state.items.groupList,
                        ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: NewPaymentButton.scale(
        controller: _controller,
      ),
    );
  }
}
