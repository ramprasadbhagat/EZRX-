import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/request_delivery_date.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/po_upload_attachment_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class DeliveryInfo extends StatefulWidget {
  final Map<DeliveryInfoLabel, FocusNode> focusNodes;
  const DeliveryInfo({
    Key? key,
    required this.focusNodes,
  }) : super(key: key);

  @override
  State<DeliveryInfo> createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends State<DeliveryInfo> {
  final ValueNotifier<bool> _isDisplayDeliveryInfo = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _isDisplayDeliveryInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery information'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    _isDisplayDeliveryInfo.value =
                        !_isDisplayDeliveryInfo.value;
                  },
                  icon: ValueListenableBuilder<bool>(
                    builder: (context, value, child) => Icon(
                      _isDisplayDeliveryInfo.value
                          ? Icons.expand_less_outlined
                          : Icons.expand_more_outlined,
                    ),
                    valueListenable: _isDisplayDeliveryInfo,
                  ),
                  splashRadius: 24,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _isDisplayDeliveryInfo,
              builder: (context, value, child) => _isDisplayDeliveryInfo.value
                  ? BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
                      buildWhen: (previous, current) => previous != current,
                      builder: (context, state) {
                        final config =
                            context.read<SalesOrgBloc>().state.configs;

                        return Form(
                          key: WidgetKeys.additionalDetailsForm,
                          autovalidateMode: state.showErrorMessages
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                          child: Column(
                            children: [
                              _TextFormField(
                                labelText: 'PO reference',
                                keyText: 'pOReferenceKey',
                                hintText: 'Enter your PO reference',
                                label: DeliveryInfoLabel.poReference,
                                deliveryInfoData: state.deliveryInfoData,
                                focusNode: widget.focusNodes[
                                        DeliveryInfoLabel.poReference] ??
                                    FocusNode(),
                              ),
                              if (config.enableFutureDeliveryDay)
                                RequestDeliveryDate(
                                  deliveryInfoData: state.deliveryInfoData,
                                  futureDeliveryDay: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .configs
                                      .futureDeliveryDay
                                      .validatedFutureDeliveryDate,
                                ),
                              if (config.enableReferenceNote)
                                _TextFormField(
                                  labelText: 'Reference Note',
                                  keyText: 'referenceNoteKey',
                                  hintText: 'Enter reference note',
                                  label: DeliveryInfoLabel.referenceNote,
                                  deliveryInfoData: state.deliveryInfoData,
                                  focusNode: widget.focusNodes[
                                          DeliveryInfoLabel.referenceNote] ??
                                      FocusNode(),
                                ),
                              if (config.enablePaymentTerms)
                                _PaymentTerm(
                                  deliveryInfoData: state.deliveryInfoData,
                                  focusNode: widget.focusNodes[
                                          DeliveryInfoLabel.paymentTerm] ??
                                      FocusNode(),
                                ),
                              if (config.enableMobileNumber)
                                _TextFormField(
                                  labelText: 'Contact Person',
                                  keyText: 'contactPersonKey',
                                  hintText: 'Enter contact person name',
                                  label: DeliveryInfoLabel.contactPerson,
                                  deliveryInfoData: state.deliveryInfoData,
                                  focusNode: widget.focusNodes[
                                          DeliveryInfoLabel.contactPerson] ??
                                      FocusNode(),
                                ),
                              if (config.enableMobileNumber)
                                _MobileNumber(
                                  focusNode: widget.focusNodes[
                                          DeliveryInfoLabel.mobileNumber] ??
                                      FocusNode(),
                                ),
                              if (config.enableSpecialInstructions)
                                _TextFormField(
                                  labelText: 'Delivery instructions',
                                  keyText: 'deliveryInstructionKey',
                                  hintText: 'Enter delivery instructions',
                                  keyboardType: TextInputType.multiline,
                                  label: DeliveryInfoLabel.deliveryInstruction,
                                  deliveryInfoData: state.deliveryInfoData,
                                  focusNode: widget.focusNodes[DeliveryInfoLabel
                                          .deliveryInstruction] ??
                                      FocusNode(),
                                ),
                              if (config.showPOAttachment)
                                const PoAttachmentUpload(),
                            ],
                          ),
                        );
                      },
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextFormField extends StatefulWidget {
  final String labelText;
  final String keyText;
  final String hintText;
  final DeliveryInfoLabel label;
  final TextInputType keyboardType;
  final DeliveryInfoData deliveryInfoData;
  final FocusNode focusNode;

  const _TextFormField({
    required this.labelText,
    required this.keyText,
    required this.label,
    this.keyboardType = TextInputType.text,
    required this.deliveryInfoData,
    this.hintText = '',
    required this.focusNode,
    Key? key,
  }) : super(key: key);

  @override
  State<_TextFormField> createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<_TextFormField> {
  TextEditingController _controller = TextEditingController();

  TextEditingController _getController({required String text}) {
    return TextEditingController.fromValue(
      TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(
          offset: _controller.selection.base.offset,
        ),
      ),
    );
  }

  void _initialValue() {
    switch (widget.label) {
      case DeliveryInfoLabel.poReference:
        _controller = _getController(
          text: widget.deliveryInfoData.poReference.getValue(),
        );
        break;
      case DeliveryInfoLabel.deliveryInstruction:
        _controller = _getController(
          text: widget.deliveryInfoData.deliveryInstruction.getValue(),
        );
        break;
      case DeliveryInfoLabel.contactPerson:
        _controller = _getController(
          text: widget.deliveryInfoData.contactPerson.getValue(),
        );
        break;
      case DeliveryInfoLabel.referenceNote:
        _controller = _getController(
          text: widget.deliveryInfoData.referenceNote.getValue(),
        );
        break;
      default:
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initialValue();
  }

  @override
  void didUpdateWidget(covariant _TextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initialValue();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextFieldWithLabel(
            focusNode: widget.focusNode,
            fieldKey: Key(widget.keyText),
            labelText: widget.labelText.tr(),
            controller: _controller,
            validator: (_) => _validateForm(
              label: widget.label,
              context: context,
            ),
            maxLines: widget.keyboardType == TextInputType.multiline ? 3 : 1,
            keyboardType: widget.keyboardType,
            onChanged: (value) {
              context.read<AdditionalDetailsBloc>().add(
                    AdditionalDetailsEvent.onTextChange(
                      label: widget.label,
                      newValue: value,
                    ),
                  );
            },
            decoration: InputDecoration(
              hintText: widget.hintText.tr(),
              suffixIcon: state.isLoading
                  ? const Padding(
                      padding: EdgeInsetsDirectional.only(end: 10),
                      child: SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }

  String? _validateForm({
    required DeliveryInfoLabel label,
    required BuildContext context,
  }) {
    switch (label) {
      case DeliveryInfoLabel.poReference:
        return context.read<SalesOrgBloc>().state.configs.poNumberRequired
            ? context
                .read<AdditionalDetailsBloc>()
                .state
                .deliveryInfoData
                .poReference
                .value
                .fold(
                  (f) => f.maybeMap(
                    empty: (_) => 'PO reference is a required field.'.tr(),
                    orElse: () => null,
                  ),
                  (_) => null,
                )
            : null;

      case DeliveryInfoLabel.contactPerson:
        return context
            .read<AdditionalDetailsBloc>()
            .state
            .deliveryInfoData
            .contactPerson
            .value
            .fold(
              (f) => f.maybeMap(
                empty: (_) => 'Contact person is a required field'.tr(),
                orElse: () => null,
              ),
              (_) => null,
            );
      case DeliveryInfoLabel.deliveryInstruction:
        return context
            .read<AdditionalDetailsBloc>()
            .state
            .deliveryInfoData
            .deliveryInstruction
            .value
            .fold(
              (f) => f.maybeMap(
                empty: (_) => 'Delivery instructions is a required field'.tr(),
                orElse: () => null,
              ),
              (_) => null,
            );
      case DeliveryInfoLabel.referenceNote:
        return context
            .read<AdditionalDetailsBloc>()
            .state
            .deliveryInfoData
            .referenceNote
            .value
            .fold(
              (f) => f.maybeMap(
                empty: (_) => 'Reference note is a required field'.tr(),
                orElse: () => null,
              ),
              (_) => null,
            );
      default:
        return null;
    }
  }
}

class _PaymentTerm extends StatelessWidget {
  final DeliveryInfoData deliveryInfoData;
  final FocusNode focusNode;

  const _PaymentTerm({
    required this.deliveryInfoData,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, additionalDetailsState) {
        final isLoading = additionalDetailsState.isLoading;

        return BlocBuilder<PaymentTermBloc, PaymentTermState>(
          key: WidgetKeys.paymentTermKey,
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            final paymentTerm = deliveryInfoData.paymentTerm;

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment term'.tr(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    focusNode: focusNode,
                    key: WidgetKeys.paymentTermDropdownKey,
                    isExpanded: true,
                    decoration: InputDecoration(
                      hintText: 'Select one'.tr(),
                    ),
                    icon: isLoading
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(
                            Icons.expand_more_outlined,
                            size: 22,
                            color: ZPColors.primary,
                          ),
                    value: state.paymentTerms.displaySelected(paymentTerm),
                    items: state.paymentTerms.display.map(
                      (String val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: isLoading
                        ? null
                        : (value) {
                            context.read<AdditionalDetailsBloc>().add(
                                  AdditionalDetailsEvent.onTextChange(
                                    label: DeliveryInfoLabel.paymentTerm,
                                    newValue: value!,
                                  ),
                                );
                          },
                    validator: (_) {
                      return context
                          .read<AdditionalDetailsBloc>()
                          .state
                          .deliveryInfoData
                          .paymentTerm
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              empty: (_) => 'Please Select Payment Term.'.tr(),
                              orElse: () => null,
                            ),
                            (_) => null,
                          );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _MobileNumber extends StatelessWidget {
  final FocusNode focusNode;
  const _MobileNumber({required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
      buildWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, additionalDetailsState) {
        final isLoading = additionalDetailsState.isLoading;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            key: WidgetKeys.mobileNumber,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mobile number'.tr(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: 8,
              ),
              InternationalPhoneNumberInput(
                focusNode: focusNode,
                countries: const ['MY'],
                onInputValidated: (bool value) {},
                autoValidateMode: additionalDetailsState.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                ignoreBlank: false,
                onInputChanged: isLoading
                    ? null
                    : (value) {
                        if (value.phoneNumber == value.dialCode) {
                          context.read<AdditionalDetailsBloc>().add(
                                AdditionalDetailsEvent.onTextChange(
                                  label: DeliveryInfoLabel.mobileNumber,
                                  newValue: value.phoneNumber!
                                      .replaceAll(value.dialCode ?? '', ''),
                                ),
                              );
                        } else {
                          context.read<AdditionalDetailsBloc>().add(
                                AdditionalDetailsEvent.onTextChange(
                                  label: DeliveryInfoLabel.mobileNumber,
                                  newValue: value.phoneNumber!,
                                ),
                              );
                        }
                      },
                formatInput: false,
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                  leadingPadding: 16,
                  showFlags: true,
                  setSelectorButtonAsPrefixIcon: true,
                ),
                inputDecoration: InputDecoration(
                  hintText: 'Enter contact person number'.tr(),
                ),
                validator: (_) {
                  return context
                      .read<AdditionalDetailsBloc>()
                      .state
                      .deliveryInfoData
                      .mobileNumber
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          empty: (_) =>
                              'Mobile number is a required field'.tr(),
                          orElse: () => null,
                        ),
                        (_) => null,
                      );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
