import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class AddPaymentAdviceFooterPage extends StatelessWidget {
  const AddPaymentAdviceFooterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.addPaymentAdvice,
      appBar: AppBar(title: const Text('Add Payment Advice Details').tr()),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<ManagePaymentAdviceFooterBloc,
            ManagePaymentAdviceFooterState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting &&
              !current.isSubmitting,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {
              context.router.pop();
            },
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          ),
          buildWhen: (previous, current) =>
              previous.showErrorMessages != current.showErrorMessages,
          builder: (context, state) {
            return Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: ListView(
                padding: const EdgeInsets.all(25.0),
                children: const [
                  _SalesOrgSelection(),
                  SizedBox(height: 20),
                  _SalesDistrictSelection(),
                  SizedBox(height: 20),
                  _Header(),
                  SizedBox(height: 20),
                  _FooterText(),
                  SizedBox(height: 20),
                  _Notes(),
                  SizedBox(height: 20),
                  _SubmitPaymentAdviceFooterButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SalesOrgSelection extends StatelessWidget {
  const _SalesOrgSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManagePaymentAdviceFooterBloc,
        ManagePaymentAdviceFooterState>(
      listener: (context, state) {
        final salesDistrictDetailsList = context
            .read<SalesDistrictBloc>()
            .state
            .salesDistrictList
            .firstWhere(
              (element) =>
                  element.salesOrg == state.paymentAdviceFooterData.salesOrg,
              orElse: () => SalesDistrict.empty(),
            )
            .salesDistrictInfo;
        if (salesDistrictDetailsList.isEmpty) return;
        context.read<ManagePaymentAdviceFooterBloc>().add(
              ManagePaymentAdviceFooterEvent.salesDistrictOnChange(
                salesDistrictInfo: salesDistrictDetailsList.first,
              ),
            );
      },
      listenWhen: (previous, current) =>
          previous.paymentAdviceFooterData.salesOrg !=
              current.paymentAdviceFooterData.salesOrg &&
          current.paymentAdviceFooterData.salesOrg.isValid(),
      buildWhen: (previous, current) =>
          previous.paymentAdviceFooterData.salesOrg !=
          current.paymentAdviceFooterData.salesOrg,
      builder: (context, state) {
        final salesOrgs = context.read<UserBloc>().state.salesOrgValue;

        return DropdownButtonFormField2<String>(
          key: WidgetKeys.addPaymentAdviceSaleOrg(
            state.paymentAdviceFooterData.salesOrg.getOrDefaultValue(''),
          ),
          isExpanded: true,
          decoration: InputDecoration(
            labelText: 'Please Select Sales Org.'.tr(),
            enabled: salesOrgs.isNotEmpty,
            contentPadding: const EdgeInsets.fromLTRB(0, 10, 12, 10),
          ),
          iconStyleData: IconStyleData(
            icon: state.isSubmitting
                ? const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: ZPColors.black,
                  ),
          ),
          items: salesOrgs.map(
            (String val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(SalesOrg(val).fullName),
              );
            },
          ).toList(),
          onChanged: state.isSubmitting
              ? null
              : (value) => context.read<ManagePaymentAdviceFooterBloc>().add(
                    ManagePaymentAdviceFooterEvent.salesOrgOnChange(
                      salesOrg: SalesOrg(value ?? ''),
                    ),
                  ),
          validator: (_) => state.paymentAdviceFooterData.salesOrg.value.fold(
            (f) => f.maybeMap(
              empty: (_) => 'Please Select Sales Org.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          value: context
                  .read<ManagePaymentAdviceFooterBloc>()
                  .state
                  .paymentAdviceFooterData
                  .salesOrg
                  .isValid()
              ? context
                  .read<ManagePaymentAdviceFooterBloc>()
                  .state
                  .paymentAdviceFooterData
                  .salesOrg
                  .getOrDefaultValue('')
              : null,
        );
      },
    );
  }
}

class _SalesDistrictSelection extends StatelessWidget {
  const _SalesDistrictSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePaymentAdviceFooterBloc,
        ManagePaymentAdviceFooterState>(
      buildWhen: (previous, current) =>
          current.paymentAdviceFooterData.salesOrg !=
              previous.paymentAdviceFooterData.salesOrg ||
          current.paymentAdviceFooterData.salesDistrict !=
              previous.paymentAdviceFooterData.salesDistrict,
      builder: (context, state) {
        final salesDistrictList = context
            .read<SalesDistrictBloc>()
            .state
            .salesDistrictList
            .firstWhere(
              (element) =>
                  element.salesOrg == state.paymentAdviceFooterData.salesOrg,
              orElse: () => SalesDistrict.empty(),
            )
            .salesDistrictInfo;

        return DropdownButtonFormField2<SalesDistrictInfo>(
          isExpanded: true,
          decoration: InputDecoration(
            labelText: 'Please Select Sales District.'.tr(),
            enabled: salesDistrictList.isNotEmpty,
            contentPadding: const EdgeInsets.fromLTRB(0, 10, 12, 10),
          ),
          iconStyleData: IconStyleData(
            icon: state.isSubmitting
                ? const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: ZPColors.black,
                  ),
          ),
          items: salesDistrictList
              .map(
                (district) => DropdownMenuItem<SalesDistrictInfo>(
                  value: district,
                  child: Text(district.salesDistrictLabel.displayNAIfEmpty),
                ),
              )
              .toList(),
          onChanged: state.isSubmitting
              ? null
              : (val) => context.read<ManagePaymentAdviceFooterBloc>().add(
                    ManagePaymentAdviceFooterEvent.salesDistrictOnChange(
                      salesDistrictInfo: val ?? SalesDistrictInfo.empty(),
                    ),
                  ),
          value: state.paymentAdviceFooterData.salesDistrict ==
                  SalesDistrictInfo.empty()
              ? null
              : state.paymentAdviceFooterData.salesDistrict,
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePaymentAdviceFooterBloc,
        ManagePaymentAdviceFooterState>(
      buildWhen: (previous, current) =>
          previous.paymentAdviceFooterData.header !=
              current.paymentAdviceFooterData.header ||
          previous.paymentAdviceFooterData.paymentAdviceLogo !=
              current.paymentAdviceFooterData.paymentAdviceLogo ||
          previous.showErrorMessages != current.showErrorMessages ||
          previous.paymentAdviceFooterData.headerTextActive !=
              current.paymentAdviceFooterData.headerTextActive,
      builder: (context, state) {
        final managePaymentAdviceFooterBloc =
            context.read<ManagePaymentAdviceFooterBloc>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Do you want to add Header Text ?',
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr(),
              trailing: PlatformSwitch(
                activeColor: ZPColors.primary,
                value: state.paymentAdviceFooterData.headerTextActive,
                onChanged: (bool value) => managePaymentAdviceFooterBloc.add(
                  ManagePaymentAdviceFooterEvent.headerTextToggle(value),
                ),
              ),
            ),
            state.paymentAdviceFooterData.headerTextActive
                ? _GenericTextField(
                    fieldKey: 'headerText',
                    labelText: 'Header'.tr(),
                    enabled: !state.isSubmitting,
                    validator: (text) =>
                        state.paymentAdviceFooterData.header.value.fold(
                      (f) => f.maybeMap(
                        empty: (_) => 'Header cannot be empty.'.tr(),
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
                    onChanged: (val) => managePaymentAdviceFooterBloc.add(
                      ManagePaymentAdviceFooterEvent.onValueChange(
                        label: ManagePaymentAdviceFooterLabel.headerText,
                        newValue: val ?? '',
                      ),
                    ),
                  )
                : _UploadFile(
                    paymentAdviceFooterData: state.paymentAdviceFooterData,
                  ),
          ],
        );
      },
    );
  }
}

class _FooterText extends StatelessWidget {
  const _FooterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePaymentAdviceFooterBloc,
        ManagePaymentAdviceFooterState>(
      buildWhen: (previous, current) =>
          previous.paymentAdviceFooterData.footer !=
          current.paymentAdviceFooterData.footer,
      builder: (context, state) {
        return _GenericTextField(
          fieldKey: 'footer',
          labelText: 'Footer'.tr(),
          enabled: !state.isSubmitting,
          validator: (text) => state.paymentAdviceFooterData.footer.value.fold(
            (f) => f.maybeMap(
              empty: (_) => 'Footer cannot be empty.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          onChanged: (val) => context.read<ManagePaymentAdviceFooterBloc>().add(
                ManagePaymentAdviceFooterEvent.onValueChange(
                  label: ManagePaymentAdviceFooterLabel.footer,
                  newValue: val ?? '',
                ),
              ),
        );
      },
    );
  }
}

final HtmlEditorController _controller = HtmlEditorController();

class _Notes extends StatelessWidget {
  const _Notes({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Please Note',
          style: Theme.of(context).textTheme.bodyMedium,
        ).tr(),
        const SizedBox(height: 10),
        HtmlEditor(
          controller: _controller,
          htmlEditorOptions: HtmlEditorOptions(
            hint: 'Please Note'.tr(),
          ),
          callbacks: Callbacks(
            onChangeContent: (po) =>
                context.read<ManagePaymentAdviceFooterBloc>().add(
                      ManagePaymentAdviceFooterEvent.onValueChange(
                        label: ManagePaymentAdviceFooterLabel.note,
                        newValue: po ?? '',
                      ),
                    ),
            onFocus: () => FocusScope.of(context).unfocus(),
          ),
          htmlToolbarOptions: const HtmlToolbarOptions(
            toolbarType: ToolbarType.nativeGrid,
            defaultToolbarButtons: [
              FontButtons(
                clearAll: false,
                underline: false,
                strikethrough: false,
                superscript: false,
                subscript: false,
              ),
              ListButtons(
                listStyles: false,
                ol: false,
              ),
            ],
          ),
          otherOptions: OtherOptions(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

class _GenericTextField extends StatelessWidget {
  const _GenericTextField({
    required this.fieldKey,
    required this.labelText,
    required this.validator,
    required this.onChanged,
    required this.enabled,
  });
  final String fieldKey;
  final String labelText;
  final Function(String?) validator;
  final Function(String?) onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(fieldKey),
      autocorrect: false,
      enabled: enabled,
      decoration: InputDecoration(labelText: labelText.tr()),
      onChanged: onChanged,
      validator: (value) => validator(value),
    );
  }
}

class _SubmitPaymentAdviceFooterButton extends StatelessWidget {
  const _SubmitPaymentAdviceFooterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePaymentAdviceFooterBloc,
        ManagePaymentAdviceFooterState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ManagePaymentAdviceFooterBloc>().add(
                        const ManagePaymentAdviceFooterEvent.addOrUpdate(),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Submit').tr(),
          ),
        );
      },
    );
  }
}

