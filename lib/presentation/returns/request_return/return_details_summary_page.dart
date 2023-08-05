import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/returns/submit_return/submit_return_bloc.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

class RequestReturnDetailsSummaryPage extends StatelessWidget {
  const RequestReturnDetailsSummaryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubmitReturnBloc, SubmitReturnState>(
      listenWhen: (previous, current) =>
          previous.requestID != current.requestID ||
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            if (state.messages.isNotEmpty) {
              CustomSnackBar(
                messageText: state.messages,
              ).show(context);

              return;
            }
            context.router.pushAndPopUntil(
              const ReturnRequestSuccessPageRoute(),
              predicate: (route) =>
                  route.settings.name == 'HomeNavigationTabbarRoute',
            );

            context
                .read<RequestReturnBloc>()
                .add(const RequestReturnEvent.initializeSelectedReturnItems());
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);

              return;
            },
            (_) {},
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Request Return Summary').tr(),
          toolbarHeight: kToolbarHeight + 2.0,
        ),
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(),
                      childCount: 0,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(),
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
