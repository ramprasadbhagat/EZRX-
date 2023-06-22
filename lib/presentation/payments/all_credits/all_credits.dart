import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_group.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';

class AllCredits extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  AllCredits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Credits').tr(),
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocListener<AllCreditsFilterBloc, AllCreditsFilterState>(
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
              context.read<AllCreditsBloc>()
                ..add(const AllCreditsEvent.initialized())
                ..add(
                  AllCreditsEvent.fetchAllCreditsList(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    allCreditsFilter: context
                        .read<AllCreditsFilterBloc>()
                        .state
                        .allCreditsFilter,
                  ),
                );
            }
          },
          child: BlocConsumer<AllCreditsBloc, AllCreditsState>(
            listenWhen: (previous, current) {
              return previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption;
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
                previous.credits != current.credits,
            builder: (context, allCreditsState) {
              if (allCreditsState.isLoading &&
                  allCreditsState.credits.isEmpty) {
                return LoadingShimmer.logo(
                  key: const Key('LoaderImage'),
                );
              }

              return Column(
                children: [
                  // Place left for search and filter
                  _CreditsScrollList(
                    allCreditsState: allCreditsState,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CreditsScrollList extends StatelessWidget {
  const _CreditsScrollList({
    Key? key,
    required this.allCreditsState,
  }) : super(key: key);

  final AllCreditsState allCreditsState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollList<CreditAndInvoiceGroup>(
        emptyMessage: 'No files found'.tr(),
        controller: ScrollController(),
        onRefresh: () {
          context.read<AllCreditsFilterBloc>().add(
                const AllCreditsFilterEvent.initialized(),
              );
          context.read<AllCreditsFilterBloc>().add(
                AllCreditsFilterEvent.fetch(
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                ),
              );
          context.read<AllCreditsBloc>().add(
                AllCreditsEvent.fetchAllCreditsList(
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  allCreditsFilter: AllCreditsFilter.empty(),
                ),
              );
        },
        onLoadingMore: () {
          context.read<AllCreditsBloc>().add(
                AllCreditsEvent.loadMoreAllCreditsList(
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  allCreditsFilter: context
                      .read<AllCreditsFilterBloc>()
                      .state
                      .allCreditsFilter,
                ),
              );
        },
        isLoading: allCreditsState.isLoading,
        itemBuilder: (context, index, item) => _CreditGroup(
          data: item,
          showDivider: index != 0,
        ),
        items: allCreditsState.credits.creditListGroup,
      ),
    );
  }
}

class _CreditGroup extends StatelessWidget {
  final CreditAndInvoiceGroup data;
  final bool showDivider;
  const _CreditGroup({
    Key? key,
    required this.data,
    required this.showDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Documents created on ${data.dueDate.toValidDateString}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              Column(
                children: data.invoiceItems
                    .map(
                      (e) => _CreditsItem(creditItem: e),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CreditsItem extends StatelessWidget {
  const _CreditsItem({
    Key? key,
    required this.creditItem,
  }) : super(key: key);

  final CreditAndInvoiceItem creditItem;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${creditItem.accountingDocumentType} #${creditItem.accountingDocument}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            StatusLabel(
              status: StatusType(
                creditItem.invoiceProcessingStatus.getOrDefaultValue(''),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                creditItem.postingKeyName,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                StringUtils.displayPrice(
                  context.read<SalesOrgBloc>().state.configs,
                  creditItem.convertIfAmountInTransactionCurrencyIsNegative,
                ),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
