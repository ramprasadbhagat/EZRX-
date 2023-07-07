import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune,
                ),
              ),
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
                    .displayStringValue,
                currencyCodeTextStyle:
                    Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ZPColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                priceTextStyle:
                    Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ZPColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
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
              child: Padding(
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
            onChanged: (bool value) {
              context.read<NewPaymentBloc>().add(
                    NewPaymentEvent.toggleCredit(selected: value, item: data),
                  );
            },
            value: state.selectedCredits.contains(data),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListTile(
                onTap: () {},
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${data.postingKeyName} #${data.accountingDocument}',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          data.netDueDate.toValidDateString,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkGray,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.documentReferenceID,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          PriceComponent(
                            salesOrgConfig:
                                context.read<SalesOrgBloc>().state.configs,
                            price: data.amountInTransactionCurrency.toString(),
                            currencyCodeTextStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: ZPColors.primary,
                                ),
                            priceTextStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: ZPColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
