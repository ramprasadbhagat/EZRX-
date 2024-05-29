import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/widgets/open_setting_bottomsheet.dart';
import 'package:ezrxmobile/presentation/widgets/select_attachment_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PoAttachmentUpload extends StatelessWidget {
  const PoAttachmentUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PoAttachmentBloc, PoAttachmentState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () => {},
          (either) => either.fold(
            (failure) {
              if (failure == const ApiFailure.cameraPermissionFailed(true)) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  enableDrag: false,
                  isDismissible: true,
                  builder: (_) => const OpenSettingBottomSheet(),
                );
              } else {
                ErrorUtils.handleApiFailure(context, failure);
              }
            },
            (_) {
              context.read<AdditionalDetailsBloc>().add(
                    AdditionalDetailsEvent.addPoDocument(
                      poDocuments: state.fileUrl,
                    ),
                  );
              if (state.fileOperationMode == FileOperationMode.upload) {
                CustomSnackBar(
                  messageText: context.tr(
                    '{fileCount} file upload successfully',
                    namedArgs: {
                      'fileCount': state.fileUrl.length.toString(),
                    },
                  ),
                ).show(context);
              }
            },
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.fileUrl != current.fileUrl,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PoUploadButton(),
            const _UploadErrorMessage(),
            _UploadedFileList(
              data: state.fileUrl,
            ),
          ],
        );
      },
    );
  }
}

class _PoUploadButton extends StatelessWidget {
  const _PoUploadButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoAttachmentBloc, PoAttachmentState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return OutlinedButton(
          key: WidgetKeys.uploadAttachmentKey,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.maxFinite, 45),
          ),
          onPressed: () {
            if (context.read<PoAttachmentBloc>().state.isFetching ||
                context.read<AdditionalDetailsBloc>().state.isLoading) return;
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              enableDrag: false,
              isDismissible: false,
              builder: (_) => SelectAttachmentBottomsheet(
                onUploadOptionSelected: (option) =>
                    context.read<PoAttachmentBloc>().add(
                          PoAttachmentEvent.uploadFile(
                            uploadedPODocument: context
                                .read<AdditionalDetailsBloc>()
                                .state
                                .deliveryInfoData
                                .poDocuments,
                            uploadOptionType: option,
                            user: context.read<EligibilityBloc>().state.user,
                          ),
                        ),
              ),
            );
          },
          child: LoadingShimmer.withChild(
            enabled: state.isFetching,
            child: const Text('Upload attachment').tr(),
          ),
        );
      },
    );
  }
}

class _UploadErrorMessage extends StatelessWidget {
  const _UploadErrorMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AdditionalDetailsBloc, AdditionalDetailsState, bool>(
      selector: (state) => state.isPoAttachmentValidated,
      builder: (context, booleanState) {
        return booleanState
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(top: 6.0, left: 16.0),
                child: Text(
                  context.tr('PO attachment is required'),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.red,
                      ),
                ),
              );
      },
    );
  }
}

class _UploadedFileList extends StatelessWidget {
  const _UploadedFileList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<PoDocuments> data;

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? BlocBuilder<PoAttachmentBloc, PoAttachmentState>(
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching ||
                previous.fileUrl != current.fileUrl,
            builder: (context, state) {
              return ListTile(
                key: WidgetKeys.attachmentsTileKey,
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 10,
                title: Text(
                  '${'Attachments'.tr()}:',
                ),
                subtitle: state.isAttachmentUploaded
                    ? LoadingShimmer.tile()
                    : Column(
                        children: data
                            .map(
                              (file) => Card(
                                color: ZPColors.accentColor,
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 2.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          file.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: ZPColors.darkerGreen,
                                              ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete_outline_outlined,
                                        ),
                                        padding: const EdgeInsets.all(0.0),
                                        onPressed: () {
                                          context.read<PoAttachmentBloc>().add(
                                                PoAttachmentEvent.deleteFile(
                                                  file: file,
                                                ),
                                              );
                                          context
                                              .read<AdditionalDetailsBloc>()
                                              .add(
                                                AdditionalDetailsEvent
                                                    .removePoDocument(
                                                  poDocument: file,
                                                ),
                                              );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
              );
            },
          )
        : const SizedBox.shrink();
  }
}
