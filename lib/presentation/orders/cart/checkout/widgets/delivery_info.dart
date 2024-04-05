part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _DeliveryInfo extends StatefulWidget {
  final Map<DeliveryInfoLabel, FocusNode> focusNodes;
  const _DeliveryInfo({
    Key? key,
    required this.focusNodes,
  }) : super(key: key);

  @override
  State<_DeliveryInfo> createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends State<_DeliveryInfo> {
  final ValueNotifier<bool> _isDisplayDeliveryInfo = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _isDisplayDeliveryInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr('Delivery information'),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
                IconButton(
                  key: WidgetKeys.checkoutDeliveryArrowButton,
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
                        final config = context
                            .read<EligibilityBloc>()
                            .state
                            .salesOrgConfigs;

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
                                hintText:
                                    config.poNumberRequired.poReferenceHintText,
                                label: DeliveryInfoLabel.poReference,
                                deliveryInfoData: state.deliveryInfoData,
                                focusNode: widget.focusNodes[
                                        DeliveryInfoLabel.poReference] ??
                                    FocusNode(),
                                maxLength: 35,
                              ),
                              if (config.enableFutureDeliveryDay)
                                const _RequestDeliveryDate(),
                              if (config.enableReferenceNote)
                                _TextFormField(
                                  labelText: 'Reference note',
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
                                  labelText: 'Contact person',
                                  keyText: 'contactPersonKey',
                                  hintText: 'Enter contact person name',
                                  maxLength: 35,
                                  label: DeliveryInfoLabel.contactPerson,
                                  deliveryInfoData: state.deliveryInfoData,
                                  focusNode: widget.focusNodes[
                                          DeliveryInfoLabel.contactPerson] ??
                                      FocusNode(),
                                ),
                              if (config.enableMobileNumber)
                                _TextFormField(
                                  labelText: 'Contact number',
                                  keyText: 'contactNumberKey',
                                  hintText: 'Enter contact person number',
                                  maxLength: 16,
                                  label: DeliveryInfoLabel.mobileNumber,
                                  keyboardType: TextInputType.phone,
                                  deliveryInfoData: state.deliveryInfoData,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  focusNode: widget.focusNodes[
                                          DeliveryInfoLabel.mobileNumber] ??
                                      FocusNode(),
                                ),
                              if (config.enableSpecialInstructions)
                                _TextFormField(
                                  labelText: 'Delivery instructions',
                                  keyText: 'deliveryInstructionKey',
                                  hintText:
                                      'Enter delivery instructions(Optional)',
                                  keyboardType: TextInputType.multiline,
                                  label: DeliveryInfoLabel.deliveryInstruction,
                                  deliveryInfoData: state.deliveryInfoData,
                                  focusNode: widget.focusNodes[DeliveryInfoLabel
                                          .deliveryInstruction] ??
                                      FocusNode(),
                                  maxLength: 132,
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
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  const _TextFormField({
    required this.labelText,
    required this.keyText,
    required this.label,
    this.keyboardType = TextInputType.text,
    required this.deliveryInfoData,
    this.hintText = '',
    required this.focusNode,
    this.maxLength,
    this.inputFormatters,
    Key? key,
  }) : super(key: key);

  @override
  State<_TextFormField> createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<_TextFormField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _updateValue();
  }

  @override
  void didUpdateWidget(covariant _TextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    //This check is required for keyboard with Chinese character to work
    //This prevent _updateValue() called every time the data is updated, only update
    //the controller whenever new text is different from the current text stored inside controller
    if (_data != _controller.text) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateValue();
      });
    }
  }

  void _updateValue() {
    _controller.value = TextEditingValue(
      text: _data,
      selection: TextSelection.collapsed(offset: _data.length),
    );
  }

  String get _data {
    switch (widget.label) {
      case DeliveryInfoLabel.poReference:
        return widget.deliveryInfoData.poReference.getValue();
      case DeliveryInfoLabel.deliveryInstruction:
        return widget.deliveryInfoData.deliveryInstruction.getValue();
      case DeliveryInfoLabel.contactPerson:
        return widget.deliveryInfoData.contactPerson.getValue();
      case DeliveryInfoLabel.referenceNote:
        return widget.deliveryInfoData.referenceNote.getValue();
      case DeliveryInfoLabel.mobileNumber:
        return widget.deliveryInfoData.mobileNumber.getValue();
      default:
        return '';
    }
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
            fieldKey: WidgetKeys.genericKey(key: widget.keyText),
            labelText: context.tr(widget.labelText),
            controller: _controller,
            validator: (_) => _validateForm(
              label: widget.label,
              context: context,
            ),
            maxLines: widget.keyboardType == TextInputType.multiline ? 3 : 1,
            keyboardType: widget.keyboardType,
            maxLength: widget.maxLength,
            onChanged: (value) {
              context.read<AdditionalDetailsBloc>().add(
                    AdditionalDetailsEvent.onTextChange(
                      label: widget.label,
                      newValue: value,
                    ),
                  );
            },
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 10, top: 12, bottom: 12),
              hintText: context.tr(widget.hintText),
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
    final config = context.read<EligibilityBloc>().state.salesOrgConfigs;
    switch (label) {
      case DeliveryInfoLabel.poReference:
        return config.poNumberRequired.getOrDefaultValue(false)
            ? context
                .read<AdditionalDetailsBloc>()
                .state
                .deliveryInfoData
                .poReference
                .value
                .fold(
                  (f) => f.maybeMap(
                    empty: (_) =>
                        context.tr('PO reference is a required field.'),
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
                empty: (_) => context.tr('Contact person is a required field'),
                orElse: () => null,
              ),
              (_) => null,
            );
      case DeliveryInfoLabel.mobileNumber:
        return context
            .read<AdditionalDetailsBloc>()
            .state
            .deliveryInfoData
            .mobileNumber
            .value
            .fold(
              (f) => f.maybeMap(
                empty: (_) => context.tr('Contact number is a required field'),
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
                empty: (_) => context.tr('Reference note is a required field'),
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
                    context.tr('Payment term'),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    focusNode: focusNode,
                    key: WidgetKeys.paymentTermDropdownKey,
                    isExpanded: true,
                    decoration: InputDecoration(
                      hintText: context.tr('Select one'),
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
                              empty: (_) =>
                                  context.tr('Please Select Payment Term'),
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
