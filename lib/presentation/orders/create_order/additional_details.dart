import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary/addition_details/additional_attachment.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_type_selector.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/runes_length_limiting_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AdditionalDetails extends StatelessWidget {
  final AdditionalDetailsState state;
  final SalesOrganisationConfigs config;

  const AdditionalDetails({
    Key? key,
    required this.state,
    required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: runtimeType.toString(),
      },
    );

    return Form(
      key: const Key('_additionalDetailsFormKey'),
      autovalidateMode: state.showErrorMessages
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          config.poNumberRequired ?
              _TextFormField(
                labelText: 'Customer PO Reference',
                keyText: 'customerPOReferenceKey',
                maxLength: 35,
                label: AdditionalDetailsLabel.customerPoReference,
                additionalDetails: state.additionalDetailsData,
              ) : const SizedBox.shrink(),
          config.enableSpecialInstructions
              ? _TextFormField(
                  labelText: 'Special Instructions',
                  keyText: 'specialInstructionKey',
                  keyboardType: TextInputType.multiline,
                  maxLength: 132,
                  label: AdditionalDetailsLabel.specialInstruction,
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          config.enableReferenceNote
              ? _TextFormField(
                  labelText: 'Reference Note',
                  keyText: 'referenceNoteKey',
                  maxLength: 132,
                  keyboardType: TextInputType.multiline,
                  label: AdditionalDetailsLabel.referenceNote,
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          config.enableCollectiveNumber &&
                  context.read<UserBloc>().state.user.role.type.isSalesRepRole
              ? _TextFormField(
                  labelText: 'Collective Number',
                  keyText: 'collectiveNumberKey',
                  maxLength: 16,
                  label: AdditionalDetailsLabel.collectiveNumber,
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          config.enableMobileNumber
              ? _TextFormField(
                  labelText: 'Contact Person',
                  keyText: 'contactPersonKey',
                  maxLength: 35,
                  label: AdditionalDetailsLabel.contactPerson,
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          config.enableMobileNumber
              ? _TextFormField(
                  labelText: 'Contact Number',
                  keyText: 'contactNumberKey',
                  maxLength: 16,
                  keyboardType: TextInputType.phone,
                  label: AdditionalDetailsLabel.contactNumber,
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          config.enableFutureDeliveryDay
              ? _DatePickerField(
                  futureDeliveryDay:
                      config.futureDeliveryDay.validatedFutureDeliveryDate,
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          config.enablePaymentTerms
              ? _PaymentTerm(
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          //OrderType
          context.read<EligibilityBloc>().state.isOrderTypeEnable
              ? Container(
                  margin: const EdgeInsets.only(top: 18),
                  child: const OrderTypeSelector(),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 9),
          context.read<EligibilityBloc>().state.showGreenDeliveryBox
              ? _GreenDeliveryBox(
                  key: const ValueKey('greenDeliveryBox'),
                  isLoading: state.isLoading,
                  isEnable: state.additionalDetailsData.greenDeliveryEnabled,
                  greenDeliveryDelayInDays:
                      config.greenDeliveryDelayInDays.toString(),
                  onTap: () {
                    context.read<AdditionalDetailsBloc>().add(
                          const AdditionalDetailsEvent.toggleGreenDelivery(),
                        );
                  },
                )
              : const SizedBox.shrink(),
          if (context
              .read<EligibilityBloc>()
              .state
              .salesOrgConfigs
              .showPOAttachment)
            const AdditionPoAttachmentUpload(),
        ],
      ),
    );
  }
}

class _TextFormField extends StatefulWidget {
  final String labelText;
  final String keyText;
  final AdditionalDetailsLabel label;
  final int maxLength;
  final TextInputType keyboardType;
  final AdditionalDetailsData additionalDetails;

  const _TextFormField({
    required this.labelText,
    required this.keyText,
    required this.label,
    required this.maxLength,
    this.keyboardType = TextInputType.text,
    required this.additionalDetails,
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
      case AdditionalDetailsLabel.customerPoReference:
        _controller = _getController(
          text: widget.additionalDetails.customerPoReference.getValue(),
        );
        break;
      case AdditionalDetailsLabel.specialInstruction:
        _controller = _getController(
          text: widget.additionalDetails.specialInstruction.getValue(),
        );
        break;
      case AdditionalDetailsLabel.collectiveNumber:
        _controller = _getController(
          text: widget.additionalDetails.collectiveNumber.getValue(),
        );
        break;
      case AdditionalDetailsLabel.contactNumber:
        _controller = _getController(
          text: widget.additionalDetails.contactNumber.getValue(),
        );
        break;
      case AdditionalDetailsLabel.contactPerson:
        _controller = _getController(
          text: widget.additionalDetails.contactPerson.getValue(),
        );
        break;
      case AdditionalDetailsLabel.referenceNote:
        _controller = _getController(
          text: widget.additionalDetails.referenceNote.getValue(),
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
    return Column(
      children: [
        BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return TextFormField(
              key: Key(widget.keyText),
              enabled: !state.isLoading,
              controller: _controller,
              keyboardType: widget.keyboardType,
              maxLength: widget.maxLength,
              inputFormatters: [
                RunesLengthLimitingTextInputFormatter(widget.maxLength),
              ],
              maxLines:
                  widget.keyboardType == TextInputType.multiline ? null : 1,
              buildCounter: (
                context, {
                required int currentLength,
                required int? maxLength,
                required bool isFocused,
              }) {
                return Text(
                  '${_controller.text.runes.length}/${widget.maxLength}',
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
              onChanged: (value) {
                context.read<AdditionalDetailsBloc>().add(
                      AdditionalDetailsEvent.onTextChange(
                        label: widget.label,
                        newValue: value,
                      ),
                    );
              },
              validator: (_) => _validateForm(
                label: widget.label,
                context: context,
              ),
              decoration: InputDecoration(
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
                suffixIconConstraints: const BoxConstraints(
                  minHeight: 0,
                  minWidth: 0,
                ),
                labelText: widget.labelText.tr(),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  String? _validateForm({
    required AdditionalDetailsLabel label,
    required BuildContext context,
  }) {
    switch (label) {
      case AdditionalDetailsLabel.customerPoReference:
        return context
            .read<AdditionalDetailsBloc>()
            .state
            .additionalDetailsData
            .customerPoReference
            .value
            .fold(
              (f) => f.maybeMap(
                empty: (_) => 'Customer PO Reference Required.'.tr(),
                orElse: () => null,
              ),
              (_) => null,
            );
      case AdditionalDetailsLabel.contactNumber:
        return context
            .read<AdditionalDetailsBloc>()
            .state
            .additionalDetailsData
            .contactNumber
            .value
            .fold(
              (f) => f.maybeMap(
                empty: (_) => 'Please enter valid contact number.'.tr(),
                orElse: () => null,
              ),
              (_) => null,
            );
      case AdditionalDetailsLabel.contactPerson:
        return context
            .read<AdditionalDetailsBloc>()
            .state
            .additionalDetailsData
            .contactPerson
            .value
            .fold(
              (f) => f.maybeMap(
                empty: (_) => 'Please enter contact person.'.tr(),
                orElse: () => null,
              ),
              (_) => null,
            );
      default:
        return null;
    }
  }
}

class _DatePickerField extends StatefulWidget {
  final AdditionalDetailsData additionalDetails;
  final String futureDeliveryDay;

  const _DatePickerField({
    required this.futureDeliveryDay,
    required this.additionalDetails,
    Key? key,
  }) : super(key: key);

  @override
  State<_DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<_DatePickerField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController.fromValue(TextEditingValue(
      text: widget.additionalDetails.deliveryDate.getValue(),
    ));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('_DatePickerFieldKey'),
      children: [
        BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
          buildWhen: (previous, current) =>
              previous.additionalDetailsData.greenDeliveryEnabled !=
                  current.additionalDetailsData.greenDeliveryEnabled ||
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return InkWell(
              key: const Key('requestedDeliveryDate'),
              onTap: state.additionalDetailsData.greenDeliveryEnabled ||
                      state.isLoading
                  ? null
                  : ([bool mounted = true]) async {
                      final dateTime = await getDateFromDatePicker(
                        context,
                      );
                      controller.text =
                          DateFormat('yyyy-MM-dd').format(dateTime);
                      if (!mounted) return;
                      context.read<AdditionalDetailsBloc>().add(
                            AdditionalDetailsEvent.onTextChange(
                              label: AdditionalDetailsLabel.deliveryDate,
                              newValue:
                                  DateFormat('yyyy-MM-dd').format(dateTime),
                            ),
                          );
                    },
              child: IgnorePointer(
                child: TextFormField(
                  enabled: !state.additionalDetailsData.greenDeliveryEnabled,
                  controller: controller,
                  style: TextStyle(
                    color: state.additionalDetailsData.greenDeliveryEnabled
                        ? Colors.grey
                        : Colors.black,
                  ),
                  decoration: InputDecoration(
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
                    suffixIconConstraints: const BoxConstraints(
                      minHeight: 0,
                      minWidth: 0,
                    ),
                    labelText: 'Requested Delivery Date'.tr(),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ZPColors.primary, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Future<DateTime> getDateFromDatePicker(
    BuildContext context,
  ) async {
    final futureDeliveryDay = widget.futureDeliveryDay;
    final orderDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: futureDeliveryDay.isEmpty
          ? DateTime.utc(275760, 09, 13)
          : DateTime.now().add(Duration(days: int.parse(futureDeliveryDay))),
      initialDate: widget.additionalDetails.deliveryDate.toDateTime,
    );

    return orderDate ?? widget.additionalDetails.deliveryDate.toDateTime;
  }
}

class _PaymentTerm extends StatelessWidget {
  final AdditionalDetailsData additionalDetails;

  const _PaymentTerm({
    required this.additionalDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, additionalDetailsState) {
        final isLoading = additionalDetailsState.isLoading;

        return BlocBuilder<PaymentTermBloc, PaymentTermState>(
          key: const Key('_paymentTermKey'),
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            final paymentTerm = additionalDetails.paymentTerm;

            return DropdownButtonFormField<String>(
              key: const Key('_paymentTermTextKey'),
              isExpanded: true,
              decoration: InputDecoration(
                labelText: 'Select Payment Term'.tr(),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              icon: isLoading
                  ? const SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : null,
              value: state.paymentTerms.displaySelected(paymentTerm),
              items: state.paymentTerms.display.map(
                (String val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              // onChanged: null,
              onChanged: isLoading
                  ? null
                  : (value) {
                      context.read<AdditionalDetailsBloc>().add(
                            AdditionalDetailsEvent.onTextChange(
                              label: AdditionalDetailsLabel.paymentTerm,
                              newValue: value!,
                            ),
                          );
                    },
              validator: (_) {
                return context
                    .read<AdditionalDetailsBloc>()
                    .state
                    .additionalDetailsData
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
            );
          },
        );
      },
    );
  }
}

class _GreenDeliveryBox extends StatelessWidget {
  final String greenDeliveryDelayInDays;
  final bool isEnable;
  final bool isLoading;
  final VoidCallback onTap;

  const _GreenDeliveryBox({
    Key? key,
    required this.greenDeliveryDelayInDays,
    required this.onTap,
    required this.isEnable,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: GestureDetector(
        key: const Key('greenDeliveryCheckBox'),
        onTap: () {
          if (isLoading) return;

          onTap.call();
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ZPColors.lightGreen,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/green_delivery.svg', height: 40),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isLoading
                            ? const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  side: const BorderSide(
                                    color: ZPColors.primary,
                                    width: 2,
                                  ),
                                  value: isEnable,
                                  onChanged: (bool? value) {
                                    if (isLoading) return;

                                    onTap.call();
                                  },
                                ),
                              ),
                        const SizedBox(width: 8),
                        Text(
                          'Green Delivery'.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ZPColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Help reduce the carbon footprint of your order.'.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: ZPColors.primary,
                      ),
                    ),
                    Text(
                      'Your order will be consolidated and delivered via the most optimal route to you within $greenDeliveryDelayInDays working days.'
                          .tr(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: ZPColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
