import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/view_deduction_code/deduction_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
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
        child: BlocBuilder<DeductionCodeBloc, DeductionCodeState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return state.isFetching
                ? LoadingShimmer.logo(
                    key: const Key('loaderImage'),
                  )
                : ScrollList<DeductionCode>(
                    emptyMessage: 'No deduction code found'.tr(),
                    onRefresh: () => context
                        .read<DeductionCodeBloc>()
                        .add(const DeductionCodeEvent.fetch()),
                    isLoading: state.isFetching,
                    onLoadingMore: () {},
                    itemBuilder: (context, index, item) {
                      return _DeductionCodeListItem(
                        deductionCode: item,
                        index: index,
                      );
                    },
                    items: state.deductionCodeList,
                  );
          },
        ),
      ),
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
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
    );
  }
}

List<_DeductionCodeLabel> _getDeductionCodeLabels({
  required DeductionCode deductionCode,
}) =>
    [
      _DeductionCodeLabel(
        key: 'Sales District'.tr(),
        value: deductionCode.salesDistrictLabel,
      ),
      _DeductionCodeLabel(
        key: 'Deduction Code'.tr(),
        value: deductionCode.deductionCode,
      ),
      _DeductionCodeLabel(
        key: 'Description'.tr(),
        value: deductionCode.deductionDescription,
      ),
      _DeductionCodeLabel(
        key: 'Account Type'.tr(),
        value: deductionCode.amountType,
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
