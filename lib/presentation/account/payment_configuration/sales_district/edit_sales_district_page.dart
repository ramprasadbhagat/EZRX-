import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSalesDistrictPage extends StatelessWidget {
  const EditSalesDistrictPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('salesDistrictDetails'),
      appBar: AppBar(title: const Text('Sales District Details').tr()),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<SalesDistrictBloc, SalesDistrictState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting &&
              !current.isSubmitting,
          listener: (context, manageSalesDistrictState) {
            manageSalesDistrictState.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {},
                (success) {
                  context.router.pop();
                },
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.showErrorMessages != current.showErrorMessages ||
              previous.isSubmitting != current.isSubmitting,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    _SalesOrgDropdown(),
                    const SizedBox(height: 20),
                    _SalesDistrictHeaderField(),
                    const SizedBox(height: 20),
                    _SalesDistrictLabelField(),
                    const SizedBox(height: 20),
                    _EditSalesDistrictButton(),
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
    return BlocBuilder<SalesDistrictBloc, SalesDistrictState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.selectedSalesDistrictInfo.salesDistrictHeader
              .getOrDefaultValue(''),
          key: const Key('newSalesDistrictLabelField'),
          autocorrect: false,
          enabled: !state.isSubmitting,
          decoration: InputDecoration(labelText: 'Sales District'.tr()),
          onChanged: (value) => context.read<SalesDistrictBloc>().add(
                SalesDistrictEvent.onValueChange(
                  field: SalesDistrictField.salesDistrictHeader,
                  value: value,
                ),
              ),
          validator: (text) => StringValue(text ?? '').value.fold(
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
    return BlocBuilder<SalesDistrictBloc, SalesDistrictState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.selectedSalesDistrictInfo.salesDistrictLabel
              .getOrDefaultValue(''),
          key: const Key('newSalesDistrictLabelField'),
          autocorrect: false,
          enabled: !state.isSubmitting,
          decoration: InputDecoration(labelText: 'Sales District Label'.tr()),
          onChanged: (value) => context.read<SalesDistrictBloc>().add(
                SalesDistrictEvent.onValueChange(
                  field: SalesDistrictField.salesDistrictLabel,
                  value: value,
                ),
              ),
          validator: (text) => StringValue(text ?? '').value.fold(
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
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      key: const Key('salesOrgDropdownKey'),
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(0, 10, 12, 10),
        labelText: context
            .read<SalesDistrictBloc>()
            .state
            .selectedSalesOrg
            .getOrDefaultValue(''),
      ),
      onChanged: null,
      items: const [],
    );
  }
}

class _EditSalesDistrictButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesDistrictBloc, SalesDistrictState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('editSalesDistrictButton'),
          onPressed: state.isSubmitting
              ? null
              : () => _editSubmitButtonClicked(context),
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Submit').tr(),
          ),
        );
      },
    );
  }

  void _editSubmitButtonClicked(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<SalesDistrictBloc>().add(
          const SalesDistrictEvent.edit(),
        );
  }
}
