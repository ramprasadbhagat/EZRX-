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
import 'package:flutter_svg/flutter_svg.dart';

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
                (previous.isFetching != current.isFetching) &&
                current.fileUrl.isNotEmpty,
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
        BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
          buildWhen: (previous, current) =>
              current.additionalDetailsData.poDocuments !=
              previous.additionalDetailsData.poDocuments,
          builder: (context, state) {
            if (state.additionalDetailsData.poDocuments.isNotEmpty) {
              return PoAttachment(
                poDocuments: state.additionalDetailsData.poDocuments,
                poattachMentRenderMode: PoAttachMentRenderMode.edit,
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class _PoUploadButton extends StatefulWidget {
  const _PoUploadButton({Key? key}) : super(key: key);

  @override
  State<_PoUploadButton> createState() => __PoUploadButtonState();
}

class __PoUploadButtonState extends State<_PoUploadButton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => uploadFile(context),
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

  Future<void> uploadFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: _allowedExtensions,
    );
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
