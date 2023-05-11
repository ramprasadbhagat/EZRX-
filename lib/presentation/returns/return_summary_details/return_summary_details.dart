import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/domain/returns/entities/return_summary_requests.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_details/section/customer_details_section.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_details/section/return_details_section.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_details/section/return_items_section.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

class ReturnSummaryDetails extends StatelessWidget {
  final CustomerCodeInfo customerCodeInfo;
  final ShipToInfo shipToInfo;
  final ReturnSummaryRequest returnSummaryRequests;

  const ReturnSummaryDetails({
    Key? key,
    required this.customerCodeInfo,
    required this.shipToInfo,
    required this.returnSummaryRequests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReturnSummaryDetailsBloc, ReturnSummaryDetailsState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (
        context,
        state,
      ) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (success) {},
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () => context.router.pop(),
          ),
          title: Text(returnSummaryRequests.returnId.tr()),
        ),
        body: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 20,
            ),
            child: Column(
              children: const [
                ReturnSummaryCustomerDetailsSection(),
                ReturnSummaryDetailsSection(),
                ReturnItemsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
