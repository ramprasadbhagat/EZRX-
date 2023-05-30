import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCreditsFilterByStatus extends StatelessWidget {
  const AllCreditsFilterByStatus({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allCreditsFilterState = context.read<AllCreditsFilterBloc>().state;

    return BlocListener<AllCreditsFilterBloc, AllCreditsFilterState>(
      listenWhen: (previous, current) =>
          previous.allCreditsFilter.sortBy != current.allCreditsFilter.sortBy,
      listener: (context, state) {
        context.router.popForced();
      },
      child: Column(
        key: const ValueKey('all_credits_filter_by_status'),
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
              children:
                  allCreditsFilterState.allCreditsStatuses.map((String status) {
                return RadioListTile<String>(
                  title: Text(status),
                  groupValue: allCreditsFilterState.allCreditsFilter.sortBy,
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (String? value) {
                    context.read<AllCreditsFilterBloc>().add(
                          AllCreditsFilterEvent.sortByChanged(
                            status,
                          ),
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
