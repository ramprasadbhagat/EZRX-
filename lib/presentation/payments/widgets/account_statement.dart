import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

class AccountStatement extends StatelessWidget {
  const AccountStatement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadPaymentAttachmentsBloc,
        DownloadPaymentAttachmentsState>(
      listenWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress &&
          !current.isDownloadInProgress,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {
              CustomSnackBar(
                messageText: 'File downloaded successfully'.tr(),
              ).show(context);
              
            },
          ),
        );
      },
      child: BlocBuilder<SoaBloc, SoaState>(
        buildWhen: (previous, current) => previous.soaList != current.soaList,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                title: 'Statement of accounts',
                onTapIconButton: () {},
              ),
              state.soaList.isNotEmpty
                  ? Column(
                      children:
                          state.soaList.map((e) => _SoaCard(soa: e)).toList(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'No statements available'.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: ZPColors.extraLightGrey4),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

class _SoaCard extends StatelessWidget {
  final Soa soa;
  const _SoaCard({Key? key, required this.soa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: const BoxDecoration(
        color: ZPColors.accentColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(soa.soaData.toDate),
          BlocBuilder<DownloadPaymentAttachmentsBloc,
              DownloadPaymentAttachmentsState>(
            builder: (context, state) {
              return state.isDownloadInProgress &&
                      SoaData(state.fileUrl.url) == soa.soaData
                  ? LoadingAnimationWidget.discreteCircle(
                      color: ZPColors.primary,
                      secondRingColor: ZPColors.secondary,
                      thirdRingColor: ZPColors.orange,
                      size: 24,
                    )
                  :
              IconButton(
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(),
                      alignment: Alignment.centerRight,
                      color: ZPColors.primary,
                      icon: const Icon(
                        Icons.cloud_download_outlined,
                      ),
                      onPressed: () {
                        if (state.isDownloadInProgress) return;
                        context.read<DownloadPaymentAttachmentsBloc>().add(
                              DownloadPaymentAttachmentEvent.downloadSOA(
                                soaData: soa.soaData,
                              ),
                            );
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
