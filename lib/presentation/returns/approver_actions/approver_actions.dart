import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/return_request_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApproverActions extends StatelessWidget {
  const ApproverActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('approver_actions');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Approver Actions').tr(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Filter'.tr(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: ZPColors.kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ).tr(),
                Stack(
                  children: const <Widget>[
                    FittedBox(
                      child: Icon(
                        Icons.filter_alt,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocConsumer<ReturnApproverBloc, ReturnApproverState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ScrollList<ApproverReturnRequest>(
                  emptyMessage: 'No Return found'.tr(),
                  onRefresh: () {
                    context.read<ReturnApproverBloc>()
                      ..add(
                        const ReturnApproverEvent.initialized(),
                      )
                      ..add(ReturnApproverEvent.fetch(
                        user: context.read<EligibilityBloc>().state.user,
                      ));
                  },
                  onLoadingMore: () {
                    context.read<ReturnApproverBloc>().add(
                          ReturnApproverEvent.fetch(
                            user: context.read<EligibilityBloc>().state.user,
                          ),
                        );
                  },
                  isLoading: state.isFetching,
                  itemBuilder: (context, index, itemInfo) {
                    return ApproverReturnRequestTile(
                      approverReturnRequest: itemInfo,
                    );
                  },
                  items: state.approverReturnRequests,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
