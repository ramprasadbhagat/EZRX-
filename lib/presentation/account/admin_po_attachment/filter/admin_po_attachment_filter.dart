import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/filter/admin_po_attachment_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/admin_po_attachment/filter/filter_sales_org_selector.dart';
import 'package:ezrxmobile/presentation/account/customer_search.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AdminPoAttachmentFilterDrawer extends StatelessWidget {
  const AdminPoAttachmentFilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key('adminPoAttachmentFilterDrawer'),
      width: MediaQuery.of(context).size.width * 0.8,
      child: BlocProvider<CustomerCodeBloc>(
        create: (_) => locator<CustomerCodeBloc>()
          ..add(
            CustomerCodeEvent.fetch(
              userInfo: context.read<EligibilityBloc>().state.user,
              selectedSalesOrg: SalesOrganisation.empty().copyWith(
                salesOrg: context
                    .read<AdminPoAttachmentFilterBloc>()
                    .state
                    .adminPoAttachmentFilter
                    .salesOrg,
                customerInfos: [
                  SalesOrgCustomerInfo.all(),
                ],
              ),
              hidecustomer: false,
            ),
          ),
        child: BlocConsumer<AdminPoAttachmentFilterBloc,
            AdminPoAttachmentFilterState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          listener: (context, state) {
            if (state.isSubmitting) {
              context.router.popForced();
            }
          },
          builder: (context, state) {
            return Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                children: <Widget>[
                  const _FilterHeader(),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 30,
                      ),
                      children: <Widget>[
                        const _OrderNoByFilter(),
                        const SizedBox(
                          height: 20,
                        ),
                        const _EzrxNumberFilter(),
                        const SizedBox(
                          height: 20,
                        ),
                        const _SalesOrgByFilter(),
                        const SizedBox(
                          height: 20,
                        ),
                        const _CustomerCodeByFilter(),
                        const SizedBox(
                          height: 20,
                        ),
                        const _AdminAttachmentDateFilter(),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            _ClearButton(),
                            _ApplyButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Apply Po Attachment Filters').tr(),
      actions: [
        IconButton(
          key: const Key('filterCrossButton'),
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () => context.router.popForced(),
        ),
      ],
    );
  }
}

class _OrderNoByFilter extends StatelessWidget {
  const _OrderNoByFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPoAttachmentFilterBloc,
        AdminPoAttachmentFilterState>(
      buildWhen: (previous, current) =>
          previous.adminPoAttachmentFilter.orderNumber !=
          current.adminPoAttachmentFilter.orderNumber,
      builder: (context, state) {
        return TextFormField(
          key: const Key('filterOrderNoField'),
          autocorrect: false,
          initialValue:
              state.adminPoAttachmentFilter.orderNumber.getOrDefaultValue(''),
          onChanged: (value) => context.read<AdminPoAttachmentFilterBloc>().add(
                AdminPoAttachmentFilterEvent.orderNoChanged(
                  value,
                ),
              ),
          validator: (_) =>
              state.adminPoAttachmentFilter.orderNumber.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Search input must be greater than 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Order No'.tr(),
          ),
        );
      },
    );
  }
}

class _EzrxNumberFilter extends StatelessWidget {
  const _EzrxNumberFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPoAttachmentFilterBloc,
        AdminPoAttachmentFilterState>(
      buildWhen: (previous, current) =>
          previous.adminPoAttachmentFilter.exRxNo !=
          current.adminPoAttachmentFilter.exRxNo,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterEzrxNumberField'),
          autocorrect: false,
          initialValue:
              state.adminPoAttachmentFilter.exRxNo.getOrDefaultValue(''),
          onChanged: (value) => context.read<AdminPoAttachmentFilterBloc>().add(
                AdminPoAttachmentFilterEvent.ezrxNoChanged(
                  value,
                ),
              ),
          validator: (_) => state.adminPoAttachmentFilter.exRxNo.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Please enter at least 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Ezrx No'.tr(),
          ),
        );
      },
    );
  }
}

