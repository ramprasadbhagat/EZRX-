//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/po_attachment.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdditionPoAttachmentUpload extends StatelessWidget {
  const AdditionPoAttachmentUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: BlocListener<PoAttachmentBloc, PoAttachmentState>(
            listenWhen: (previous, current) =>
                previous != current && current.fileUploaded,
            listener: (context, state) {
              state.failureOrSuccessOption.fold(
                () {
                  context.read<AdditionalDetailsBloc>().add(
                        AdditionalDetailsEvent.addPoDocument(
                          poDocuments: state.fileUrl,
                        ),
                      );
                  final message = state.moreThanOneUploaded
                      ? '${state.fileUrl.length} ${'files uploaded successfully'.tr()}'
                      : '${state.fileUrl.first.name} ${'file uploaded successfully'.tr()}';
                  showSnackBar(
                    context: context,
                    message: message,
                  );
                },
                (either) => either.fold(
                  (failure) {
                    ErrorUtils.handleApiFailure(context, failure);
                  },
                  (_) {},
                ),
              );
            },
            child: const _PoUploadButton(),
          ),
        ),
        BlocBuilder<PoAttachmentBloc, PoAttachmentState>(
          buildWhen: (previous, current) =>
              previous.fileInOperation != current.fileInOperation,
          builder: (context, poAttachmentState) {
            return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
              buildWhen: (previous, current) =>
                  current.additionalDetailsData.poDocuments !=
                  previous.additionalDetailsData.poDocuments,
              builder: (context, state) {
                if (state.additionalDetailsData.poDocuments.isNotEmpty ||
                    poAttachmentState.fileUploading) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10.0,
                        ),
                        child: PoAttachment(
                          key: const ValueKey(
                            'orderSummaryAdditionalPoAttachment',
                          ),
                          poDocuments: state.additionalDetailsData.poDocuments,
                          poAttachMentRenderMode: PoAttachMentRenderMode.edit,
                          uploadingPocDocument:
                              poAttachmentState.uploadInProgressPoDocument,
                        ),
                      ),
                      const Divider(
                        color: ZPColors.lightGray,
                        endIndent: 0,
                        indent: 0,
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            );
          },
        ),
      ],
    );
  }
}

class _PoUploadButton extends StatelessWidget {
  const _PoUploadButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const ValueKey('poAttachmentUploadButton'),
      onTap: () {
        if (context.read<PoAttachmentBloc>().state.isFetching ||
            context.read<AdditionalDetailsBloc>().state.isLoading) return;
        showPlatformDialog(
          context: context,
          barrierDismissible: true,
          useRootNavigator: true,
          builder: (BuildContext context) {
            return const _PoUploadOptionPicker();
          },
        );
      },
      leading: SvgPicture.asset(
        'assets/svg/po_attachment_upload.svg',
        height: 40,
        width: 40,
        color: ZPColors.secondary,
        key: const ValueKey('poAttachmentUploadIcon'),
      ),
      title: const Text('Click to upload').tr(),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Individual File Size Limit: 5MB',
          ).tr(),
          const Text(
            'Acceptable files: PNG, JPEG, PDF, CSV, DOC, XLS, HEIC, XLSX',
          ).tr(),
        ],
      ),
    );
  }
}

class _PoUploadOptionPicker extends StatefulWidget {
  const _PoUploadOptionPicker({
    Key? key,
  }) : super(key: key);

  @override
  State<_PoUploadOptionPicker> createState() => _PoUploadOptionPickerState();
}

class _PoUploadOptionPickerState extends State<_PoUploadOptionPicker> {
  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      key: const ValueKey('poAttachmentUploadDialog'),
      title: Text(
        'Upload Attachment'.tr(),
      ),
      content: Text(
        'Choose a photo or a file'.tr(),
      ),
      actions: [
        PlatformDialogAction(
          key: const Key('poAttachmentPhotoUploadButton'),
          child: Column(
            children: [
              const Icon(
                Icons.image,
                color: ZPColors.kPrimaryColor,
              ),
              Text('Photos'.tr()),
            ],
          ),
          onPressed: () => uploadFile(
            uploadOptionType: UploadOptionType.gallery,
          ),
          cupertino: (_, __) => CupertinoDialogActionData(
            textStyle: const TextStyle(
              color: ZPColors.kPrimaryColor,
            ),
          ),
        ),
        PlatformDialogAction(
          key: const Key('poAttachmentFileUploadButton'),
          child: Column(
            children: [
              const Icon(
                Icons.folder,
                color: ZPColors.kPrimaryColor,
              ),
              Text('Files'.tr()),
            ],
          ),
          onPressed: () => uploadFile(
            uploadOptionType: UploadOptionType.file,
          ),
          cupertino: (_, __) => CupertinoDialogActionData(
            textStyle: const TextStyle(color: ZPColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }

  void uploadFile({
    required UploadOptionType uploadOptionType,
  }) {
    trackMixpanelEvent(
      MixpanelEvents.uploadAttachment,
      props: {
        MixpanelProps.attachmentType: 'PO',
      },
    );
    context.read<PoAttachmentBloc>().add(
          PoAttachmentEvent.uploadFile(
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
            shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
            salesOrg:
                context.read<EligibilityBloc>().state.salesOrgConfigs.salesOrg,
            user: context.read<EligibilityBloc>().state.user,
            uploadedPODocument: context
                .read<AdditionalDetailsBloc>()
                .state
                .additionalDetailsData
                .poDocuments,
            uploadOptionType: uploadOptionType,
          ),
        );
    context.router.pop();
  }
}
