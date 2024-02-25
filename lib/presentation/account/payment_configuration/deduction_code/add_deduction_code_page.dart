import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code_bloc.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

class AddDeductionCodePage extends StatelessWidget {
  const AddDeductionCodePage({Key? key}) : super(key: key);

  void _handleListener({
    required BuildContext context,
    required ManageDeductionCodeState state,
  }) {
    state.failureOrSuccessOption.fold(
      () {
        if (!state.isSubmitting && state.response.success) {
          context.router.pop();
        } else {
          if (state.response != AddDeductionCode.empty()) {
            CustomSnackBar(
              messageText: state.response.info.tr(),
            ).show(context);
          } else {
            final salesDistrict = SalesDistrict.empty();
            context.read<ManageDeductionCodeBloc>().add(
                  ManageDeductionCodeEvent.onValueChange(
                    label: DeductionCodeLabel.salesDistrict,
                    newValue: salesDistrict.emptyOrFirstElementLabel,
                  ),
                );
          }
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
              previous.isSubmitting != current.isSubmitting,
          builder: (context, state) {
            final salesOrgList = context.read<UserBloc>().state.salesOrgValue;
            final salesDistrictList = SalesDistrict.empty().salesDistrictInfo;
            final deductionCodeData =
                context.read<ManageDeductionCodeBloc>().state.deductionCodeData;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    GenericDropdown(
                      key: const Key('salesOrgDropdownKey'),
                      labelText: context.tr('Select Sales Org'),
                      validator: (_) => deductionCodeData.salesOrg.value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => 'Please Select Sales Org.'.tr(),
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                      onChanged: (val) =>
                          context.read<ManageDeductionCodeBloc>().add(
                                ManageDeductionCodeEvent.onValueChange(
                                  label: DeductionCodeLabel.salesOrg,
                                  newValue: val ?? '',
                                ),
                              ),
                      items: salesOrgList
                          .map(
                            (val) => GenericDropdownData(
                              value: val,
                              label: SalesOrg(val).fullName,
                            ),
                          )
                          .toList(),
                      isSubmitting: state.isSubmitting,
                      value: deductionCodeData.salesOrg.getOrDefaultValue(''),
                    ),
                    const SizedBox(height: 20),
                    GenericDropdown(
                      key: const Key('salesDistrictDropdownKey'),
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
                                  .salesDistrictLabel.displayDashIfEmpty,
                              label: district
                                  .salesDistrictLabel.displayDashIfEmpty,
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
                      labelText: 'Deduction Code'.tr(),
                      validator: (text) =>
                          deductionCodeData.deductionCode.value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => 'Deduction code cannot be empty.'.tr(),
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
                      key: const Key('amountTypeKey'),
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
                      labelText: 'Deduction Description'.tr(),
                      validator: (text) =>
                          deductionCodeData.deductionDescription.value.fold(
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
                        const ManageDeductionCodeEvent.addOrEditDeductionCode(
                          isEdit: false,
                        ),
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
