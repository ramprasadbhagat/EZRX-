import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeductionCodeListPage extends StatelessWidget {
  const DeductionCodeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configure Deduction Code').tr()),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<ManageDeductionCodeBloc, ManageDeductionCodeState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.deductionCodeList != current.deductionCodeList,
          builder: (context, state) {
            return state.isFetching
                ? LoadingShimmer.logo(
                    key: const Key('loaderImage'),
                  )
                : _DeductionCodeScrollList(deductionCodeState: state);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addDeductionCodeKey'),
        onPressed: () {
          context.read<ManageDeductionCodeBloc>().add(
                ManageDeductionCodeEvent.setDeductionCodeData(
                  data: DeductionCode.empty(),
                ),
              );
          context.router.pushNamed('payments/add_deduction_code');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _DeductionCodeScrollList extends StatelessWidget {
  final ManageDeductionCodeState deductionCodeState;
  const _DeductionCodeScrollList({
    required this.deductionCodeState,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageDeductionCodeBloc, ManageDeductionCodeState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            if (!state.isSubmitting && state.response.success) {
              showSnackBar(
                context: context,
                message: state.response.info.tr(),
              );
            }
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (success) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ScrollList<DeductionCode>(
          emptyMessage: 'No deduction code found'.tr(),
          controller: ScrollController(),
          onRefresh: () {
            context
                .read<ManageDeductionCodeBloc>()
                .add(const ManageDeductionCodeEvent.fetch());
          },
          isLoading: deductionCodeState.isFetching,
          onLoadingMore: () {},
          itemBuilder: (context, index, item) {
            return _DeductionCodeListItem(
              deductionCode: item,
              index: index,
            );
          },
          items: deductionCodeState.deductionCodeList,
        );
      },
    );
  }
}

class _DeductionCodeListItem extends StatelessWidget {
  final DeductionCode deductionCode;
  final int index;

  const _DeductionCodeListItem({
    Key? key,
    required this.deductionCode,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ManageDeductionCodeBloc>().add(
              ManageDeductionCodeEvent.setDeductionCodeData(
                data: DeductionCode.empty().copyWith(
                  salesOrg: deductionCode.salesOrg,
                  salesDistrict: deductionCode.salesDistrict,
                  deductionCode: deductionCode.deductionCode,
                  amountType: deductionCode.amountType,
                  deductionDescription: deductionCode.deductionDescription,
                ),
              ),
            );
        context.router.pushNamed('payments/edit_deduction_code');
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: CustomSlidable(
          endActionPaneActions: [
            CustomSlidableAction(
              label: 'Delete',
              icon: Icons.delete_outline,
              onPressed: (context) => deductionCode.isDeleteInProgress
                  ? null
                  : _deleteDeductionCode(context: context),
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              key: Key('deductionCode$index'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      deductionCode.salesOrg.getOrDefaultValue(''),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.kPrimaryColor,
                          ),
                    ),
                    IconButton(
                      iconSize: 24.0,
                      icon: deductionCode.isDeleteInProgress
                          ? SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                key: Key('indicator$index'),
                              ),
                            )
                          : Icon(
                              Icons.delete,
                              key: Key('deleteKey$index'),
                            ),
                      onPressed: () => deductionCode.isDeleteInProgress
                          ? null
                          : CustomDialogs.confirmationDialog(
                              context: context,
                              title: 'Delete deduction code'.tr(),
                              message:
                                  'Are you sure you want to delete this deduction code?'
                                      .tr(),
                              onAcceptPressed: () async =>
                                  _deleteDeductionCode(context: context),
                              confirmText: 'Delete',
                            ),
                    ),
                  ],
                ),
                ..._getDeductionCodeLabels(deductionCode: deductionCode)
                    .map(
                      (code) => BalanceTextRow(
                        keyText: code.key,
                        valueText: code.value,
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

  void _deleteDeductionCode({required BuildContext context}) =>
      context.read<ManageDeductionCodeBloc>().add(
            ManageDeductionCodeEvent.deleteDeductionCode(
              data: deductionCode,
            ),
          );
}

List<_DeductionCodeLabel> _getDeductionCodeLabels({
  required DeductionCode deductionCode,
}) =>
    [
      _DeductionCodeLabel(
        key: 'Sales District'.tr(),
        value: deductionCode.salesDistrict.getOrDefaultValue(''),
      ),
      _DeductionCodeLabel(
        key: 'Deduction Code'.tr(),
        value: deductionCode.deductionCode.getOrDefaultValue(''),
      ),
      _DeductionCodeLabel(
        key: 'Description'.tr(),
        value: deductionCode.deductionDescription.getOrDefaultValue(''),
      ),
      _DeductionCodeLabel(
        key: 'Account Type'.tr(),
        value: deductionCode.amountType.getOrDefaultValue(''),
      ),
    ];

class _DeductionCodeLabel {
  const _DeductionCodeLabel({
    required this.key,
    required this.value,
  });
  final String key;
  final String value;
}
