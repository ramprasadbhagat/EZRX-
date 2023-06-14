import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return_filter/request_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/returns/request_return/request_return_filter_drawer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class RequestReturn extends StatelessWidget {
  const RequestReturn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Request Return').tr(),
        toolbarHeight: kToolbarHeight + 2.0,
        actions: <Widget>[Container()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<RequestReturnBloc, RequestReturnState>(
                  buildWhen: (previous, current) =>
                      previous.sortDirection != current.sortDirection,
                  builder: (context, state) {
                    return InkWell(
                      key: const Key('orderDateFilter'),
                      onTap: () {
                        context.read<RequestReturnBloc>().add(
                              RequestReturnEvent.sortByDate(
                                sortDirection: state.sortDirection == 'desc'
                                    ? 'asc'
                                    : 'desc',
                              ),
                            );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Expiry Date'.tr(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: ZPColors.kPrimaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            state.sortDirection == 'desc'
                                ? Icons.arrow_drop_down_outlined
                                : Icons.arrow_drop_up_outlined,
                            color: ZPColors.darkGray,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                BlocBuilder<RequestReturnFilterBloc, RequestReturnFilterState>(
                  buildWhen: (previous, current) =>
                      previous.requestReturnFilter.appliedFilterCount !=
                      current.requestReturnFilter.appliedFilterCount,
                  builder: (context, state) {
                    return FilterCountButton(
                      filterCount: state.requestReturnFilter.appliedFilterCount,
                      onTap: () {
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      endDrawer: const RequestReturnFilterDrawer(),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: const _WrapRequestReturnBody(),
      ),
    );
  }
}

class _WrapRequestReturnBody extends StatelessWidget {
  const _WrapRequestReturnBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestReturnFilterBloc, RequestReturnFilterState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting &&
              current.isSubmitting ||
          !scaffoldKey.currentState!.isEndDrawerOpen,
      listener: (context, state) {
        final hasCustomerCodeInfo = context
            .read<CustomerCodeBloc>()
            .state
            .customerCodeInfo
            .customerCodeSoldTo
            .isNotEmpty;
        final hasShipToInfo = context
            .read<ShipToCodeBloc>()
            .state
            .shipToInfo
            .shipToCustomerCode
            .isNotEmpty;
        if (hasCustomerCodeInfo && hasShipToInfo) {
          context.read<RequestReturnBloc>().add(
                RequestReturnEvent.fetch(
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  salesOrg:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  shipInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
                  requestReturnFilter: state.requestReturnFilter,
                ),
              );
        }
      },
      child: const _RequestReturnList(),
    );
  }
}

class _RequestReturnList extends StatelessWidget {
  const _RequestReturnList();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestReturnBloc, RequestReturnState>(
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
          previous.isLoading != current.isLoading ||
          previous.sortDirection != current.sortDirection,
      builder: (context, state) {

        return state.isLoading && state.returnItemList.isEmpty
            ? LoadingShimmer.logo(
                key: const Key('LoaderImage'),
              )
            : Column(
                children: [
                  _RequestReturnScrollList(state: state,),
                  BlocBuilder<RequestReturnBloc, RequestReturnState>(
                    buildWhen: (previous, current) =>
                        previous.returnItemList != current.returnItemList,
                    builder: (context, state) {
                      return state.selectedReturnItems.isNotEmpty
                          ? Container(
                            alignment: Alignment.center,
                              width: double.infinity,
                              padding: const EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 2.0,
                                    offset: Offset(0.0, 0.75),
                                  ),
                                ],
                                color: ZPColors.white,
                              ),
                              child: SafeArea(
                                child: ElevatedButton(
                                  key: const ValueKey(
                                      'goToReturnsDetailsPage',),
                                  onPressed: () {
                                    context.router.pushNamed(
                                      'request_return_details',
                                    );
                                  },
                                  child: const Text('Next').tr(),
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ],
              );
      },
    );
  }
}

class _RequestReturnScrollList extends StatelessWidget {
  const _RequestReturnScrollList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final RequestReturnState state;

  @override
  Widget build(BuildContext context) {
    final configs = context.read<SalesOrgBloc>().state.configs;

    return Expanded(
      child: ScrollList<ReturnItem>(
        emptyMessage: 'No Request for Return found'.tr(),
        controller: ScrollController(),
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
                  requestReturnFilter: context
                      .read<RequestReturnFilterBloc>()
                      .state
                      .requestReturnFilter,
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
                  requestReturnFilter: context
                      .read<RequestReturnFilterBloc>()
                      .state
                      .requestReturnFilter,
                ),
              );
        },
        isLoading: state.isLoading,
        itemBuilder: (context, index, item) =>
            _RequestReturnListItem(
          returnItem: item,
          configs: configs,
          index: index,
        ),
        items: state.returnItemList,
      ),
    );
  }
}

class _RequestReturnListItem extends StatelessWidget {
  const _RequestReturnListItem({
    Key? key,
    required this.returnItem,
    required this.configs,
    required this.index,
  }) : super(key: key);

  final ReturnItem returnItem;
  final SalesOrganisationConfigs configs;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        minLeadingWidth: 15.0,
        leading: SizedBox(
          width: 16,
          child: BlocBuilder<RequestReturnBloc, RequestReturnState>(
            buildWhen: (previous, current) =>
                previous.getReturnItem(returnItem.uniqueId) !=
                current.getReturnItem(returnItem.uniqueId),
            builder: (context, state) {
              return Checkbox(
                onChanged: (value) {
                  context.read<RequestReturnBloc>().add(
                        RequestReturnEvent.updateReturnDetails(
                          updatedItem: returnItem.copyWith(
                            isSelected: value!,
                            poDocuments: [],
                            returnQuantity: ReturnQuantity(''),
                            usage: Usage.empty(),
                          ),
                        ),
                      );
                },
                value: state.getReturnItem(returnItem.uniqueId).isSelected,
              );
            },
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              returnItem.materialNumber.displayMatNo.tr(),
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.kPrimaryColor,
                  ),
            ),
            Text(
              returnItem.materialDescription,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              '${returnItem.principalData.principalCode.getOrDefaultValue('')} - ${returnItem.principalData.principalName.name.tr()}',
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
              keyText: 'Invoice Date'.tr(),
              valueText: returnItem.createdDate.toValidDateString,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Expiry Date'.tr(),
              valueText: returnItem.expiryDate.toValidDateString,
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
