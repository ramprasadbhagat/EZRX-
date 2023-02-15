import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApproverReturnStatusFilterBottomShttet extends StatelessWidget {
  const ApproverReturnStatusFilterBottomShttet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReturnApproverFilterBloc, ReturnApproverFilterState>(
      buildWhen: (previous, current) =>
          previous.activeSort != current.activeSort,
      listenWhen: (previous, current) =>
          previous.activeSort != current.activeSort,
      listener: (context, state) {
        Navigator.of(context).pop();
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          key: const ValueKey('return_approver_filter_by_status'),
          children: <Widget>[
            AppBar(
              title: Text(
                'Select Status'.tr(),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  key: const Key('closeButton'),
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.clear,
                    color: ZPColors.black,
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Column(
                children: state.sortParameters.map((FilterStatus status) {
                  return RadioListTile<FilterStatus>(
                    title: Text(status.label),
                    groupValue: state.approverReturnFilter.sortBy,
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (FilterStatus? value) {
                      BlocProvider.of<ReturnApproverFilterBloc>(
                        context,
                      ).add(
                        ReturnApproverFilterEvent.sortByChanged(status),
                      );
                    },
                    value: status,
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
