import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnSummaryFilterByStatus extends StatelessWidget {
  const ReturnSummaryFilterByStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReturnSummaryFilterBloc, ReturnSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.returnSummaryFilter.
          activeStatus != current.returnSummaryFilter.activeStatus,
      listenWhen: (previous, current) =>
          previous.returnSummaryFilter.activeStatus != current.returnSummaryFilter.activeStatus,
      listener: (context, state) {
        context.router.popForced();
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
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
                children: state.returnSummaryFilter.returnSummaryFilteredStatus
                    .map((ReturnSummaryStatus status) {
                  return RadioListTile<ReturnSummaryStatus>(
                    title: Text(status.displayStatusInList),
                    groupValue: state.returnSummaryFilter.sortBy,
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (ReturnSummaryStatus? value) {
                      BlocProvider.of<ReturnSummaryFilterBloc>(
                        context,
                      ).add(
                        ReturnSummaryFilterEvent.sortByChanged(
                          sortBy: status,
                        ),
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
