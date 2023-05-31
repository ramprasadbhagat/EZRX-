import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
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
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<PaymentAdviceFooterBloc, PaymentAdviceFooterState>(
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
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return state.isFetching
                ? LoadingShimmer.logo(
                    key: const Key('loaderImage'),
                  )
                : ScrollList<PaymentAdviceFooter>(
              emptyMessage: 'No Payment Advice Footer Found'.tr(),
              onRefresh: () => context.read<PaymentAdviceFooterBloc>().add(
                    const PaymentAdviceFooterEvent.fetch(),
                  ),
              onLoadingMore: () => {},
              isLoading: state.isFetching,
              itemBuilder: (context, index, item) =>
                  _PaymentAdviceFooter(paymentAdviceFooter: item),
              items: state.paymentAdviceFooters,
            );
          },
        ),
      ),
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
                onPressed: (context) {},
              ),
            ],
            child: ListTile(
              onTap: () {},
              title: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: paymentAdviceFooter.headerLogoPath.isNotEmpty
                            ? Image.network(
                                paymentAdviceFooter.headerLogoPath,
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
                                        valueText: paymentAdviceFooter.header,
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
                                        valueText:
                                            paymentAdviceFooter.salesDistrict,
                                        keyFlex: 3,
                                        valueFlex: 4,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  padding: const EdgeInsets.only(right: 0),
                                  constraints: const BoxConstraints(),
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
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
                                        paymentAdviceFooter.footer,
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
                data: paymentAdviceFooter.pleaseNote,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
