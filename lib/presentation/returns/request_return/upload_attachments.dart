import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item.dart';

import 'package:ezrxmobile/presentation/core/po_attachment.dart';

import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';

class UploadAttachments extends StatelessWidget {
  final ReturnItem returnItem;

  const UploadAttachments({
    Key? key,
    required this.returnItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PoAttachmentBloc, PoAttachmentState>(
      listenWhen: (previous, current) =>
          previous != current && current.fileUploaded,
      buildWhen: (previous, current) =>
          previous.fileInOperation != current.fileInOperation,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            context.read<RequestReturnBloc>().add(
                  RequestReturnEvent.uploadAttachments(
                    poDocuments: state.fileUrl,
                    uniqueId: returnItem.uniqueId,
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
              showSnackBar(
                context: context,
                message: failure.failureMessage.tr(),
              );
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            Card(
              child: _PoUploadButton(returnItem: returnItem, ctx: context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: PoAttachment(
                key: const ValueKey(
                  'orderSummaryAdditionalPoAttachment',
                ),
                poDocuments: returnItem.poDocuments,
                poAttachMentRenderMode: PoAttachMentRenderMode.edit,
                uploadingPocDocument: state.uploadInProgressPoDocument,
                uniqueId: returnItem.uniqueId,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PoUploadButton extends StatelessWidget {
  final ReturnItem returnItem;
  final BuildContext ctx;
  const _PoUploadButton({
    Key? key,
    required this.returnItem,
    required this.ctx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const ValueKey('poAttachmentUploadButton'),
      onTap: () {
        if (ctx.read<PoAttachmentBloc>().state.isFetching) return;
        showPlatformDialog(
          context: ctx,
          barrierDismissible: true,
          useRootNavigator: true,
          builder: (BuildContext context) {
            return _PoUploadOptionPicker(
              returnItem: returnItem,
              ctx: ctx,
            );
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
  final ReturnItem returnItem;
  final BuildContext ctx;
  const _PoUploadOptionPicker({
    Key? key,
    required this.ctx,
    required this.returnItem,
  }) : super(key: key);

  @override
  State<_PoUploadOptionPicker> createState() => _PoUploadOptionPickerState();
}

class _PoUploadOptionPickerState extends State<_PoUploadOptionPicker> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.ctx.read<PoAttachmentBloc>(),
      child: PlatformAlertDialog(
        key: const ValueKey('poAttachmentUploadDialog'),
        title: const Text(
          'Upload Attachment',
        ).tr(),
        content: const Text(
          'Choose a photo or a file',
        ).tr(),
        actions: [
          PlatformDialogAction(
            key: const Key('poAttachmentPhotoUploadButton'),
            child: Column(
              children: [
                const Icon(
                  Icons.image,
                  color: ZPColors.kPrimaryColor,
                ),
                const Text('Photos').tr(),
              ],
            ),
            onPressed: () => _uploadFile(
              uploadOptionType: UploadOptionType.gallery,
              returnItem: widget.returnItem,
              ctx: widget.ctx,
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
                const Text('Files').tr(),
              ],
            ),
            onPressed: () => _uploadFile(
              uploadOptionType: UploadOptionType.file,
              returnItem: widget.returnItem,
              ctx: widget.ctx,
            ),
            cupertino: (_, __) => CupertinoDialogActionData(
              textStyle: const TextStyle(color: ZPColors.kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  void _uploadFile({
    required UploadOptionType uploadOptionType,
    required ReturnItem returnItem,
    required BuildContext ctx,
  }) {
    ctx.read<PoAttachmentBloc>().add(
          PoAttachmentEvent.uploadFile(
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
            shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
            salesOrg:
                context.read<EligibilityBloc>().state.salesOrgConfigs.salesOrg,
            user: context.read<EligibilityBloc>().state.user,
            uploadedPODocument: returnItem.poDocuments,
            uploadOptionType: uploadOptionType,
          ),
        );
    ctx.router.pop();
  }
}