class _SalesOrgByFilter extends StatelessWidget {
  const _SalesOrgByFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminPoAttachmentFilterBloc,
        AdminPoAttachmentFilterState>(
      listenWhen: (previous, current) =>
          previous.adminPoAttachmentFilter.salesOrg !=
              current.adminPoAttachmentFilter.salesOrg &&
          current.adminPoAttachmentFilter.salesOrg.isValid(),
      listener: (context, state) => context.read<CustomerCodeBloc>().add(
            CustomerCodeEvent.fetch(
              userInfo: context.read<EligibilityBloc>().state.user,
              selectedSalesOrg: SalesOrganisation.empty().copyWith(
                salesOrg: state.adminPoAttachmentFilter.salesOrg,
                customerInfos: [
                  SalesOrgCustomerInfo.all(),
                ],
              ),
              hidecustomer: false,
            ),
          ),
      buildWhen: (previous, current) =>
          previous.adminPoAttachmentFilter.salesOrg !=
          current.adminPoAttachmentFilter.salesOrg,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: Key(
            'filterSalesOrgSearchField${state.adminPoAttachmentFilter.salesOrg.getOrDefaultValue('')}',
          ),
          autocorrect: false,
          readOnly: true,
          initialValue:
              state.adminPoAttachmentFilter.salesOrg.getOrDefaultValue(''),
          onTap: () => showPlatformDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => const AdminPoAttachmentFilterSalesOrgSelector(),
          ),
          decoration: InputDecoration(
            labelText: 'Sales Org'.tr(),
          ),
        );
      },
    );
  }
}

class _CustomerCodeByFilter extends StatelessWidget {
  const _CustomerCodeByFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPoAttachmentFilterBloc,
        AdminPoAttachmentFilterState>(
      buildWhen: (previous, current) =>
          previous.adminPoAttachmentFilter.soldTo !=
              current.adminPoAttachmentFilter.soldTo ||
          previous.adminPoAttachmentFilter.salesOrg !=
              current.adminPoAttachmentFilter.salesOrg,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: Key(
            'filterCustomerCodeSearchField ${state.adminPoAttachmentFilter.soldTo.customerCodeSoldTo}',
          ),
          autocorrect: false,
          initialValue: state.adminPoAttachmentFilter.soldTo.customerCodeSoldTo,
          onTap: () {
            if (!state.adminPoAttachmentFilter.salesOrg.isValid()) return;
            context.router.pushWidget(BlocProvider.value(
              value: context.read<CustomerCodeBloc>(),
              child: const CustomerSearchPage(),
            ));
          },
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Customer Code'.tr(),
          ),
        );
      },
    );
  }
}

class _AdminAttachmentDateFilter extends StatelessWidget {
  const _AdminAttachmentDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPoAttachmentFilterBloc,
        AdminPoAttachmentFilterState>(
      buildWhen: (previous, current) =>
          previous.adminPoAttachmentFilter.dateFiltered !=
          current.adminPoAttachmentFilter.dateFiltered,
      builder: (context, state) {
        return TextFormField(
          key: Key(
            'filterAdminPoAttachmentDateField+${state.adminPoAttachmentFilter.dateFiltered}',
          ),
          autocorrect: false,
          onTap: () async {
            final adminPoAttachmentFilterBloc =
                context.read<AdminPoAttachmentFilterBloc>();
            final dateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(
                locator<Config>().dateRangePickerDuration,
              ),
              lastDate: DateTime.now(),
              initialDateRange: state.adminPoAttachmentFilter.filterDateRange,
              locale: context.read<SalesOrgBloc>().state.salesOrg.locale,
            );
            if (dateRange == null) return;
            adminPoAttachmentFilterBloc.add(
              AdminPoAttachmentFilterEvent.setOrderDate(
                orderDateRange: dateRange,
              ),
            );
          },
          readOnly: true,
          initialValue: state.adminPoAttachmentFilter.dateFiltered,
          decoration: InputDecoration(
            labelText: 'Order Date'.tr(),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.calendar_month,
                size: 20,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 25),
          ),
        );
      },
    );
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: const Key('filterClearButton'),
      onPressed: () {
        context.read<AdminPoAttachmentFilterBloc>().add(
              const AdminPoAttachmentFilterEvent.initialized(),
            );
        context.router.popForced();
      },
      child: Text(
        'Clear'.tr(),
        style: const TextStyle(color: ZPColors.primary),
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('filterApplyButton'),
      onPressed: () {
        context.read<AdminPoAttachmentFilterBloc>().add(
              const AdminPoAttachmentFilterEvent.applyFilters(),
            );
      },
      child: Text(
        'Apply'.tr(),
        style: const TextStyle(color: ZPColors.white),
      ),
    );
  }
}