class _UploadFile extends StatelessWidget {
  final PaymentAdviceFooter paymentAdviceFooterData;
  const _UploadFile({
    Key? key,
    required this.paymentAdviceFooterData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final files = paymentAdviceFooterData.paymentAdviceLogo.logoLocalFile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Upload Logo',
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
            const Spacer(),
            OutlinedButton(
              onPressed: () => showPlatformDialog(
                context: context,
                barrierDismissible: true,
                useRootNavigator: true,
                builder: (BuildContext context) {
                  return const _UploadOptionPicker();
                },
              ),
              child: const Text('Click to Upload').tr(),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        context.read<ManagePaymentAdviceFooterBloc>().state.showErrorMessages &&
                paymentAdviceFooterData.paymentAdviceLogo.logoLocalFile.isEmpty
            ? Text(
                'File Cannot be empty',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.error,
                    ),
              ).tr()
            : const SizedBox.shrink(),
        files.isNotEmpty
            ? Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Transform.rotate(
                      angle: -45,
                      child: const Icon(
                        Icons.attachment_outlined,
                        size: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      files.first.name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.darkerGreen,
                          ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline_outlined),
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () =>
                        context.read<ManagePaymentAdviceFooterBloc>().add(
                              const ManagePaymentAdviceFooterEvent
                                  .removePickedFile(),
                            ),
                  ),
                ],
              )
            : SizedBox.fromSize(),
      ],
    );
  }
}

class _UploadOptionPicker extends StatelessWidget {
  const _UploadOptionPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      key: WidgetKeys.addPaymentAdviceUploadDialog,
      title: Text(
        'Upload Header Logo'.tr(),
      ),
      content: Text(
        'Choose a photo or a file'.tr(),
      ),
      actions: [
        PlatformDialogAction(
          key: WidgetKeys.addPaymentAdvicePhotoUploadButton,
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
            pickFrom: PickFrom.gallery,
            context: context,
          ),
          cupertino: (_, __) => CupertinoDialogActionData(
            textStyle: const TextStyle(
              color: ZPColors.kPrimaryColor,
            ),
          ),
        ),
        PlatformDialogAction(
          key: WidgetKeys.addPaymentAdviceFileUploadButton,
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
            pickFrom: PickFrom.file,
            context: context,
          ),
          cupertino: (_, __) => CupertinoDialogActionData(
            textStyle: const TextStyle(color: ZPColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }

  void uploadFile({
    required PickFrom pickFrom,
    required BuildContext context,
  }) {
    context.read<ManagePaymentAdviceFooterBloc>().add(
          ManagePaymentAdviceFooterEvent.addFile(
            pickFrom: pickFrom,
          ),
        );
    context.router.pop();
  }
}
