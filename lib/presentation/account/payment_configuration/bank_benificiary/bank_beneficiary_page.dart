import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
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

class BankBeneficiaryPage extends StatelessWidget {
  const BankBeneficiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bank Beneficiary Management'.tr())),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child:
            BlocBuilder<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.beneficiaryList != current.beneficiaryList,
          builder: (context, state) {
            return state.isFetching
                ? LoadingShimmer.logo(
                    key: const Key('loaderImage'),
                  )
                : _BankBeneficiaryScrollList(
                    beneficiaryState: state,
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<ManageBankBeneficiaryBloc>().add(
                ManageBankBeneficiaryEvent.setBeneficiary(
                  beneficiary: BankBeneficiary.empty(),
                ),
              );
          context.router.pushNamed('payments/add_beneficiary');
        },
      ),
    );
  }
}

class _BankBeneficiaryScrollList extends StatelessWidget {
  final ManageBankBeneficiaryState beneficiaryState;
  const _BankBeneficiaryScrollList({Key? key, required this.beneficiaryState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            if (!state.isSubmitting && state.response != BankBeneficiaryResponse.empty()) {
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
        return ScrollList<BankBeneficiary>(
          emptyMessage: 'No Beneficiary found'.tr(),
          onRefresh: () => context
              .read<ManageBankBeneficiaryBloc>()
              .add(const ManageBankBeneficiaryEvent.fetch()),
          isLoading: beneficiaryState.isFetching,
          itemBuilder: (context, index, item) {
            return _BankBeneficiaryListItem(
              beneficiaryData: item,
              index: index,
            );
          },
          items: beneficiaryState.beneficiaryList,
        );
      },
    );
  }
}

class _BankBeneficiaryListItem extends StatelessWidget {
  final BankBeneficiary beneficiaryData;
  final int index;
  const _BankBeneficiaryListItem({
    Key? key,
    required this.beneficiaryData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToEditBeneficiary(
        context: context,
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: CustomSlidable(
            endActionPaneActions: [
              CustomSlidableAction(
                label: 'Delete',
                icon: Icons.delete_outline,
                onPressed: (context) =>
                    context.read<ManageBankBeneficiaryBloc>().add(
                          ManageBankBeneficiaryEvent.deleteBeneficiary(
                            beneficiary: beneficiaryData,
                          ),
                        ),
              ),
            ],
            borderRadius: 8,
            child: Column(
              key: Key('bankBeneficiary$index'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      beneficiaryData.salesOrg.getValue(),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.kPrimaryColor,
                          ),
                    ),
                    IconButton(
                      iconSize: 24.0,
                      icon: beneficiaryData.isDeleteInProgress
                          ? const SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                              ),
                          )
                          : const Icon(Icons.delete),
                      onPressed: () => beneficiaryData.isDeleteInProgress
                          ? null
                          : _deleteBeneficiaryDialog(
                              context: context,
                              manageBeneficiary: beneficiaryData,
                              deleteIndex: index,
                            ),
                    ),
                  ],
                ),
                BalanceTextRow(
                  keyText: 'Beneficiary Name',
                  valueText:
                      beneficiaryData.beneficiaryName.displayStringValue.tr(),
                  keyFlex: 2,
                  valueFlex: 3,
                ),
                BalanceTextRow(
                  keyText: 'Account Number',
                  valueText:
                      beneficiaryData.bankAccount.displayStringValue.tr(),
                  keyFlex: 2,
                  valueFlex: 3,
                ),
                BalanceTextRow(
                  keyText: 'Bank Name',
                  valueText: beneficiaryData.bankName.displayStringValue.tr(),
                  keyFlex: 2,
                  valueFlex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToEditBeneficiary({
    required BuildContext context,
  }) {
    if (!beneficiaryData.isDeleteInProgress) {
      context.read<ManageBankBeneficiaryBloc>().add(
          ManageBankBeneficiaryEvent.setBeneficiary(
            beneficiary: beneficiaryData,
          ),
        );
    context.read<ManageBankBeneficiaryBloc>().add(
          ManageBankBeneficiaryEvent.fetchSalesDistrict(
            fromAdd: false,
            salesOrg: beneficiaryData.salesOrg,
          ),
        );
    context.router.pushNamed('payments/edit_beneficiary');
    }
  }

  void _deleteBeneficiaryDialog({
    required BuildContext context,
    required BankBeneficiary manageBeneficiary,
    required int deleteIndex,
  }) {
    CustomDialogs.confirmationDialog(
      context: context,
      title: 'Delete Bank Beneficiary'.tr(),
      message: 'Are you sure you want to delete this Bank Beneficiary?'.tr(),
      onAcceptPressed: () async =>
          context.read<ManageBankBeneficiaryBloc>().add(
                ManageBankBeneficiaryEvent.deleteBeneficiary(
                  beneficiary: manageBeneficiary,
                ),
              ),
      confirmText: 'Delete',
    );
  }
}
