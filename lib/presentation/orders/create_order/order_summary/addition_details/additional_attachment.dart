import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/po_attachment.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

class AdditionPoAttachmentUpload extends StatelessWidget {
  const AdditionPoAttachmentUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          color: Theme.of(context).scaffoldBackgroundColor,
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
                    final failureMessage = failure.failureMessage;
                    showSnackBar(
                      context: context,
                      message: failureMessage.tr(),
                    );
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
                  return PoAttachment(
                    poDocuments: state.additionalDetailsData.poDocuments,
                    poattachMentRenderMode: PoAttachMentRenderMode.edit,
                    uploadingPocDocument:
                        poAttachmentState.uploadInProgressPoDocument,
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
      onTap: () {
        if (context.read<PoAttachmentBloc>().state.isFetching) return;
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
        key: const ValueKey('po_attachment_upload_icon'),
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
      title: const Text(
        'Upload Attachment',
      ).tr(),
      content: const Text(
        'Choose a photo or a file',
      ).tr(),
      actions: [
        PlatformDialogAction(
          key: const Key('po_photo_upload_button_button'),
          child: Column(
            children: [
              const Icon(
                Icons.image,
                color: ZPColors.kPrimaryColor,
              ),
              const Text('Photos').tr(),
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
          key: const Key('po_attachment_file_upload_button'),
          child: Column(
            children: [
              const Icon(
                Icons.folder,
                color: ZPColors.kPrimaryColor,
              ),
              const Text('Files').tr(),
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

  Future<void> uploadFile({
    required UploadOptionType uploadOptionType,
  }) async {
    if (!(uploadOptionType == UploadOptionType.file && Platform.isIOS)) {
      final permission =
          Platform.isIOS ? Permission.photos : Permission.storage;
      final permissionStatus = await permission.request();
      if (!permissionStatus.isGranted && !permissionStatus.isLimited) {
        showSnackBar(
          context: context,
          message: Platform.isIOS
              ? 'Please enable Photos permission from the app settings'.tr()
              : 'Please enable Storage permission from the app settings'.tr(),
        );
        await context.router.pop();
        
        return;
      }
    }
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: uploadOptionType == UploadOptionType.file
            ? FileType.custom
            : FileType.image,
        allowedExtensions: uploadOptionType == UploadOptionType.file
            ? _allowedExtensions
            : null,
      );
    } catch (e) {
      const message =
          'Unable to upload file as either file format not supported or something wrong with the file';
      showSnackBar(
        context: context,
        message: message,
      );
      await context.router.pop();

      return;
    }

    await context.router.pop();
    if (result == null) return;

    final files = List<PlatformFile>.from(result.files)
      ..removeWhere((element) => (element.path ?? '').isEmpty);

    if (files.isEmpty || !mounted) return;
    context.read<PoAttachmentBloc>().add(
          PoAttachmentEvent.uploadFile(
            files: files,
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
          ),
        );
  }
}

enum UploadOptionType { file, gallery }

const _allowedExtensions = [
  'jpg',
  'pdf',
  'doc',
  'png',
  'jpge',
  'csv',
  'pdf',
  'xlsx',
  'xls',
  'heic',
];
