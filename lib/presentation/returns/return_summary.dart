import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary/return_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnSummary extends StatelessWidget {
  const ReturnSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('return_summary');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Return Summary').tr(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Filter'.tr(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: ZPColors.kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ).tr(),
                Stack(
                  children: const <Widget>[
                    FittedBox(
                      child: Icon(
                        Icons.filter_alt,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocConsumer<ReturnSummaryBloc, ReturnSummaryState>(
        listenWhen: (previous, current) {
          return previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption ||
              (previous.isLoading != current.isLoading);
        },
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
            previous.isLoading != current.isLoading ||
            previous.returnSummaryList != current.returnSummaryList,
        builder: (context, returnSummaryState) {
          final configs = context.read<SalesOrgBloc>().state.configs;

          if (returnSummaryState.isLoading) {
            return LoadingShimmer.logo(
              key: const Key('LoaderImage'),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ScrollList<ReturnSummaryRequestInformation>(
                  emptyMessage: 'You have not submitted any return request',
                  onRefresh: () {
                    context.read<ReturnSummaryBloc>().add(
                          ReturnSummaryEvent.fetch(
                            user: context.read<UserBloc>().state.user,
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            shipToInfo:
                                context.read<ShipToCodeBloc>().state.shipToInfo,
                          ),
                        );
                  },
                  onLoadingMore: () {
                    context.read<ReturnSummaryBloc>().add(
                          ReturnSummaryEvent.loadMore(
                            user: context.read<UserBloc>().state.user,
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            shipToInfo:
                                context.read<ShipToCodeBloc>().state.shipToInfo,
                          ),
                        );
                  },
                  isLoading: returnSummaryState.isLoading,
                  itemBuilder: (context, index, item) => ReturnSummaryListItem(
                    returnSummaryRequestInformation: item,
                    configs: configs,
                  ),
                  items: returnSummaryState.returnSummaryList,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ReturnSummaryListItem extends StatelessWidget {
  const ReturnSummaryListItem({
    Key? key,
    required this.returnSummaryRequestInformation,
    required this.configs,
  }) : super(key: key);
  final ReturnSummaryRequestInformation returnSummaryRequestInformation;
  final SalesOrganisationConfigs configs;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    returnSummaryRequestInformation.requestHeader.requestId,
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.kPrimaryColor,
                        ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: returnSummaryRequestInformation
                          .requestHeader.status.displayStatusLabelColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      returnSummaryRequestInformation
                          .requestInfo.first.status.displayStatus,
                      style: TextStyle(
                        color: returnSummaryRequestInformation
                            .requestInfo.first.status.displayStatusTextColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceTextRow(
              keyText: 'Submitted Date'.tr(),
              valueText: returnSummaryRequestInformation
                  .requestHeader.createdDate.toValidDateString,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Refund Total (w/o tax)'.tr(),
              valueText: StringUtils.displayPrice(
                configs,
                returnSummaryRequestInformation.requestHeader.refundTotal,
              ),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Material Name'.tr(),
              valueText: returnSummaryRequestInformation
                  .requestInfo.first.materialDescription,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Return Quantity'.tr(),
              valueText: returnSummaryRequestInformation
                  .requestInfo.first.returnQuantity,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Unit Price (w/o tax) '.tr(),
              valueText: StringUtils.displayPrice(
                configs,
                returnSummaryRequestInformation.requestInfo.first.unitPrice,
              ),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Total Price (w/o tax) '.tr(),
              valueText: StringUtils.displayPrice(
                configs,
                returnSummaryRequestInformation.requestInfo.first.totalPrice,
              ),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Status'.tr(),
              valueText: returnSummaryRequestInformation
                  .requestInfo.first.status.displayStatusInList,
              keyFlex: 1,
              valueFlex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
