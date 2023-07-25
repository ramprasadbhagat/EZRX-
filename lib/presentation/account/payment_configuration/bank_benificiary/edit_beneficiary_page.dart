import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditBeneficiaryPage extends StatelessWidget {
  const EditBeneficiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('editBeneficiary'),
      appBar: AppBar(title: Text('Edit Bank Beneficiary'.tr())),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child:
            BlocConsumer<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {
                if (!state.isSubmitting) {
                  context.router.pop();
                }
              },
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          builder: (context, state) {
            return Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: ListView(
                padding: const EdgeInsets.all(25.0),
                children: [
                  _SalesOrgDropdown(
                    state: state,
                  ),
                  const SizedBox(height: 20),
                  _SalesDistrictDropdown(
                    state: state,
                  ),
                  const SizedBox(height: 20),
                  _BeneficiaryDetailsTextFields(
                    state: state,
                  ),
                  const SizedBox(height: 20),
                  const _EditBeneficiaryButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SalesOrgDropdown extends StatelessWidget {
  final ManageBankBeneficiaryState state;
  const _SalesOrgDropdown({
    Key? key,
    required this.state,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      key: const Key('salesOrgDropdownKey'),
      isExpanded: true,
      decoration: InputDecoration(
        labelText: 'Select Sales Org'.tr(),
        enabled: false,
        contentPadding: const EdgeInsets.fromLTRB(0, 10, 12, 10),
      ),
      items: [
        DropdownMenuItem(
          child: Text(
            state.beneficiaryData.salesOrg.fullName,
          ),
        ),
      ],
      onChanged: null,
    );
  }
}

class _SalesDistrictDropdown extends StatelessWidget {
  final ManageBankBeneficiaryState state;
  const _SalesDistrictDropdown({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        final salesDistrictLabel =
            !state.isFetching ? state.salesDistrictLabel : '';

        return DropdownButtonFormField2<String>(
          key: const Key('salesDistrictDropdownKey'),
          isExpanded: true,
          decoration: InputDecoration(
            labelText: 'Select Sales District'.tr(),
            enabled: false,
            contentPadding: const EdgeInsets.fromLTRB(0, 10, 12, 10),
          ),
          items: !state.isFetching
              ? [
                  DropdownMenuItem(
                    child: Text(
                      salesDistrictLabel,
                    ),
                  ),
                ]
              : [],
          onChanged: null,
        );
      },
    );
  }
}

class _BeneficiaryDetailsTextFields extends StatelessWidget {
  final ManageBankBeneficiaryState state;
  const _BeneficiaryDetailsTextFields({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TextFormField(
          labelText: 'Beneficiary Name'.tr(),
          keyText: 'editBeneficiaryNameField',
          label: BeneficiaryLabel.beneficiaryName,
          beneficiaryDetails: state.beneficiaryData,
        ),
        _TextFormField(
          labelText: 'Bank Name'.tr(),
          keyText: 'editBankNameField',
          label: BeneficiaryLabel.bankName,
          beneficiaryDetails: state.beneficiaryData,
        ),
        _TextFormField(
          labelText: 'Branch'.tr(),
          keyText: 'editBranchField',
          label: BeneficiaryLabel.branch,
          beneficiaryDetails: state.beneficiaryData,
        ),
        _TextFormField(
          labelText: 'Bank Code'.tr(),
          keyText: 'editBankCodeField',
          label: BeneficiaryLabel.bankCode,
          beneficiaryDetails: state.beneficiaryData,
        ),
        _TextFormField(
          labelText: 'Bank Account'.tr(),
          keyText: 'editBankAccountField',
          label: BeneficiaryLabel.bankAccount,
          beneficiaryDetails: state.beneficiaryData,
        ),
        _TextFormField(
          labelText: 'hdbc Swift Code'.tr(),
          keyText: 'editHdbcSwiftCodeField',
          label: BeneficiaryLabel.hdbcSwiftCode,
          beneficiaryDetails: state.beneficiaryData,
        ),
        _TextFormField(
          labelText: 'Bank Address'.tr(),
          keyText: 'editBankAddressField',
          label: BeneficiaryLabel.bankAddress,
          beneficiaryDetails: state.beneficiaryData,
        ),
        _TextFormField(
          labelText: 'Pay Now Uen'.tr(),
          keyText: 'editPayNowUenField',
          label: BeneficiaryLabel.payNowUen,
          beneficiaryDetails: state.beneficiaryData,
        ),
        _TextFormField(
          labelText: 'Email Id'.tr(),
          keyText: 'editEmailIdField',
          label: BeneficiaryLabel.emailId,
          beneficiaryDetails: state.beneficiaryData,
        ),
      ],
    );
  }
}

class _EditBeneficiaryButton extends StatelessWidget {
  const _EditBeneficiaryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('editBeneficiaryButton'),
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ManageBankBeneficiaryBloc>().add(
                        const ManageBankBeneficiaryEvent.addOrUpdateBeneficiary(
                          isEdit: true,
                        ),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: Text('Submit'.tr()),
          ),
        );
      },
    );
  }
}

class _TextFormField extends StatefulWidget {
  final String labelText;
  final String keyText;
  final BeneficiaryLabel label;
  final BankBeneficiary beneficiaryDetails;

  const _TextFormField({
    required this.labelText,
    required this.keyText,
    required this.label,
    required this.beneficiaryDetails,
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
      case BeneficiaryLabel.beneficiaryName:
        _controller = _getController(
          text: widget.beneficiaryDetails.beneficiaryName.getValue(),
        );
        break;
      case BeneficiaryLabel.bankName:
        _controller = _getController(
          text: widget.beneficiaryDetails.bankName.getValue(),
        );
        break;
      case BeneficiaryLabel.branch:
        _controller = _getController(
          text: widget.beneficiaryDetails.branch,
        );
        break;
      case BeneficiaryLabel.bankCode:
        _controller = _getController(
          text: widget.beneficiaryDetails.bankCode,
        );
        break;
      case BeneficiaryLabel.bankAccount:
        _controller = _getController(
          text: widget.beneficiaryDetails.bankAccount.getValue(),
        );
        break;
      case BeneficiaryLabel.hdbcSwiftCode:
        _controller = _getController(
          text: widget.beneficiaryDetails.hdbcSwiftCode,
        );
        break;
      case BeneficiaryLabel.bankAddress:
        _controller = _getController(
          text: widget.beneficiaryDetails.bankAddress,
        );
        break;
      case BeneficiaryLabel.payNowUen:
        _controller = _getController(
          text: widget.beneficiaryDetails.payNowUen,
        );
        break;
      case BeneficiaryLabel.emailId:
        _controller = _getController(
          text: widget.beneficiaryDetails.emailId.getValue(),
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
        BlocBuilder<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
          buildWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          builder: (context, state) {
            return TextFormField(
              key: Key(widget.keyText),
              autocorrect: false,
              enabled: !state.isSubmitting,
              controller: _controller,
              onChanged: (value) {
                context.read<ManageBankBeneficiaryBloc>().add(
                      ManageBankBeneficiaryEvent.onValueChange(
                        label: widget.label,
                        newValue: value,
                      ),
                    );
              },
              decoration: InputDecoration(
                suffixIcon: state.isSubmitting
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
              ),
              validator: (value) {
                if (widget.label == BeneficiaryLabel.emailId) {
                  return context
                      .read<ManageBankBeneficiaryBloc>()
                      .state
                      .beneficiaryData
                      .emailId
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          invalidEmail: (_) => 'Email is invalid'.tr(),
                          orElse: () => null,
                        ),
                        (_) => null,
                      );
                }

                return null;
              },
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
