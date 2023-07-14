import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSummary extends StatelessWidget {
  const AccountSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Summary').tr(),
        centerTitle: false,
      ),
      body: Column(
        children: [
          AnnouncementWidget(
            currentPath: context.router.currentPath,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                AllInvoicesPageRoute(),
                AllCreditsPageRoute(),
              ],
              builder: (context, child, tabController) => Column(
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: [
                      Tab(
                        key: WidgetKeys.invoiceTab,
                        text: 'Invoice'.tr(),
                      ),
                      Tab(
                        key: WidgetKeys.creditsTab,
                        text: 'Credits'.tr(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20.0,
                      20.0,
                      20.0,
                      0.0,
                    ),
                    child: Row(
                      children: [
                        _SearchBar(
                          isInvoiceTabActive: context.tabsRouter.current.name ==
                              AllInvoicesPageRoute.name,
                        ),
                        _FilterTuneIcon(
                          isInvoiceTabActive: context.tabsRouter.current.name ==
                              AllInvoicesPageRoute.name,
                        ),
                        _Export(
                          isInvoiceTabActive: context.tabsRouter.current.name ==
                              AllInvoicesPageRoute.name,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  final bool isInvoiceTabActive;
  const _SearchBar({
    Key? key,
    required this.isInvoiceTabActive,
  }) : super(key: key);

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final TextEditingController _itemSearchController = TextEditingController();

  @override
  void dispose() {
    _itemSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _itemSearchController.text = widget.isInvoiceTabActive
        ? context
            .read<AllInvoicesBloc>()
            .state
            .appliedFilter
            .searchKey
            .getOrDefaultValue('')
        : '';

    return widget.isInvoiceTabActive
        ? BlocConsumer<AllInvoicesBloc, AllInvoicesState>(
            buildWhen: (previous, current) =>
                current.isLoading != previous.isLoading,
            listenWhen: (previous, current) =>
                previous.appliedFilter.searchKey !=
                current.appliedFilter.searchKey,
            listener: (context, state) {
              final searchText = state.appliedFilter.searchKey.getValue();
              _itemSearchController.value = TextEditingValue(
                text: searchText,
                selection: TextSelection.collapsed(
                  offset: _itemSearchController.selection.base.offset,
                ),
              );
            },
            builder: (context, state) {
              return _SummarySearchBar(
                isEnable: !state.isLoading,
                controller: _itemSearchController,
                isInvoiceTabActive: widget.isInvoiceTabActive,
              );
            },
          )
        : BlocConsumer<AllCreditsBloc, AllCreditsState>(
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading,
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              _itemSearchController.value = TextEditingValue(
                text: '',
                selection: TextSelection.collapsed(
                  offset: _itemSearchController.selection.base.offset,
                ),
              );
            },
            builder: (context, state) {
              return _SummarySearchBar(
                isEnable: !state.isLoading,
                controller: _itemSearchController,
                isInvoiceTabActive: widget.isInvoiceTabActive,
              );
            },
          );
  }
}

class _SummarySearchBar extends StatelessWidget {
  final bool isEnable;
  final bool isInvoiceTabActive;
  final TextEditingController controller;
  const _SummarySearchBar({
    Key? key,
    required this.isEnable,
    required this.controller,
    required this.isInvoiceTabActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: SearchBar(
        controller: controller,
        enabled: isEnable,
        onSearchChanged: (value) {},
        isAutoSearch: false,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onSearchSubmitted: (value) {
          isInvoiceTabActive
              ? _fetchInvoice(
                  context: context,
                  searchKey: value,
                )
              : null;
        },
        clearIconKey: WidgetKeys.clearIconKey,
        customValidator: () => SearchKey.search(controller.text).isValid(),
        onClear: () {
          if (controller.text.isEmpty) return;
          controller.clear();
          isInvoiceTabActive
              ? _fetchInvoice(
                  context: context,
                  searchKey: '',
                )
              : null;
        },
        border: InputBorder.none,
      ),
    );
  }

  void _fetchInvoice({
    required BuildContext context,
    required String searchKey,
  }) {
    final appliedFilter = context.read<AllInvoicesBloc>().state.appliedFilter;
    if (appliedFilter.searchKey == SearchKey(searchKey)) return;

    context.read<AllInvoicesBloc>().add(
          AllInvoicesEvent.fetch(
            appliedFilter: appliedFilter.copyWith(
              searchKey: SearchKey(searchKey),
            ),
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
          ),
        );
  }
}

class _FilterTuneIcon extends StatelessWidget {
  final bool isInvoiceTabActive;
  const _FilterTuneIcon({
    Key? key,
    required this.isInvoiceTabActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isInvoiceTabActive
        ? BlocBuilder<AllInvoicesBloc, AllInvoicesState>(
            buildWhen: (previous, current) =>
                previous.appliedFilter.appliedFilterCount !=
                    current.appliedFilter.appliedFilterCount ||
                previous.isLoading != current.isLoading,
            builder: (context, state) {
              return _FilterElement(
                isActive: !context.read<AllInvoicesBloc>().state.isLoading,
                appliedFilterCount: context
                    .read<AllInvoicesBloc>()
                    .state
                    .appliedFilter
                    .appliedFilterCount,
              );
            },
          )
        : BlocBuilder<AllCreditsBloc, AllCreditsState>(
            buildWhen: (previous, current) =>
                previous.appliedFilter.appliedFilterCount !=
                    current.appliedFilter.appliedFilterCount ||
                previous.isLoading != current.isLoading,
            builder: (context, state) {
              return _FilterElement(
                isActive: !context.read<AllCreditsBloc>().state.isLoading,
                appliedFilterCount: context
                    .read<AllCreditsBloc>()
                    .state
                    .appliedFilter
                    .appliedFilterCount,
              );
            },
          );
  }
}

class _FilterElement extends StatelessWidget {
  const _FilterElement({
    Key? key,
    required this.isActive,
    required this.appliedFilterCount,
  }) : super(key: key);
  final bool isActive;
  final int appliedFilterCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => isActive ? _showFilterPage(context) : null,
          icon: const Icon(
            Icons.tune,
          ),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ZPColors.orange,
            ),
            padding: const EdgeInsets.all(3),
            alignment: Alignment.center,
            child: Text(
              appliedFilterCount.toString(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 10,
                    color: ZPColors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  void _showFilterPage(BuildContext context) {
    final isInvoiceTabActive =
        context.tabsRouter.current.name == AllInvoicesPageRoute.name;
    isInvoiceTabActive
        ? context.read<AllInvoicesFilterBloc>().add(
              AllInvoicesFilterEvent.openFilterBottomSheet(
                appliedFilter:
                    context.read<AllInvoicesBloc>().state.appliedFilter,
              ),
            )
        : context.read<AllCreditsFilterBloc>().add(
              AllCreditsFilterEvent.openFilterBottomSheet(
                appliedFilter:
                    context.read<AllCreditsBloc>().state.appliedFilter,
              ),
            );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (_) {
        return isInvoiceTabActive
            ? const AllInvoicesFilterBottomSheet()
            : const AllCreditsFilterBottomSheet();
      },
    );
  }
}

class _Export extends StatelessWidget {
  final bool isInvoiceTabActive;

  const _Export({
    Key? key,
    required this.isInvoiceTabActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadPaymentAttachmentsBloc,
        DownloadPaymentAttachmentsState>(
      listenWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {
              showSnackBar(
                context: context,
                message: 'File downloaded successfully'.tr(),
              );
            },
          ),
        );
      },
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => isInvoiceTabActive
            ? context.read<DownloadPaymentAttachmentsBloc>().add(
                  DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
                    salesOrganization:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    queryObject: AllInvoicesFilter.fullyEmpty(),
                  ),
                )
            : context.read<DownloadPaymentAttachmentsBloc>().add(
                  DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
                    salesOrganization:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    queryObject: AllCreditsFilter.fullyEmpty(),
                  ),
                ),
        color: ZPColors.primary,
        icon: const Icon(
          Icons.cloud_download_outlined,
        ),
      ),
    );
  }
}
