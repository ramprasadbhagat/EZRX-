import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/add_beneficiary/add_beneficiary_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBeneficiaryPage extends StatelessWidget {
  const AddBeneficiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Beneficiary'.tr())),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<AddBeneficiaryBloc, AddBeneficiaryState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {
                if (!state.isSubmitting) {
                  context
                      .read<BankBeneficiaryBloc>()
                      .add(const BankBeneficiaryEvent.fetch());
                  context.router.pop();
                }
              },
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (success) {},
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.showErrorMessages != current.showErrorMessages,
          builder: (context, state) {
            return SingleChildScrollView(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    autovalidateMode: state.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
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
                  ),
                ),
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
  final AddBeneficiaryState state;
  @override
  Widget build(BuildContext context) {
    final salesOrgs = context.read<UserBloc>().state.salesOrgValue;

    return DropdownButtonFormField<String>(
      key: const Key('salesOrgDropdownKey'),
      isExpanded: true,
      decoration: InputDecoration(
        labelText: 'Select Sales Org'.tr(),
      ),
      icon: state.isSubmitting
          ? const SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : null,
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
              context.read<AddBeneficiaryBloc>().add(
                    AddBeneficiaryEvent.onValueChange(
                      label: AddBeneficiaryLabel.selectSalesOrg,
                      newValue: value!,
                    ),
                  );
              context.read<AddBeneficiaryBloc>().add(
                    AddBeneficiaryEvent.fetchSalesDistrict(
                      salesOrg: SalesOrg(value),
                    ),
                  );
            },
      validator: (_) {
        return context
            .read<AddBeneficiaryBloc>()
            .state
            .addBeneficiaryData
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
    return BlocBuilder<AddBeneficiaryBloc, AddBeneficiaryState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        final district = state.addBeneficiaryData.salesDistrict;
        final labeltext = district.isEmpty
            ? 'No Data Available'.tr()
            : 'Select Sales District'.tr();

        return DropdownButtonFormField<String>(
          key: const Key('salesDistrictDropdownKey'),
          isExpanded: true,
          decoration: InputDecoration(
              labelText: labeltext, 
              enabled: district.isNotEmpty,
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
            context
                .read<AddBeneficiaryBloc>()
                .add(AddBeneficiaryEvent.onValueChange(
                  label: AddBeneficiaryLabel.selectSalesDistrict,
                  newValue: value!,
                ));
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
          decoration: InputDecoration(labelText: 'Beneficiary Name'.tr()),
          onChanged: (value) {
            context
                .read<AddBeneficiaryBloc>()
                .add(AddBeneficiaryEvent.onValueChange(
                  label: AddBeneficiaryLabel.beneficiaryName,
                  newValue: value,
                ));
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('bankNameField'),
          decoration: InputDecoration(labelText: 'Bank Name'.tr()),
          onChanged: (value) {
            context
                .read<AddBeneficiaryBloc>()
                .add(AddBeneficiaryEvent.onValueChange(
                  label: AddBeneficiaryLabel.bankName,
                  newValue: value,
                ));
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('branchField'),
          decoration: InputDecoration(labelText: 'Branch'.tr()),
          onChanged: (value) {
            context
                .read<AddBeneficiaryBloc>()
                .add(AddBeneficiaryEvent.onValueChange(
                  label: AddBeneficiaryLabel.branch,
                  newValue: value,
                ));
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('bankCodeField'),
          decoration: InputDecoration(labelText: 'Bank Code'.tr()),
          onChanged: (value) {
            context
                .read<AddBeneficiaryBloc>()
                .add(AddBeneficiaryEvent.onValueChange(
                  label: AddBeneficiaryLabel.bankCode,
                  newValue: value,
                ));
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('bankAccountField'),
          decoration: InputDecoration(labelText: 'Bank Account'.tr()),
          onChanged: (value) {
            context
                .read<AddBeneficiaryBloc>()
                .add(AddBeneficiaryEvent.onValueChange(
                  label: AddBeneficiaryLabel.bankAccount,
                  newValue: value,
                ));
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('hdbcSwiftCodeField'),
          decoration: InputDecoration(labelText: 'hdbc Swift Code'.tr()),
          onChanged: (value) {
            context
                .read<AddBeneficiaryBloc>()
                .add(AddBeneficiaryEvent.onValueChange(
                  label: AddBeneficiaryLabel.hdbcSwiftCode,
                  newValue: value,
                ));
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('bankAddressField'),
          decoration: InputDecoration(labelText: 'Bank Address'.tr()),
          onChanged: (value) {
            context
                .read<AddBeneficiaryBloc>()
                .add(AddBeneficiaryEvent.onValueChange(
                  label: AddBeneficiaryLabel.bankAddress,
                  newValue: value,
                ));
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('payNowUenField'),
          decoration: InputDecoration(labelText: 'Pay Now Uen'.tr()),
          onChanged: (value) {
            context
                .read<AddBeneficiaryBloc>()
                .add(AddBeneficiaryEvent.onValueChange(
                  label: AddBeneficiaryLabel.payNowUen,
                  newValue: value,
                ));
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          key: const Key('emailIdField'),
          decoration: InputDecoration(labelText: 'Email Id'.tr()),
          onChanged: (value) {
            context.read<AddBeneficiaryBloc>().add(
                  AddBeneficiaryEvent.onValueChange(
                    label: AddBeneficiaryLabel.emailId,
                    newValue: value,
                  ),
                );
          },
          validator: (value) {
            return context
                .read<AddBeneficiaryBloc>()
                .state
                .addBeneficiaryData
                .emailId
                .value
                .fold(
                (f) => f.maybeMap(
                  invalidEmail: (_) =>'Email is invalid'.tr(),
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
    return BlocBuilder<AddBeneficiaryBloc, AddBeneficiaryState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('addBeneficiaryButton'),
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<AddBeneficiaryBloc>().add(
                        const AddBeneficiaryEvent.addBankBeneficiary(),
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
