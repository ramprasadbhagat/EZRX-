import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/add_deduction_code.dart';
import 'package:ezrxmobile/domain/account/entities/amount_type.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/dropdown/generic_dropdown_data.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/generic_dropdown_field.dart';
import 'package:ezrxmobile/presentation/core/generic_text_field.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditDeductionCodePage extends StatelessWidget {
  const EditDeductionCodePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('editDeductionCode'),
      appBar: AppBar(title: const Text('Edit Deduction Code').tr()),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<ManageDeductionCodeBloc, ManageDeductionCodeState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {
                if (!state.isSubmitting && state.response.success) {
                  context.router.pop();
                } else if (state.response != AddDeductionCode.empty()) {
                  showSnackBar(
                    context: context,
                    message: state.response.info.tr(),
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
          },
          buildWhen: (previous, current) =>
              previous.showErrorMessages != current.showErrorMessages ||
              previous.isSubmitting != current.isSubmitting,
          builder: (context, state) {
            final deductionCodeData =
                context.read<ManageDeductionCodeBloc>().state.deductionCodeData;
            final salesOrgList = context.read<UserBloc>().state.salesOrgValue;
            final salesDistrictList = context
                .read<SalesDistrictBloc>()
                .state
                .salesDistrictList
                .firstWhere(
                  (element) => element.salesOrg == deductionCodeData.salesOrg,
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
                    GenericDropdown(
                      labelText: ''.tr(),
                      validator: (_) => null,
                      onChanged: (val) => null,
                      items: salesOrgList
                          .map(
                            (val) => GenericDropdownData(
                              value: val,
                              label: SalesOrg(val).fullName,
                            ),
                          )
                          .toList(),
                      isSubmitting: false,
                      value: deductionCodeData.salesOrg.getOrDefaultValue(''),
                      isDisabled: true,
                    ),
                    const SizedBox(height: 20),
                    GenericDropdown(
                      labelText: 'Select Sales District'.tr(),
                      validator: (_) => null,
                      onChanged: (val) =>
                          context.read<ManageDeductionCodeBloc>().add(
                                ManageDeductionCodeEvent.onValueChange(
                                  label: DeductionCodeLabel.salesDistrict,
                                  newValue: val ?? '',
                                ),
                              ),
                      items: salesDistrictList
                          .map(
                            (district) => GenericDropdownData(
                              value: district
                                  .salesDistrictLabel.displayStringValue,
                              label: district
                                  .salesDistrictLabel.displayStringValue,
                            ),
                          )
                          .toList(),
                      isSubmitting: state.isSubmitting,
                      value:
                          deductionCodeData.salesDistrict.getOrDefaultValue(''),
                    ),
                    const SizedBox(height: 20),
                    GenericTextField(
                      fieldKey: 'deductionCodeTextKey',
                      labelText: 'Deduction Code',
                      validator: (text) => PaymentMethod(text ?? '').value.fold(
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
                                  label: DeductionCodeLabel.deductionCode,
                                  newValue: val ?? '',
                                ),
                              ),
                      isEnabled: !state.isSubmitting,
                      value:
                          deductionCodeData.deductionCode.getOrDefaultValue(''),
                    ),
                    const SizedBox(height: 20),
                    GenericDropdown(
                      labelText: 'Amount Type'.tr(),
                      validator: (_) => deductionCodeData.amountType.value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => 'Please Select amount type.'.tr(),
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                      onChanged: (val) =>
                          context.read<ManageDeductionCodeBloc>().add(
                                ManageDeductionCodeEvent.onValueChange(
                                  label: DeductionCodeLabel.amountType,
                                  newValue: val ?? '',
                                ),
                              ),
                      items: AmountType.values.items,
                      isSubmitting: state.isSubmitting,
                      value: deductionCodeData.amountType.getOrDefaultValue(''),
                    ),
                    const SizedBox(height: 20),
                    GenericTextField(
                      fieldKey: 'deductionDescriptionKey',
                      labelText: 'Deduction Description',
                      validator: (text) => PaymentMethod(text ?? '').value.fold(
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
                              label: DeductionCodeLabel.deductionDescription,
                              newValue: val ?? '',
                            ),
                          ),
                      isEnabled: !state.isSubmitting,
                      value: deductionCodeData.deductionDescription
                          .getOrDefaultValue(''),
                    ),
                    const SizedBox(height: 20),
                    const EditDeductionCodeButton(),
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

class EditDeductionCodeButton extends StatelessWidget {
  const EditDeductionCodeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageDeductionCodeBloc, ManageDeductionCodeState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('editDeductionCodeButton'),
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ManageDeductionCodeBloc>().add(
                        const ManageDeductionCodeEvent.addOrEditDeductionCode(
                          isEdit: true,
                        ),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Edit Deduction Code').tr(),
          ),
        );
      },
    );
  }
}
