import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/filter/available_credit_payment_filter_page.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/widgets/credit_item_card.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

class AvailableCreditsTab extends StatelessWidget {
  const AvailableCreditsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Row(
            children: [
              Expanded(
                child: SearchBar(
                  onSearchChanged: (String value) {},
                  clearIconKey: WidgetKeys.clearIconKey,
                  controller: TextEditingController(),
                  onClear: () {},
                ),
              ),
              _FilterTune(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: ZPColors.lightGreen,
          ),
          child: Row(
            children: [
              Text(
                'Available credits: '.tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ZPColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              PriceComponent(
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price: context
                    .read<AccountSummaryBloc>()
                    .state
                    .creditLimit
                    .creditBalance
                    .getOrDefaultValue('0'),
              ),
            ],
          ),
        ),
        BlocConsumer<AvailableCreditsBloc, AvailableCreditsState>(
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
            return Expanded(
              child: state.isLoading && state.items.isEmpty
                  ? LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ScrollList<CustomerOpenItem>(
                        noRecordFoundWidget: NoRecordFound(
                          title: 'No record found'.tr(),
                        ),
                        controller: ScrollController(),
                        onRefresh: () {
                          context.read<AvailableCreditsBloc>().add(
                                AvailableCreditsEvent.fetch(
                                  salesOrganisation: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrganisation,
                                  customerCodeInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .customerCodeInfo,
                                  appliedFilter: AvailableCreditFilter.empty(),
                                ),
                              );
                        },
                        onLoadingMore: () {
                          context.read<AvailableCreditsBloc>().add(
                                AvailableCreditsEvent.loadMore(
                                  salesOrganisation: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrganisation,
                                  customerCodeInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .customerCodeInfo,
                                ),
                              );
                        },
                        isLoading: state.isLoading,
                        itemBuilder: (context, index, item) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: _PaymentItem(
                            data: item,
                          ),
                        ),
                        items: state.items,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _PaymentItem extends StatelessWidget {
  const _PaymentItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CustomerOpenItem data;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: BlocBuilder<NewPaymentBloc, NewPaymentState>(
        builder: (context, state) {
          return EdgeCheckbox(
            onChanged: (bool value) => context.read<NewPaymentBloc>().add(
                  NewPaymentEvent.toggleCredit(selected: value, item: data),
                ),
            value: state.selectedCredits.contains(data),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CreditItemCard(customerOpenItem: data),
            ),
          );
        },
      ),
    );
  }
}

class _FilterTune extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableCreditsBloc, AvailableCreditsState>(
      builder: (context, state) {
        return CustomBadge(
          Icons.tune,
          count: state.appliedFilter.appliedFilterCount,
          badgeColor: ZPColors.orange,
          onPressed: () =>
              !state.isLoading ? _showFilterPage(context: context) : null,
        );
      },
    );
  }

  void _showFilterPage({required BuildContext context}) {
    context.read<AvailableCreditFilterBloc>().add(
          AvailableCreditFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter:
                context.read<AvailableCreditsBloc>().state.appliedFilter,
          ),
        );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return const AvailableCreditPaymentFilterPage();
      },
    ).then(
      (value) {
        if (value == null) return;
        final newFilter = value as AvailableCreditFilter;
        final alreadyAppliedFilter =
            context.read<AvailableCreditsBloc>().state.appliedFilter;
        if (newFilter != alreadyAppliedFilter) {
          context.read<AvailableCreditsBloc>().add(
                AvailableCreditsEvent.fetch(
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  appliedFilter: newFilter,
                ),
              );
        }
      },
    );
  }
}
