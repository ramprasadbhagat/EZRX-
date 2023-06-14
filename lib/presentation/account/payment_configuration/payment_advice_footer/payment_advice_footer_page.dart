import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class PaymentAdviceFooterPage extends StatelessWidget {
  const PaymentAdviceFooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const ValueKey('paymentAdviceFooterAppBar'),
        title: const Text(
          'Payment Advice Footer',
        ).tr(),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addPaymentAdviceFooterKey'),
        onPressed: () {
          context.read<ManagePaymentAdviceFooterBloc>().add(
                ManagePaymentAdviceFooterEvent.setPaymentAdvice(
                  paymentAdviceFooterData: PaymentAdviceFooter.empty(),
                ),
              );
          context.router.pushNamed('payments/advice_footer/add_advice_footer');
        },
        child: const Icon(Icons.add),
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: const _PaymentAdviceFooterScrollList(),
      ),
    );
  }
}

class _PaymentAdviceFooterScrollList extends StatelessWidget {
  const _PaymentAdviceFooterScrollList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManagePaymentAdviceFooterBloc,
        ManagePaymentAdviceFooterState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            if (state.isSubmitting) return;
            showSnackBar(
              context: context,
              message: state.response.message.getValue().tr(),
            );
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
        },
        buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting || 
          previous.isFetching != current.isFetching,
        builder: (context, state) {
        return ScrollList<PaymentAdviceFooter>(
          emptyMessage: 'No Payment Advice Footer Found'.tr(),
          controller: ScrollController(),
          onRefresh: () =>
              context.read<ManagePaymentAdviceFooterBloc>().add(
                    const ManagePaymentAdviceFooterEvent.fetch(),
                  ),
          onLoadingMore: () => {},
          isLoading: state.isFetching,
          itemBuilder: (context, index, item) =>
              _PaymentAdviceFooter(paymentAdviceFooter: item),
          items: state.paymentAdviceFooters,
        );
      },
    );
  }
}

class _PaymentAdviceFooter extends StatelessWidget {
  const _PaymentAdviceFooter({
    Key? key,
    required this.paymentAdviceFooter,
  }) : super(key: key);

  final PaymentAdviceFooter paymentAdviceFooter;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CustomSlidable(
            endActionPaneActions: [
              CustomSlidableAction(
                label: 'Delete'.tr(),
                icon: Icons.delete_outline,
                onPressed: (_) =>
                    context.read<ManagePaymentAdviceFooterBloc>().add(
                          ManagePaymentAdviceFooterEvent.delete(
                  paymentAdviceFooter: paymentAdviceFooter,
                ),
              ),
              ),
            ],
            child: ListTile(
              onTap: () {
                context.read<ManagePaymentAdviceFooterBloc>().add(
                      ManagePaymentAdviceFooterEvent.setPaymentAdvice(
                        paymentAdviceFooterData: paymentAdviceFooter,
                      ),
                    );
                context.router
                    .pushNamed('payments/advice_footer/edit_advice_footer');
              },
              title: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: paymentAdviceFooter.hasPaymentAdviceLogoUri
                            ? Image.network(
                                paymentAdviceFooter
                                    .paymentAdviceLogo.logoNetworkFile.url
                                    .getOrDefaultValue(''),
                                fit: BoxFit.fitWidth,
                                gaplessPlayback: true,
                                errorBuilder: (context, error, stackTrace) =>
                                    const SizedBox(
                                  height: 60,
                                  width: 60,
                                ),
                                width: 60,
                                height: 60,
                              )
                            : const SizedBox(
                                height: 60,
                                width: 60,
                              ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      BalanceTextRow(
                                        keyText: 'Header'.tr(),
                                        valueText: paymentAdviceFooter.header
                                            .getOrDefaultValue(''),
                                        keyFlex: 3,
                                        valueFlex: 4,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                        ),
                                        child: BalanceTextRow(
                                          keyText: 'Sales Org'.tr(),
                                          valueText: paymentAdviceFooter
                                              .salesOrg
                                              .getOrDefaultValue(''),
                                          keyFlex: 3,
                                          valueFlex: 4,
                                        ),
                                      ),
                                      BalanceTextRow(
                                        keyText: 'Sales District'.tr(),
                                        valueText: paymentAdviceFooter
                                            .salesDistrict
                                            .salesDistrictHeader
                                            .displayLabel,
                                        keyFlex: 3,
                                        valueFlex: 4,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  iconSize: 24.0,
                                  icon: paymentAdviceFooter.isDeleteInProgress
                                      ? const SizedBox(
                                          height: 20.0,
                                          width: 20.0,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.0,
                                          ),
                                        )
                                      : const Icon(
                                          Icons.delete,
                                          key: Key('deleteKey'),
                                        ),
                                  onPressed:
                                      paymentAdviceFooter.isDeleteInProgress
                                          ? null
                                          : () => _deleteDialog(
                                                context: context,
                                                paymentAdviceFooter:
                                                    paymentAdviceFooter,
                                              ),
                                ),
                              ],
                            ),
                            custom.ExpansionTile(
                              title: Text(
                                'Footer content'.tr(),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        paymentAdviceFooter.footer
                                            .getOrDefaultValue(''),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.apply(
                                              color: ZPColors.darkGray,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            _PleaseNote(
                              paymentAdviceFooter: paymentAdviceFooter,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _deleteDialog({
    required BuildContext context,
    required PaymentAdviceFooter paymentAdviceFooter,
  }) {
    CustomDialogs.confirmationDialog(
      context: context,
      title: 'Delete Payment Advice'.tr(),
      message: 'Are you sure you want to delete?'.tr(),
      onAcceptPressed: () async =>
          context.read<ManagePaymentAdviceFooterBloc>().add(
                ManagePaymentAdviceFooterEvent.delete(
                  paymentAdviceFooter: paymentAdviceFooter,
                ),
              ),
      confirmText: 'Delete',
    );
  }
}

class _PleaseNote extends StatelessWidget {
  const _PleaseNote({
    Key? key,
    required this.paymentAdviceFooter,
  }) : super(key: key);
  final PaymentAdviceFooter paymentAdviceFooter;

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      title: Text(
        'Please Note'.tr(),
        style: Theme.of(context).textTheme.titleSmall,
      ),
      children: [
        Row(
          children: [
            Expanded(
              child: Html(
                data: paymentAdviceFooter.pleaseNote.getOrDefaultValue(''),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
