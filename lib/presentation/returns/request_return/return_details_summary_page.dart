import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item.dart';

import 'package:ezrxmobile/presentation/core/balance_text_row.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/application/returns/return_price/return_price_bloc.dart';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';

import 'package:ezrxmobile/application/returns/submit_return/submit_return_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/core/snackbar.dart';

import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

import 'package:ezrxmobile/presentation/returns/return_summary_details/section/attachments_section.dart';

class RequestReturnDetailsSummaryPage extends StatelessWidget {
  const RequestReturnDetailsSummaryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final returnRequestState = context.read<RequestReturnBloc>().state;

    return BlocListener<SubmitReturnBloc, SubmitReturnState>(
      listenWhen: (previous, current) =>
          previous.requestID != current.requestID ||
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            if (state.messages.isNotEmpty) {
              showSnackBar(
                context: context,
                message: state.messages,
              );

              return;
            }
            context.router.pushAndPopUntil(
              const ReturnRequestSuccessPageRoute(),
              predicate: (route) =>
                  route.settings.name == 'HomeNavigationTabbarRoute',
            );

            context
                .read<RequestReturnBloc>()
                .add(const RequestReturnEvent.initializeSelectedReturnItems());
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);

              return;
            },
            (_) {},
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Request Return Summary').tr(),
          toolbarHeight: kToolbarHeight + 2.0,
        ),
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _ReturnItemSummaryTile(
                        returnItem:
                            returnRequestState.selectedReturnItems[index],
                      ),
                      childCount: returnRequestState.selectedReturnItems.length,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: _ReturnRequestNotes(),
                  ),
                ],
              ),
            ),
            const _SubmitSection(),
          ],
        ),
      ),
    );
  }
}

class _ReturnItemSummaryTile extends StatelessWidget {
  const _ReturnItemSummaryTile({
    Key? key,
    required this.returnItem,
  }) : super(key: key);

  final ReturnItem returnItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: custom.ExpansionTile(
          initiallyExpanded: true,
          threeLineTitle: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                returnItem.materialNumber.displayMatNo,
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.kPrimaryColor,
                    ),
              ),
              Text(
                returnItem.materialDescription,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          children: [
            BalanceTextRow(
              keyText: 'Invoice Number',
              keyFlex: 4,
              valueFlex: 5,
              valueText: returnItem.assignmentNumber,
            ),
            BalanceTextRow(
              keyText: 'Return Quantity',
              keyFlex: 4,
              valueFlex: 5,
              valueText: returnItem.returnQuantity.getOrDefaultValue(''),
            ),
            const BalanceTextRow(
              keyText: 'Return Type',
              keyFlex: 4,
              valueFlex: 5,
              valueText: 'Return',
            ),
            BlocBuilder<ReturnPriceBloc, ReturnPriceState>(
              buildWhen: (previous, current) =>
                  previous.isFetching != current.isFetching,
              builder: (context, state) {
                return state.isFetching
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          key: const Key('price-loading'),
                          width: 40,
                          child: LoadingShimmer.tile(),
                        ),
                      )
                    : BalanceTextRow(
                        keyText: 'Return Value (w/o tax)',
                        keyFlex: 4,
                        valueFlex: 5,
                        valueText:
                            '${context.read<SalesOrgBloc>().state.configs.currency.getOrDefaultValue('').toUpperCase()} ${state.displayPrice(returnItem.uniqueId)}',
                      );
              },
            ),
            BalanceTextRow(
              keyText: 'Invoice Date',
              keyFlex: 4,
              valueFlex: 5,
              valueText: returnItem.createdDate.toValidDateTimeString,
            ),
            BalanceTextRow(
              keyText: 'Reason For Return',
              keyFlex: 4,
              valueFlex: 5,
              valueText: returnItem.usage.usageDescription,
            ),
            BalanceTextRow(
              keyText: 'Principal Code',
              keyFlex: 4,
              valueFlex: 5,
              valueText:
                  returnItem.principalData.principalCode.getOrDefaultValue(''),
            ),
            BalanceTextRow(
              keyText: 'Batch',
              keyFlex: 4,
              valueFlex: 5,
              valueText: returnItem.batch,
            ),
            BalanceTextRow(
              keyText: 'Expiry Date',
              keyFlex: 4,
              valueFlex: 5,
              valueText: returnItem.expiryDate.toValidDateTimeString,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ReturnSummaryDetailsAttachmentSection(
                attachmentsUploadMode: AttachmentsUploadMode.user,
                poDocuments: returnItem.poDocuments,
                keyFlex: 4,
                valueFlex: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubmitSection extends StatelessWidget {
  const _SubmitSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmitReturnBloc, SubmitReturnState>(
      buildWhen: (previous, current) =>
                  previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child:  ElevatedButton(
                      key: const ValueKey('goToSubmitReturnsPage'),
                      onPressed: () {
                        final eligibilityState =
                            context.read<EligibilityBloc>().state;
                        final requestReturnState =
                            context.read<RequestReturnBloc>().state;
                        context.read<SubmitReturnBloc>().add(
                              SubmitReturnEvent.submitReturnRequest(
                                returnItemsList:
                                    requestReturnState.selectedReturnItems,
                                user: eligibilityState.user,
                                salesOrg: eligibilityState.salesOrganisation,
                                customerCodeInfo: eligibilityState.customerCodeInfo,
                                returnReferenceNumber:
                                    requestReturnState.returnReferenceNumber,
                                specialInstructions:
                                    requestReturnState.specialInstructions,
                              ),
                            );
                      },
                      child: LoadingShimmer.withChild(
                        enabled: state.isSubmitting,
                        child: const Text('Submit').tr(),
                      ),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ReturnRequestNotes extends StatelessWidget {
  const _ReturnRequestNotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final requestReturnState = context.read<RequestReturnBloc>().state;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              'Return Request Notes',
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.black,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            BalanceTextRow(
              keyText: 'Return Reference Number',
              valueText: requestReturnState.returnReferenceNumber,
            ),
            BalanceTextRow(
              keyText: 'Special Instructions',
              valueText: requestReturnState.specialInstructions,
            ),
          ],
        ),
      ),
    );
  }
}
