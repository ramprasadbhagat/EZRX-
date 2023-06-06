import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesDistrictPage extends StatelessWidget {
  const SalesDistrictPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sales District Management'.tr())),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<SalesDistrictBloc, SalesDistrictState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.salesDistrictList != current.salesDistrictList,
          builder: (context, state) {
            return state.isFetching
                ? LoadingShimmer.logo(
                    key: const Key('loaderImage'),
                  )
                : _SalesDistrictScrollList(
                    salesDistrictState: state,
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addSalesDistrictKey'),
        onPressed: () => context.router
            .pushNamed('payments/sales_district/add_sales_district'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _SalesDistrictScrollList extends StatelessWidget {
  final SalesDistrictState salesDistrictState;
  const _SalesDistrictScrollList({Key? key, required this.salesDistrictState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesDistrictBloc, SalesDistrictState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, manageSalesDistrictState) {
        manageSalesDistrictState.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {},
            (success) {
              showSnackBar(
                context: context,
                message: success.message.getOrDefaultValue(''),
              );
            },
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ScrollList<SalesDistrict>(
          emptyMessage: 'No Sales District found'.tr(),
          onRefresh: () => context
              .read<SalesDistrictBloc>()
              .add(const SalesDistrictEvent.fetch()),
          isLoading: salesDistrictState.isFetching,
          itemBuilder: (context, index, item) {
            return Column(
              children: item.salesDistrictInfo
                  .map((e) => _SalesDistrictListItem(
                        salesDistrictInfo: e,
                        salesOrg: item.salesOrg,
                      ))
                  .toList(),
            );
          },
          items: salesDistrictState.salesDistrictList,
        );
      },
    );
  }
}

class _SalesDistrictListItem extends StatelessWidget {
  final SalesDistrictInfo salesDistrictInfo;
  final SalesOrg salesOrg;
  const _SalesDistrictListItem({
    Key? key,
    required this.salesDistrictInfo,
    required this.salesOrg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: GestureDetector(
          onTap: () => _editSalesDistrict(context),
          child: CustomSlidable(
            endActionPaneActions: [
              CustomSlidableAction(
                label: 'Delete',
                icon: Icons.delete_outline,
                onPressed: (context) => salesDistrictInfo.isDeleteInProgress
                    ? null
                    : _deleteSalesDistrict(context),
              ),
            ],
            borderRadius: 8,
            child: Column(
              key: Key('salesDistrict${salesDistrictInfo.id}'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      salesOrg.getOrDefaultValue(''),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.kPrimaryColor,
                          ),
                    ),
                    salesDistrictInfo.isDeleteInProgress
                        ? const Padding(
                            padding: EdgeInsets.all(14.0),
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          )
                        : IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _showDeleteDialog(context),
                          ),
                  ],
                ),
                ..._getDSalesDistrictLabel(salesDistrictInfo: salesDistrictInfo)
                    .map(
                      (info) => BalanceTextRow(
                        keyText: info.key,
                        valueText: info.value,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _editSalesDistrict(BuildContext context) {
    _editEventCall(
      context,
      SalesDistrictField.id,
      salesDistrictInfo.id.toString(),
    );
    _editEventCall(
      context,
      SalesDistrictField.salesOrg,
      salesOrg.getOrDefaultValue(''),
    );
    _editEventCall(
      context,
      SalesDistrictField.salesDistrictLabel,
      salesDistrictInfo.salesDistrictLabel.getOrDefaultValue(''),
    );
    _editEventCall(
      context,
      SalesDistrictField.salesDistrictHeader,
      salesDistrictInfo.salesDistrictHeader.getOrDefaultValue(''),
    );
    context.router.pushNamed('payments/sales_district/edit_sales_district');
  }

  void _editEventCall(
    BuildContext context,
    SalesDistrictField field,
    String value,
  ) {
    final salesDistrictBloc = context.read<SalesDistrictBloc>();
    salesDistrictBloc.add(
      SalesDistrictEvent.onValueChange(
        field: field,
        value: value,
      ),
    );
  }

  void _deleteSalesDistrict(BuildContext context) {
    final salesDistrictBloc = context.read<SalesDistrictBloc>();
    _editEventCall(
      context,
      SalesDistrictField.id,
      salesDistrictInfo.id.toString(),
    );
    _editEventCall(
      context,
      SalesDistrictField.salesOrg,
      salesOrg.getOrDefaultValue(''),
    );
    salesDistrictBloc.add(
      const SalesDistrictEvent.delete(),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    CustomDialogs.confirmationDialog(
      context: context,
      title: 'Delete sales district'.tr(),
      message: 'Are you sure you want to delete this sales district?'.tr(),
      onAcceptPressed: () async => _deleteSalesDistrict(context),
      confirmText: 'Delete',
    );
  }
}

List<_SalesDistrictLabel> _getDSalesDistrictLabel({
  required SalesDistrictInfo salesDistrictInfo,
}) =>
    [
      _SalesDistrictLabel(
        key: 'Id'.tr(),
        value: salesDistrictInfo.id.toString(),
      ),
      _SalesDistrictLabel(
        key: 'Sales District'.tr(),
        value: salesDistrictInfo.salesDistrictHeader.getOrDefaultValue(''),
      ),
      _SalesDistrictLabel(
        key: 'Sales District Label'.tr(),
        value: salesDistrictInfo.salesDistrictLabel.getOrDefaultValue(''),
      ),
    ];

class _SalesDistrictLabel {
  const _SalesDistrictLabel({
    required this.key,
    required this.value,
  });
  final String key;
  final String value;
}
