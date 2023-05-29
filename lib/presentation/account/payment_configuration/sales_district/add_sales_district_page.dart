import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/add_sales_district/add_sales_district_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSalesDistrictPage extends StatelessWidget {
  const AddSalesDistrictPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('addSalesDistrict'),
      appBar: AppBar(title: const Text('Sales District Details').tr()),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<AddSalesDistrictBloc, AddSalesDistrictState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (success) {
                  showSnackBar(
                    context: context,
                    message: state.addSalesDistrict.message.showUserMessage.tr(),
                  );
                  if (!state.isSubmitting) {
                    context
                        .read<SalesDistrictBloc>()
                        .add(const SalesDistrictEvent.fetch());
                    context.router.pop();
                  }
                },
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.showErrorMessages != current.showErrorMessages,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    _SalesOrgDropdown(state: state),
                    const SizedBox(height: 20),
                    _SalesDistrictHeaderField(),
                    const SizedBox(height: 20),
                    _SalesDistrictLabelField(),
                    const SizedBox(height: 20),
                    const _AddSalesDistrictButton(),
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

class _SalesDistrictHeaderField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSalesDistrictBloc, AddSalesDistrictState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFormField(
          key: const Key('newSalesDistrictHeaderField'),
          autocorrect: false,
          enabled: !state.isSubmitting,
          decoration: InputDecoration(labelText: 'Sales District'.tr()),
          onChanged: (value) => context.read<AddSalesDistrictBloc>().add(
                AddSalesDistrictEvent.salesDistrictHeaderChanged(
                  salesDistrictHeader: StringValue(value),
                ),
              ),
          validator: (text) => StringValue(text!).value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'Sales District cannot be empty.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
        );
      },
    );
  }
}

class _SalesDistrictLabelField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSalesDistrictBloc, AddSalesDistrictState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFormField(
          key: const Key('newSalesDistrictLabelField'),
          autocorrect: false,
          enabled: !state.isSubmitting,
          decoration: InputDecoration(labelText: 'Sales District Label'.tr()),
          onChanged: (value) => context.read<AddSalesDistrictBloc>().add(
                AddSalesDistrictEvent.salesDistrictLabelChanged(
                  salesDistrictLabel: StringValue(value),
                ),
              ),
          validator: (text) => StringValue(text!).value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'Sales District Label cannot be empty.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
        );
      },
    );
  }
}

class _SalesOrgDropdown extends StatelessWidget {
  const _SalesOrgDropdown({
    Key? key,
    required this.state,
  }) : super(key: key);
  final AddSalesDistrictState state;

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
              context.read<AddSalesDistrictBloc>().add(
                    AddSalesDistrictEvent.salesOrgChanged(
                      salesOrg: SalesOrg(value!),
                    ),
                  );
            },
      validator: (_) {
        return context.read<AddSalesDistrictBloc>().state.salesOrg.value.fold(
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

class _AddSalesDistrictButton extends StatelessWidget {
  const _AddSalesDistrictButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSalesDistrictBloc, AddSalesDistrictState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('addSalesDistrictButton'),
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<AddSalesDistrictBloc>().add(
                        const AddSalesDistrictEvent.addSalesDistrict(),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Submit').tr(),
          ),
        );
      },
    );
  }
}
