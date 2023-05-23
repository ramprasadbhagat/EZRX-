import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllInvoicesStatusFilterBottomSheet extends StatelessWidget {
  const AllInvoicesStatusFilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      listenWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.allInvoicesFilter.filterStatus !=
              current.allInvoicesFilter.filterStatus,
      listener: (context, state) {
        Navigator.of(context).pop();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        key: const ValueKey('all_invoices_filter_by_status'),
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
              children: context
                  .read<AllInvoicesFilterBloc>()
                  .state
                  .statuses
                  .map((String status) {
                return RadioListTile<String>(
                  title: Text(status),
                  groupValue: context
                      .read<AllInvoicesFilterBloc>()
                      .state
                      .allInvoicesFilter
                      .filterStatus,
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (String? value) {
                    context.read<AllInvoicesFilterBloc>().add(
                          AllInvoicesFilterEvent.statusChanged(status),
                        );
                  },
                  value: status,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
