part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _UploadAttachmentSection extends StatelessWidget {
  const _UploadAttachmentSection({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReturnRequestAttachmentBloc,
        ReturnRequestAttachmentState>(
      listenWhen: (previous, current) =>
          previous.isFetching != current.isFetching &&
          previous.fileOperationMode == FileOperationMode.upload &&
          current.returnUuid == data.uuid,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (success) {
              context.read<NewRequestBloc>().add(
                    NewRequestEvent.toggleFiles(
                      included: true,
                      uuid: data.uuid,
                      files: state.uploadedFiles,
                    ),
                  );
              CustomSnackBar(
                messageText: 'File uploaded successfully'.tr(),
              ).show(context);
            },
          ),
        );
      },
      child: Column(
        children: [
          _AttachmentUploadButton(data: data),
          _UploadedFileList(
            data: context
                .read<NewRequestBloc>()
                .state
                .getReturnItemDetails(data.uuid),
          ),
        ],
      ),
    );
  }
}

class _AttachmentUploadButton extends StatelessWidget {
  const _AttachmentUploadButton({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        key: WidgetKeys.returnUploadAttachmentButton(data.uuid),
        onPressed: () {
          if (!context.read<ReturnRequestAttachmentBloc>().state.isFetching) {
            showPlatformDialog(
              context: context,
              barrierDismissible: true,
              useRootNavigator: true,
              builder: (BuildContext context) {
                return _AttachmentUploadOptionPicker(
                  uuid: data.uuid,
                  assignmentNumber: data.assignmentNumber,
                );
              },
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ZPColors.whiteBgCard,
        ),
        child: Text('Upload attachment'.tr()),
      ),
    );
  }
}

class _AttachmentUploadOptionPicker extends StatefulWidget {
  const _AttachmentUploadOptionPicker({
    Key? key,
    required this.uuid,
    required this.assignmentNumber,
  }) : super(key: key);
  final String uuid;
  final String assignmentNumber;

  @override
  State<_AttachmentUploadOptionPicker> createState() =>
      _AttachmentUploadOptionPickerState();
}

class _AttachmentUploadOptionPickerState
    extends State<_AttachmentUploadOptionPicker> {
  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      key: WidgetKeys.returnAttachmentUploadDialog,
      title: Text(
        'Upload Attachment'.tr(),
      ),
      content: Text(
        'Choose a photo or a file'.tr(),
      ),
      actions: [
        PlatformDialogAction(
          key: WidgetKeys.returnAttachmentPhotoUploadButton,
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
            uuid: widget.uuid,
            assignmentNumber: widget.assignmentNumber,
          ),
          cupertino: (_, __) => CupertinoDialogActionData(
            textStyle: const TextStyle(
              color: ZPColors.kPrimaryColor,
            ),
          ),
        ),
        PlatformDialogAction(
          key: WidgetKeys.returnAttachmentFileUploadButton,
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
            uuid: widget.uuid,
            uploadOptionType: UploadOptionType.file,
            assignmentNumber: widget.assignmentNumber,
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
    required String uuid,
    required String assignmentNumber,
  }) {
    context.read<ReturnRequestAttachmentBloc>().add(
          ReturnRequestAttachmentEvent.uploadFile(
            returnUuid: uuid,
            assignmentNumber: assignmentNumber,
            uploadOptionType: uploadOptionType,
            salesOrg: context.read<EligibilityBloc>().state.salesOrg,
          ),
        );
    context.router.pop();
  }
}

class _UploadedFileList extends StatelessWidget {
  const _UploadedFileList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ReturnItemDetails data;

  @override
  Widget build(BuildContext context) {
    return data.uploadedFiles.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                '${'Attachments'.tr()}:',
              ),
              ...data.uploadedFiles
                  .map(
                    (file) => Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      decoration: const BoxDecoration(
                        color: ZPColors.extraLightGray,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${file.name} - ${file.size.displayText}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ZPColors.darkerGreen,
                                  ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_outline_outlined),
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () {
                              context.read<ReturnRequestAttachmentBloc>().add(
                                    ReturnRequestAttachmentEvent.deleteFile(
                                      file: file,
                                    ),
                                  );
                              context.read<NewRequestBloc>().add(
                                    NewRequestEvent.toggleFiles(
                                      files: [file],
                                      included: false,
                                      uuid: data.uuid,
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          )
        : const SizedBox.shrink();
  }
}
