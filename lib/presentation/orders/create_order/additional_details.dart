import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_type_selector.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
    return Form(
      key: const Key('_additionalDetailsFormKey'),
      autovalidateMode: state.showErrorMessages
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          _TextFormField(
            labelText: 'Customer PO Reference',
            keyText: 'customerPOReferenceKey',
            maxLength: 35,
            label: AdditionalDetailsLabel.customerPoReference,
            additionalDetails: state.additionalDetailsData,
          ),
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
                  maxLength: 50,
                  keyboardType: TextInputType.multiline,
                  label: AdditionalDetailsLabel.referenceNote,
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          config.enableCollectiveNumber &&
                  context.read<UserBloc>().state.user.role.type.isSalesRep
              ? _TextFormField(
                  labelText: 'Collective Number',
                  keyText: 'collectiveNumberKey',
                  maxLength: 10,
                  label: AdditionalDetailsLabel.collectiveNumber,
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          config.enableMobileNumber
              ? _TextFormField(
                  labelText: 'Contact Person',
                  keyText: 'contactPersonKey',
                  maxLength: 50,
                  label: AdditionalDetailsLabel.contactPerson,
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          config.enableMobileNumber
              ? _TextFormField(
                  labelText: 'Contact Number',
                  keyText: 'contactNumberKey',
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  label: AdditionalDetailsLabel.contactNumber,
                  additionalDetails: state.additionalDetailsData,
                )
              : const SizedBox.shrink(),
          config.enableFutureDeliveryDay
              ? _DatePickerField(
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
  late TextEditingController _controller;

  TextEditingController _getController({required String text}) {
    return TextEditingController.fromValue(TextEditingValue(
      text: text,
    ));
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
    _initialValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: Key(widget.keyText),
          controller: _controller,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          maxLines: widget.keyboardType == TextInputType.multiline ? null : 1,
          onChanged: (value) {
            context.read<AdditionalDetailsBloc>().add(
                  AdditionalDetailsEvent.onTextChange(
                    label: widget.label,
                    newValue: value,
                  ),
                );
          },
          validator: (value) => _validateForm(
            value: value,
            label: widget.label,
            context: context,
          ),
          decoration: InputDecoration(
            labelText: widget.labelText.tr(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  String? _validateForm({
    required String? value,
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
  const _DatePickerField({
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
        InkWell(
          onTap: ([bool mounted = true]) async {
            final dateTime = await getDateFromDatePicker(
              true,
              widget.additionalDetails.deliveryDate.getValue(),
              context,
            );
            controller.text = DateFormat('yyyy-MM-dd').format(dateTime);
            if (!mounted) return;
            context.read<AdditionalDetailsBloc>().add(
                  AdditionalDetailsEvent.onTextChange(
                    label: AdditionalDetailsLabel.deliveryDate,
                    newValue: DateFormat('yyyy-MM-dd').format(dateTime),
                  ),
                );
          },
          child: IgnorePointer(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Requested Delivery Date'.tr(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Future<DateTime> getDateFromDatePicker(
    enableFutureDevlieryDay,
    futureDeliveryDay,
    BuildContext context,
  ) async {
    final orderDate = await showPlatformDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 100)),
      lastDate: DateTime.now().add(const Duration(days: 100)),
      initialDate: DateTime.now(),
    );

    return orderDate ?? DateTime.now();
  }
}

class _PaymentTerm extends StatelessWidget {
  final AdditionalDetailsData additionalDetails;
  const _PaymentTerm({
    required this.additionalDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentTermBloc, PaymentTermState>(
      key: const Key('_paymentTermKey'),
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          key: const Key('_paymentTermTextKey'),
          isExpanded: true,
          decoration: InputDecoration(
            labelText: 'Select Payment Term'.tr(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          value: additionalDetails.paymentTerm.getOrDefaultValue('').isEmpty
              ? null
              : additionalDetails.paymentTerm.getValue(),
          items: state.paymentTermsDisplayLevels.map(
            (String val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (value) {
            context.read<AdditionalDetailsBloc>().add(
                  AdditionalDetailsEvent.onTextChange(
                    label: AdditionalDetailsLabel.paymentTerm,
                    newValue: value!,
                  ),
                );
          },
          validator: (value) {
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
  }
}
