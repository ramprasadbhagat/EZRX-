import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code/manage_deduction_code_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/view_deduction_code/deduction_code_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/amount_type.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDeductionCodePage extends StatelessWidget {
  const AddDeductionCodePage({Key? key}) : super(key: key);

  void _handleListener({
    required BuildContext context,
    required ManageDeductionCodeState state,
  }) {
    state.failureOrSuccessOption.fold(
      () {
        if (!state.isSubmitting && state.response.success) {
          showSnackBar(
            context: context,
            message: 'Deduction code added successfully'.tr(),
          );
          context
              .read<DeductionCodeBloc>()
              .add(const DeductionCodeEvent.fetch());
          context.router.pop();
        } else {
          final salesDistrictDetailsList = context
              .read<SalesDistrictBloc>()
              .state
              .salesDistrictList
              .firstWhere(
                (element) =>
                    element.salesOrg == state.deductionCodeData.salesOrg,
                orElse: () => SalesDistrict.empty(),
              )
              .salesDistrictInfo;
          final salesDistrict = salesDistrictDetailsList.isEmpty
              ? ''
              : salesDistrictDetailsList
                  .first.salesDistrictLabel.displayStringValue;
          context.read<ManageDeductionCodeBloc>().add(
                ManageDeductionCodeEvent.onValueChange(
                  label: AddDeductionCodeLabel.salesDistrict,
                  newValue: salesDistrict,
                ),
              );
        }
      },
      (either) => either.fold(
        (failure) {
          ErrorUtils.handleApiFailure(context, failure);
        },
        (success) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('addDeductionCode'),
      appBar: AppBar(title: const Text('Add Deduction Code').tr()),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<ManageDeductionCodeBloc, ManageDeductionCodeState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting ||
              previous.deductionCodeData.salesOrg !=
                  current.deductionCodeData.salesOrg,
          listener: (context, state) => _handleListener(
            context: context,
            state: state,
          ),
          buildWhen: (previous, current) =>
              previous.showErrorMessages != current.showErrorMessages ||
              previous.deductionCodeData != current.deductionCodeData ||
              previous.isSubmitting != current.isSubmitting,
          builder: (context, state) {
            final salesOrgList = context.read<UserBloc>().state.salesOrgValue;
            final salesDistrictList = context
                .read<SalesDistrictBloc>()
                .state
                .salesDistrictList
                .firstWhere(
                  (element) =>
                      element.salesOrg == state.deductionCodeData.salesOrg,
                  orElse: () => SalesDistrict.empty(),
                )
                .salesDistrictInfo;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    _GenericDropdown(
                      labelText: 'Select Sales Org'.tr(),
                      validator: (_) => context
                          .read<ManageDeductionCodeBloc>()
                          .state
                          .deductionCodeData
                          .salesOrg
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              empty: (_) => 'Please Select Sales Org.'.tr(),
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                      onChanged: (val) =>
                          context.read<ManageDeductionCodeBloc>().add(
                                ManageDeductionCodeEvent.onValueChange(
                                  label: AddDeductionCodeLabel.salesOrg,
                                  newValue: val ?? '',
                                ),
                              ),
                      items: salesOrgList
                          .map(
                            (val) => _GenericDropdownData(
                              value: val,
                              label: '$val - ${SalesOrg(val).buName}',
                            ),
                          )
                          .toList(),
                      state: state,
                      value: context
                          .read<ManageDeductionCodeBloc>()
                          .state
                          .deductionCodeData
                          .salesOrg
                          .getOrDefaultValue(''),
                    ),
                    const SizedBox(height: 20),
                    _GenericDropdown(
                      labelText: 'Select Sales District'.tr(),
                      validator: (_) => null,
                      onChanged: (val) =>
                          context.read<ManageDeductionCodeBloc>().add(
                                ManageDeductionCodeEvent.onValueChange(
                                  label: AddDeductionCodeLabel.salesDistrict,
                                  newValue: val ?? '',
                                ),
                              ),
                      items: salesDistrictList
                          .map(
                            (district) => _GenericDropdownData(
                              value: district
                                  .salesDistrictLabel.displayStringValue,
                              label: district.salesDistrictLabel.displayLabel,
                            ),
                          )
                          .toList(),
                      state: state,
                      value: context
                          .read<ManageDeductionCodeBloc>()
                          .state
                          .deductionCodeData
                          .salesDistrict
                          .getOrDefaultValue(''),
                    ),
                    const SizedBox(height: 20),
                    _GenericTextField(
                      fieldKey: 'deductionCodeTextKey',
                      labelText: 'Deduction Code'.tr(),
                      validator: (text) => context
                          .read<ManageDeductionCodeBloc>()
                          .state
                          .deductionCodeData
                          .deductionCode
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              empty: (_) =>
                                  'Deduction code cannot be empty.'.tr(),
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                      onChanged: (val) =>
                          context.read<ManageDeductionCodeBloc>().add(
                                ManageDeductionCodeEvent.onValueChange(
                                  label: AddDeductionCodeLabel.deductionCode,
                                  newValue: val ?? '',
                                ),
                              ),
                    ),
                    const SizedBox(height: 20),
                    _GenericDropdown(
                      labelText: 'Amount Type'.tr(),
                      validator: (_) => context
                          .read<ManageDeductionCodeBloc>()
                          .state
                          .deductionCodeData
                          .amountType
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              empty: (_) => 'Please Select amount type.'.tr(),
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                      onChanged: (val) =>
                          context.read<ManageDeductionCodeBloc>().add(
                                ManageDeductionCodeEvent.onValueChange(
                                  label: AddDeductionCodeLabel.amountType,
                                  newValue: val ?? '',
                                ),
                              ),
                      items: [
                        for (final type in AmountType.values)
                          _GenericDropdownData(
                            value: type.name,
                            label: type.name,
                          ),
                      ],
                      state: state,
                      value: context
                          .read<ManageDeductionCodeBloc>()
                          .state
                          .deductionCodeData
                          .amountType
                          .getOrDefaultValue(''),
                    ),
                    const SizedBox(height: 20),
                    _GenericTextField(
                      fieldKey: 'deductionDescriptionKey',
                      labelText: 'Deduction Description'.tr(),
                      validator: (text) => context
                          .read<ManageDeductionCodeBloc>()
                          .state
                          .deductionCodeData
                          .deductionDescription
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              empty: (_) =>
                                  'Deduction Description cannot be empty.'.tr(),
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                      onChanged: (val) => context
                          .read<ManageDeductionCodeBloc>()
                          .add(
                            ManageDeductionCodeEvent.onValueChange(
                              label: AddDeductionCodeLabel.deductionDescription,
                              newValue: val ?? '',
                            ),
                          ),
                    ),
                    const SizedBox(height: 20),
                    const AddDeductionCodeButton(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _GenericDropdownData {
  _GenericDropdownData({
    required this.value,
    required this.label,
  });
  final String value;
  final String label;
}

class _GenericDropdown extends StatelessWidget {
  const _GenericDropdown({
    Key? key,
    required this.labelText,
    required this.validator,
    required this.onChanged,
    required this.items,
    required this.state,
    required this.value,
  }) : super(key: key);
  final String labelText;
  final Function(String?) validator;
  final Function(String?) onChanged;
  final List<_GenericDropdownData> items;
  final ManageDeductionCodeState state;
  final String value;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: state.isSubmitting,
      child: DropdownButtonFormField<String>(
        key: key,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: items.isEmpty ? 'No Data Available'.tr() : labelText,
          enabled: items.isNotEmpty,
        ),
        icon: state.isSubmitting
            ? const SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : null,
        items: items.map(
          (item) {
            return DropdownMenuItem<String>(
              value: item.value,
              child: Text(item.label),
            );
          },
        ).toList(),
        onChanged: state.isSubmitting ? null : onChanged,
        validator: (value) => validator(value),
        value: value.isEmpty ? null : value,
      ),
    );
  }
}

class _GenericTextField extends StatelessWidget {
  const _GenericTextField({
    required this.fieldKey,
    required this.labelText,
    required this.validator,
    required this.onChanged,
  });
  final String fieldKey;
  final String labelText;
  final Function(String?) validator;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageDeductionCodeBloc, ManageDeductionCodeState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFormField(
          key: Key(fieldKey),
          autocorrect: false,
          enabled: !state.isSubmitting,
          decoration: InputDecoration(labelText: labelText.tr()),
          onChanged: onChanged,
          validator: (value) => validator(value),
        );
      },
    );
  }
}

class AddDeductionCodeButton extends StatelessWidget {
  const AddDeductionCodeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageDeductionCodeBloc, ManageDeductionCodeState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('addDeductionCodeButton'),
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ManageDeductionCodeBloc>().add(
                        const ManageDeductionCodeEvent.addDeductionCode(),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Add Deduction Code').tr(),
          ),
        );
      },
    );
  }
}
