import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/add_payment_method/add_payment_method_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/manage_payment_method/manage_payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPaymentMethodsPage extends StatelessWidget {
  const AddPaymentMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('addPaymentMethod'),
      appBar: AppBar(title: const Text('Add Payment Method').tr()),
      body: BlocConsumer<AddPaymentMethodBloc, AddPaymentMethodState>(
        listenWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {
              if (!state.isSubmitting) {
                context
                    .read<PaymentMethodsBloc>()
                    .add(const PaymentMethodsEvent.fetch());
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
          return AnnouncementBanner(
            currentPath: context.router.currentPath,
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
                    _PaymentMethodField(),
                    const SizedBox(height: 20),
                    const AddPaymentMethodButton(),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PaymentMethodField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFormField(
          key: const Key('newPaymentMethodField'),
          autocorrect: false,
          enabled: !state.isSubmitting,
          decoration: InputDecoration(labelText: 'New Payment Method'.tr()),
          onChanged: (value) => context.read<AddPaymentMethodBloc>().add(
                AddPaymentMethodEvent.paymentMethodChanged(
                  paymentMethod: value,
                ),
              ),
          validator: (text) => PaymentMethod(text!).value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'Payment method cannot be empty.'.tr(),
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
  final AddPaymentMethodState state;

  @override
  Widget build(BuildContext context) {
    final salesOrgs = context.read<UserBloc>().state.salesOrgValue;

    return DropdownButtonFormField2<String>(
      key: const Key('salesOrgDropdownKey'),
      isExpanded: true,
      decoration: InputDecoration(
        labelText: 'Select Sales Org'.tr(),
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
            child: Text('$val - ${SalesOrg(val).buName}'),
          );
        },
      ).toList(),
      onChanged: state.isSubmitting
          ? null
          : (value) {
              context.read<AddPaymentMethodBloc>().add(
                    AddPaymentMethodEvent.salesOrgChanged(
                      salesOrg: value!,
                    ),
                  );
            },
      validator: (_) {
        return context.read<AddPaymentMethodBloc>().state.salesOrg.value.fold(
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

class AddPaymentMethodButton extends StatelessWidget {
  const AddPaymentMethodButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPaymentMethodBloc, AddPaymentMethodState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('addPaymentMethodButton'),
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<AddPaymentMethodBloc>().add(
                        const AddPaymentMethodEvent.addPaymentMethod(),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Add Payment Method').tr(),
          ),
        );
      },
    );
  }
}
