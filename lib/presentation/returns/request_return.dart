import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
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

class RequestReturn extends StatelessWidget {
  const RequestReturn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('request_return');

    return Scaffold(
      appBar: AppBar(title: const Text('Request Return').tr()),
      body: BlocConsumer<RequestReturnBloc, RequestReturnState>(
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
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          final configs = context.read<SalesOrgBloc>().state.configs;

          return state.isLoading && state.returnItemList.isEmpty
              ? LoadingShimmer.logo(
                  key: const Key('LoaderImage'),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ScrollList<ReturnItem>(
                        emptyMessage: 'No Request for Return found',
                        onRefresh: () {
                          context.read<RequestReturnBloc>().add(
                                RequestReturnEvent.fetch(
                                  salesOrg: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrganisation,
                                  shipInfo: context
                                      .read<ShipToCodeBloc>()
                                      .state
                                      .shipToInfo,
                                  customerCodeInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .customerCodeInfo,
                                ),
                              );
                        },
                        onLoadingMore: () {
                          context.read<RequestReturnBloc>().add(
                                RequestReturnEvent.loadMore(
                                  salesOrg: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrganisation,
                                  shipInfo: context
                                      .read<ShipToCodeBloc>()
                                      .state
                                      .shipToInfo,
                                  customerCodeInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .customerCodeInfo,
                                ),
                              );
                        },
                        isLoading: state.isLoading,
                        itemBuilder: (context, index, item) =>
                            _RequestReturnListItem(
                          returnItem: item,
                          configs: configs,
                        ),
                        items: state.returnItemList,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

class _RequestReturnListItem extends StatelessWidget {
  const _RequestReturnListItem({
    Key? key,
    required this.returnItem,
    required this.configs,
  }) : super(key: key);

  final ReturnItem returnItem;
  final SalesOrganisationConfigs configs;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              returnItem.materialNumber.displayMatNo,
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.kPrimaryColor,
                  ),
            ),
            Text(
              returnItem.materialDescription,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              '${returnItem.principalData.principalCode.getOrDefaultValue('')} - ${returnItem.principalData.principalName}',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.darkGray,
                  ),
            ),
            const Divider(
              height: 15,
              indent: 0,
              endIndent: 0,
            ),
            BalanceTextRow(
              keyText: 'Invoice Number'.tr(),
              valueText: returnItem.assignmentNumber,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Batch'.tr(),
              valueText: returnItem.batch,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Created Date'.tr(),
              valueText: returnItem.createdDate.displayHumanReadableDate,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Expiry Date'.tr(),
              valueText: returnItem.expiryDate.displayHumanReadableDate,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Unit Price'.tr(),
              valueText:
                  StringUtils.displayPrice(configs, returnItem.unitPrice),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Total Price'.tr(),
              valueText: StringUtils.displayPrice(
                configs,
                returnItem.unitPrice * returnItem.targetQuantity,
              ),
              keyFlex: 1,
              valueFlex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
