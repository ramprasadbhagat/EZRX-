import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bank_benificiary.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankBenificiaryPage extends StatelessWidget {
  const BankBenificiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bank Beneficiary Management'.tr())),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<BankBeneficiaryBloc, BankBeneficiaryState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return state.isFetching
                ? LoadingShimmer.logo(
                    key: const Key('loaderImage'),
                  )
                : ScrollList<BankBeneficiary>(
                    emptyMessage: 'No Benificiary found'.tr(),
                    onRefresh: () => _onRefresh(context: context),
                    isLoading: state.isFetching,
                    itemBuilder: (context, index, item) {
                      return _BankBenificiaryListItem(
                        manageBenificiary: item,
                        index: index,
                      );
                    },
                    items: state.manageBenificiaryList,
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  void _onRefresh({required BuildContext context}) {
    context
        .read<BankBeneficiaryBloc>()
        .add(const BankBeneficiaryEvent.initialized());
    context
        .read<BankBeneficiaryBloc>()
        .add(const BankBeneficiaryEvent.fetch());
  }
}

class _BankBenificiaryListItem extends StatelessWidget {
  final BankBeneficiary manageBenificiary;
  final int index;
  const _BankBenificiaryListItem({
    Key? key,
    required this.manageBenificiary,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: CustomSlidable(
          endActionPaneActions: [
            CustomSlidableAction(
              label: 'Delete',
              icon: Icons.delete_outline,
              onPressed: (context) {},
            ),
          ],
          borderRadius: 8,
          child:Column(
              key:Key('bankBenificiary$index'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      manageBenificiary.salesOrg.getValue(),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: ZPColors.kPrimaryColor,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ],
                ),
                BalanceTextRow(
                  keyText: 'Beneficiary Name', 
                  valueText: manageBenificiary.beneficiaryName.displayStringValue.tr(),
                  keyFlex: 2,
                  valueFlex: 3,
                ),
                BalanceTextRow(
                  keyText: 'Account Number', 
                  valueText: manageBenificiary.bankAccount.displayStringValue.tr(),
                  keyFlex: 2,
                  valueFlex: 3,
                ),
                BalanceTextRow(
                  keyText: 'Bank Name', 
                  valueText: manageBenificiary.bankName.displayStringValue.tr(),
                  keyFlex: 2,
                  valueFlex: 3,
                ),
              ],
            ),
        ),
      ),
    );
  }
}
