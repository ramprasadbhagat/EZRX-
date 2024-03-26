part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class InvoiceNumberSection extends StatelessWidget {
  final String invoiceNumber;

  const InvoiceNumberSection({Key? key, required this.invoiceNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enablePayment =
        context.read<EligibilityBloc>().state.isPaymentEnabled;

    return Row(
      children: [
        Expanded(
          child: Text(
            '${context.tr('Invoice number')}: ',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
        ),
        invoiceNumber.isNotEmpty
            ? BlocProvider(
                create: (context) => locator<AllInvoicesBloc>()
                  ..add(
                    AllInvoicesEvent.initialized(
                      salesOrganisation: context
                          .read<EligibilityBloc>()
                          .state
                          .salesOrganisation,
                      customerCodeInfo: context
                          .read<EligibilityBloc>()
                          .state
                          .customerCodeInfo,
                    ),
                  ),
                child: BlocConsumer<AllInvoicesBloc, AllInvoicesState>(
                  buildWhen: (previous, current) =>
                      previous.isLoading != current.isLoading,
                  listenWhen: (previous, current) =>
                      previous.failureOrSuccessOption !=
                      current.failureOrSuccessOption,
                  listener: (context, state) {
                    state.failureOrSuccessOption.fold(
                      () => {},
                      (option) => option.fold(
                        (failure) =>
                            ErrorUtils.handleApiFailure(context, failure),
                        (_) {
                          if (state.items.isNotEmpty) {
                            context.read<CreditAndInvoiceDetailsBloc>().add(
                                  CreditAndInvoiceDetailsEvent.fetch(
                                    creditAndInvoiceItem: state.items.first,
                                  ),
                                );
                            context.router.push(
                              const InvoiceDetailsPageRoute(),
                            );
                          }
                        },
                      ),
                    );
                  },
                  builder: (context, state) {
                    return Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Text(
                            invoiceNumber,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: ZPColors.white,
                                ),
                          ),
                          state.isLoading
                              ? Align(
                                  alignment: Alignment.center,
                                  child: LoadingAnimationWidget
                                      .horizontalRotatingDots(
                                    key: WidgetKeys
                                        .viewByItemsOrderDetailsInvoiceNumberLoading,
                                    color: ZPColors.attachmentColor,
                                    size: 20,
                                  ),
                                )
                              : enablePayment
                                  ? IconButton(
                                      key: WidgetKeys
                                          .viewByItemsOrderDetailsInvoiceNumberButton,
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      onPressed: () =>
                                          context.read<AllInvoicesBloc>().add(
                                                AllInvoicesEvent.fetch(
                                                  appliedFilter:
                                                      AllInvoicesFilter.empty()
                                                          .copyWith(
                                                    searchKey:
                                                        SearchKey.searchFilter(
                                                      invoiceNumber,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      icon: const Icon(
                                        Icons.open_in_new,
                                        color: ZPColors.attachmentColor,
                                        size: 20,
                                      ),
                                    )
                                  : const SizedBox(),
                        ],
                      ),
                    );
                  },
                ),
              )
            : Expanded(
                child: Text(
                  'NA',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
              ),
      ],
    );
  }
}
