import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/sections/request_details_section.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/sections/request_item_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ReturnRequestDetails extends StatelessWidget {
  const ReturnRequestDetails({
    Key? key,
    required this.returnItem,
  }) : super(key: key);
  final ReturnItem returnItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Return request details',
        ).tr(),
        centerTitle: false,
      ),
      body:
          BlocConsumer<ReturnDetailsByRequestBloc, ReturnDetailsByRequestState>(
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
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: state.isLoading
                ? Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: LoadingAnimationWidget.discreteCircle(
                      color: ZPColors.primary,
                      secondRingColor: ZPColors.secondary,
                      thirdRingColor: ZPColors.orange,
                      size: 30,
                    ),
                  )
                : ListView(
                    children: [
                      RequestDetailsSection(
                        requestInformationHeader:
                            state.requestInformationHeader,
                        returnItem: returnItem,
                      ),
                      const Divider(
                        indent: 0,
                        height: 20,
                        endIndent: 0,
                        color: ZPColors.lightGray2,
                      ),
                      RequestItemSection(
                        returnRequestinformationList: state.requestInformation,
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
