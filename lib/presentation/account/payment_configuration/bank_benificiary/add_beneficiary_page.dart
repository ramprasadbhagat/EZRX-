import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBeneficiaryPage extends StatelessWidget {
  const AddBeneficiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('addBeneficiary'),
      appBar: AppBar(title: Text('Add Beneficiary'.tr())),
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
          buildWhen: (previous, current) =>
              previous.showErrorMessages != current.showErrorMessages,
          builder: (context, state) {
            return Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: ListView(
                padding: const EdgeInsets.all(25.0),
                children: [
                  _SalesOrgDropdown(state: state),
                  const SizedBox(height: 20),
                  const _SalesDistrictDropdown(),
                  const SizedBox(height: 20),
                  const _BeneficiaryDetailsTextFields(),
                  const SizedBox(height: 20),
                  const _AddBeneficiaryButton(),
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
  const _SalesOrgDropdown({
    Key? key,
    required this.state,
  }) : super(key: key);
  final ManageBankBeneficiaryState state;
  @override
  Widget build(BuildContext context) {
    final salesOrgs = context.read<UserBloc>().state.salesOrgValue;

    return DropdownButtonFormField2<String>(
      key: const Key('salesOrgDropdownKey'),
      isExpanded: true,
      decoration: InputDecoration(
        labelText: context.tr('Select Sales Org'),
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
          : (value) {
              context.read<ManageBankBeneficiaryBloc>().add(
                    ManageBankBeneficiaryEvent.onValueChange(
                      label: BeneficiaryLabel.selectSalesOrg,
                      newValue: value!,
                    ),
                  );
              context.read<ManageBankBeneficiaryBloc>().add(
                    ManageBankBeneficiaryEvent.fetchSalesDistrict(
                      fromAdd: true,
                      salesOrg: SalesOrg(value),
                    ),
                  );
            },
      validator: (_) {
        return context
            .read<ManageBankBeneficiaryBloc>()
            .state
            .beneficiaryData
            .salesOrg
            .value
            .fold(
              (f) => f.maybeMap(
                empty: (_) => 'Please Select Sales Org.'.tr(),
                orElse: () => null,
              ),
              (_) => null,
            );
      },
    );
  }
}

class _SalesDistrictDropdown extends StatelessWidget {
  const _SalesDistrictDropdown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        final district = state.beneficiaryData.salesDistrict;
        final labelText = district.isEmpty
            ? 'No Data Available'.tr()
            : 'Select Sales District'.tr();

        return DropdownButtonFormField2<String>(
          key: const Key('salesDistrictDropdownKey'),
          isExpanded: true,
          decoration: InputDecoration(
            labelText: labelText,
            enabled: district.isNotEmpty,
            contentPadding: const EdgeInsets.fromLTRB(0, 10, 12, 10),
          ),
          value: district.isEmpty ? null : district,
          items: !state.isFetching && state.salesDistrict.isNotEmpty
              ? state.salesDistrict.first.salesDistrictInfo.map(
                  (SalesDistrictInfo val) {
                    return DropdownMenuItem<String>(
                      value: val.salesDistrictHeader.getValue(),
                      child: Text(val.salesDistrictLabel.getValue()),
                    );
                  },
                ).toList()
              : [],
          onChanged: (value) {
            context.read<ManageBankBeneficiaryBloc>().add(
                  ManageBankBeneficiaryEvent.onValueChange(
                    label: BeneficiaryLabel.selectSalesDistrict,
                    newValue: value!,
                  ),
                );
          },
        );
      },
    );
  }
}

class _BeneficiaryDetailsTextFields extends StatelessWidget {
  const _BeneficiaryDetailsTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: const Key('beneficiaryNameField'),
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Beneficiary Name'.tr()),
          onChanged: (value) {
            context.read<ManageBankBeneficiaryBloc>().add(
                  ManageBankBeneficiaryEvent.onValueChange(
                    label: BeneficiaryLabel.beneficiaryName,
                    newValue: value,
                  ),
                );
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('bankNameField'),
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Bank Name'.tr()),
          onChanged: (value) {
            context.read<ManageBankBeneficiaryBloc>().add(
                  ManageBankBeneficiaryEvent.onValueChange(
                    label: BeneficiaryLabel.bankName,
                    newValue: value,
                  ),
                );
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('branchField'),
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Branch'.tr()),
          onChanged: (value) {
            context.read<ManageBankBeneficiaryBloc>().add(
                  ManageBankBeneficiaryEvent.onValueChange(
                    label: BeneficiaryLabel.branch,
                    newValue: value,
                  ),
                );
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('bankCodeField'),
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Bank Code'.tr()),
          onChanged: (value) {
            context.read<ManageBankBeneficiaryBloc>().add(
                  ManageBankBeneficiaryEvent.onValueChange(
                    label: BeneficiaryLabel.bankCode,
                    newValue: value,
                  ),
                );
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('bankAccountField'),
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Bank Account'.tr()),
          onChanged: (value) {
            context.read<ManageBankBeneficiaryBloc>().add(
                  ManageBankBeneficiaryEvent.onValueChange(
                    label: BeneficiaryLabel.bankAccount,
                    newValue: value,
                  ),
                );
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('hdbcSwiftCodeField'),
          autocorrect: false,
          decoration: InputDecoration(labelText: 'hdbc Swift Code'.tr()),
          onChanged: (value) {
            context.read<ManageBankBeneficiaryBloc>().add(
                  ManageBankBeneficiaryEvent.onValueChange(
                    label: BeneficiaryLabel.hdbcSwiftCode,
                    newValue: value,
                  ),
                );
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('bankAddressField'),
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Bank Address'.tr()),
          onChanged: (value) {
            context.read<ManageBankBeneficiaryBloc>().add(
                  ManageBankBeneficiaryEvent.onValueChange(
                    label: BeneficiaryLabel.bankAddress,
                    newValue: value,
                  ),
                );
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('payNowUenField'),
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Pay Now Uen'.tr()),
          onChanged: (value) {
            context.read<ManageBankBeneficiaryBloc>().add(
                  ManageBankBeneficiaryEvent.onValueChange(
                    label: BeneficiaryLabel.payNowUen,
                    newValue: value,
                  ),
                );
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('emailIdField'),
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Email Id'.tr()),
          onChanged: (value) {
            context.read<ManageBankBeneficiaryBloc>().add(
                  ManageBankBeneficiaryEvent.onValueChange(
                    label: BeneficiaryLabel.emailId,
                    newValue: value,
                  ),
                );
          },
          validator: (value) {
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
          },
        ),
      ],
    );
  }
}

class _AddBeneficiaryButton extends StatelessWidget {
  const _AddBeneficiaryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('addBeneficiaryButton'),
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ManageBankBeneficiaryBloc>().add(
                        const ManageBankBeneficiaryEvent.addOrUpdateBeneficiary(
                          isEdit: false,
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
